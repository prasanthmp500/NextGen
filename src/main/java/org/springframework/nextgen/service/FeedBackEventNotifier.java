package org.springframework.nextgen.service;

import io.iron.ironmq.Client;
import io.iron.ironmq.Cloud;
import io.iron.ironmq.Message;
import io.iron.ironmq.Queue;

import java.io.IOException;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.context.ApplicationListener;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.nextgen.model.Question;
import org.springframework.nextgen.model.Questionnaire;
import org.springframework.nextgen.utils.Utils;

import com.google.gson.Gson;

public class FeedBackEventNotifier implements ApplicationListener<FeedBackEvent>{
	
	private JavaMailSender mailSender;
	
	private SimpleMailMessage mailMessage;
	
	private Client client;
	
	private Queue queue;
	
	private Gson gson;

	public JavaMailSender getMailSender() {
		return mailSender;
	}

	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}

	public SimpleMailMessage getMailMessage() {
		return mailMessage;
	}

	public void setMailMessage(SimpleMailMessage mailMessage) {
		this.mailMessage = mailMessage;
	}

	public Client getClient() {
		return this.client;
	}

	public void setClient(Client client) {
		this.client = client;
	}

	public Queue getQueue() {
		return this.queue;
	}

	public void setQueue(Queue queue) {
		this.queue = queue;
	}

	public Gson getGson() {
		return this.gson;
	}

	public void setGson(Gson gson) {
		this.gson = gson;
	}
	
	public FeedBackEventNotifier (){
		this.client = new Client(Utils.PROJECT_ID, Utils.TOKEN, Cloud.ironAWSUSEast);
		this.queue = this.client.queue(Utils.QUEUE_NAME);
		this.gson = new Gson();
	}
	

	
	@Override
	public void onApplicationEvent(FeedBackEvent event) {
	
		Message msg;
		try {
			msg = this.queue.get();
			Questionnaire questionnaire =	gson.fromJson(msg.toString(), Questionnaire.class); 
			this.queue.deleteMessage(msg);
			sendEmail(questionnaire);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException exception) {
			
		}
		
		
	}

	private void sendEmail(Questionnaire questionnaire ) throws MessagingException {
		
		
		
		SimpleMailMessage msg = new SimpleMailMessage(this.mailMessage);
		MimeMessage mime = mailSender.createMimeMessage();
		// use the true flag to indicate you need a multipart message
		MimeMessageHelper helper = new MimeMessageHelper(mime, true);
		helper.setTo(this.mailMessage.getTo());
		helper.setFrom(this.mailMessage.getFrom());
		helper.setSubject(this.mailMessage.getSubject());
		helper.setText(getHtmlText(questionnaire), true);
		
		// msg.setText(getHtmlText(questionnaire));
        try{
        	
            this.mailSender.send(mime);
        }
        catch(MailException ex) {
            System.err.println(ex.getMessage());            
        }
		
	}

	private String getHtmlText(Questionnaire questionnaire) {
		
		StringBuffer sbf = new StringBuffer();
		
		List<Question> questions = questionnaire.getFeedback();
		
		sbf.append("<html><body><table border='1'>");
		
		sbf.append("<tr>");
		sbf.append("<td colspan='3'>");
		sbf.append(questionnaire.getUserProfile());
		sbf.append("</td>");
		sbf.append("</tr>");
		
		int count  = 0;
		int usabilityRating = 0;
		for(Question question : questions){
			
			sbf.append("<tr>");
			sbf.append("<td>"+ ++count +"</td>");
			sbf.append("<td>"+ question.getQuestion() +"</td>");
			sbf.append("<td>"+ question.getValue() +"</td>");
			sbf.append("</tr>");
			
			if( (question.getOrder() %2) == 0 ) {
				usabilityRating = usabilityRating +  (5 - Integer.parseInt(question.getValue())); // 5 - score
				
			} else {
				usabilityRating = usabilityRating +  (Integer.parseInt(question.getValue()) - 1); // score -1 
			}
			
		}
		
		sbf.append("<tr>");
		sbf.append("<td colspan='2'> </td>");
		sbf.append("<td>"+ usabilityRating * 2.5 +"</td>");
		sbf.append("</tr>");
		sbf.append("</table></body></html>");
		return sbf.toString();
	}
	

}
