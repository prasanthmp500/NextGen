package org.springframework.nextgen.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;


@Controller
@RequestMapping(value="/search")
public class SearchMusicController {

	
   private String LAST_FM_API_KEY = "3b0a68e77d37c16e8862d3f095b14013";	
	
   public SearchMusicController() {}
	
   
   @RequestMapping(value="/artist/{artistname}", method=RequestMethod.GET)
   @ResponseBody
   public String searchArtist(@PathVariable String artistname){
	   RestTemplate restTemplate = new RestTemplate();
	   StringBuffer sbf = new StringBuffer("http://ws.audioscrobbler.com/2.0/?method=artist.search");
	   sbf.append("&");
	   sbf.append("artist=".concat(artistname));
	   sbf.append("&");
	   sbf.append("api_key=".concat(LAST_FM_API_KEY));
	   sbf.append("&");
	   sbf.append("format=json");
	   String jsonresult = restTemplate.getForObject(sbf.toString(), String.class);
	   return jsonresult;
   }
   
	
}
