package org.springframework.nextgen.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;


// This is just a test

@Controller
@RequestMapping("/test")
public class ControllerNextgen {

	
	public ControllerNextgen() {
	}

	@RequestMapping(value="/hello",method=RequestMethod.GET)
	public ModelAndView getHello(){
	
		String url = "http://ws.audioscrobbler.com/2.0/?method=artist.getsimilar&artist=cher&api_key=3b0a68e77d37c16e8862d3f095b14013&format=json";
		
		Map<String, String> vars = new HashMap<String, String>();
		vars.put("user", "rs");
		vars.put("artist", "metallica");
		
		RestTemplate restTemplate = new RestTemplate();	
		String result = restTemplate.getForObject(url, String.class, vars);

		
	    ModelAndView mav = new ModelAndView("test/test");
	    mav.addObject("jsonresult", result);
		
		return mav;
	}
	
	
	
	
	

}
