package org.springframework.nextgen.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import io.iron.ironmq.Client;
import io.iron.ironmq.Cloud;
import io.iron.ironmq.Queue;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.nextgen.model.Question;
import org.springframework.nextgen.model.Questionnaire;
import org.springframework.nextgen.service.FeedBackEvent;
import org.springframework.nextgen.service.FeedBackPublisher;
import org.springframework.nextgen.utils.QuestionnaireUtils;
import org.springframework.nextgen.utils.Utils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.google.gson.Gson;

@Controller
@RequestMapping(value="/feedback")
public class NextGenFeedBackFormController {
	
	private Client client;
	
	private Queue queue; 
	
	private Gson gson1;
	
	@Autowired
	private FeedBackPublisher feedBackPublisher;
	
	
	public NextGenFeedBackFormController (){
		client = new Client(Utils.PROJECT_ID, Utils.TOKEN, Cloud.ironAWSUSEast);
		queue = client.queue(Utils.QUEUE_NAME);
		gson1 = new Gson();
	}
	
    public FeedBackPublisher getFeedBackPublisher() {
    	return feedBackPublisher;
    }

	public void setFeedBackPublisher(FeedBackPublisher feedBackPublisher) {
		this.feedBackPublisher = feedBackPublisher;
	}

    @RequestMapping(method = RequestMethod.POST)
    @ResponseStatus(value = HttpStatus.OK)
    public void processFeedBack(HttpServletRequest request) {

     Questionnaire questionnaire = (buildQuestionnaire(request));
      String messageToPush = gson1.toJson(questionnaire);
      try {
    	  String id = queue.push(messageToPush);
    	  feedBackPublisher.publishFeedBack(new FeedBackEvent(this));    	  
      } catch (IOException e) {
		
		e.printStackTrace();
      }
    	
    }

	private Questionnaire buildQuestionnaire(HttpServletRequest request) {
		List<Question> questions = new ArrayList<Question>();
		questions.add(new Question(QuestionnaireUtils.QUESTION_1,  request.getParameter("rb1"), 1));
		questions.add(new Question(QuestionnaireUtils.QUESTION_2,  request.getParameter("rb2"), 2));
		questions.add(new Question(QuestionnaireUtils.QUESTION_3,  request.getParameter("rb3"), 3));
		questions.add(new Question(QuestionnaireUtils.QUESTION_4,  request.getParameter("rb2"), 4));
		questions.add(new Question(QuestionnaireUtils.QUESTION_5,  request.getParameter("rb5"), 5));
		questions.add(new Question(QuestionnaireUtils.QUESTION_6,  request.getParameter("rb6"), 6));
		questions.add(new Question(QuestionnaireUtils.QUESTION_7,  request.getParameter("rb7"), 7));
		questions.add(new Question(QuestionnaireUtils.QUESTION_8,  request.getParameter("rb8"), 8));
		questions.add(new Question(QuestionnaireUtils.QUESTION_9,  request.getParameter("rb9"), 9));
		questions.add(new Question(QuestionnaireUtils.QUESTION_10, request.getParameter("rb10"), 10));
		// null for comments as no comment input box in the feedback form
		Questionnaire questionnaire = new Questionnaire(request.getParameter("profileName"),questions, null); 
		
		
		return questionnaire;
	}
	
	
}
