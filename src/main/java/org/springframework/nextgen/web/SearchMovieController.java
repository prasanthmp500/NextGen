package org.springframework.nextgen.web;

import org.springframework.nextgen.utils.Utils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

@Controller
@RequestMapping(value="/searchMovie")
public class SearchMovieController {
	
	
	   @RequestMapping(value="/search/{moviename}", method=RequestMethod.GET)
	   @ResponseBody
	   public String searchPlayList(@PathVariable String moviename){
		   RestTemplate restTemplate = new RestTemplate();
		   StringBuffer sbf = new StringBuffer("http://api.rottentomatoes.com/api/public/v1.0/movies.json?page_limit=50");
		   sbf.append("&");
		   sbf.append("apikey="+Utils.ROTTEN_TOMATOES_API_KEY);
		   sbf.append("&");
		   sbf.append("q="+moviename);
		   String jsonresult = restTemplate.getForObject(sbf.toString(), String.class);
		   return jsonresult;
	   }
	
	
	

}
