package org.springframework.nextgen.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.codec.Base64;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.facebook.api.ImageType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	
	
	
	@Autowired
	private  Facebook facebook;
	

	
	
	@RequestMapping(value="/home", method=RequestMethod.GET)
	public ModelAndView showHome(){
	
		
	
	
		  Map model  = new HashMap();
		
		
		 
	
		
		if(facebook.userOperations().getUserProfile()!=null){
			model.put("profilename", facebook.userOperations().getUserProfile().getName());
			
			//byte[] encodedImage = Base64.encode( facebook.userOperations().getUserProfileImage());
		//	String photo  = "data:image/png,base64;" + new String(facebook.userOperations().getUserProfileImage());
			// <c:out value="${profile.id}"
			
			String photo = "http://graph.facebook.com/"+facebook.userOperations().getUserProfile().getId()+"/picture?height=200&type=normal&width=200";
			
			
			model.put("image", photo);
			
			
			
			//mav.addObject("profile", facebook.userOperations().getUserProfile());
		}
		
		ModelAndView mav = new ModelAndView("home/home","mymap", model);
		
		return mav;
	}
	
}
