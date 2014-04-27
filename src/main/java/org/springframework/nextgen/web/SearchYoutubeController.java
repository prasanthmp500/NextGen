package org.springframework.nextgen.web;

import org.springframework.nextgen.utils.Utils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

@Controller
@RequestMapping(value="/searchYoutube")
public class SearchYoutubeController {


   @RequestMapping(value="/playlist/{artistname}", method=RequestMethod.GET)
   @ResponseBody
   public String searchPlayList(@PathVariable String artistname){
	   RestTemplate restTemplate = new RestTemplate();
	   StringBuffer sbf = new StringBuffer("https://www.googleapis.com/youtube/v3/search?part=snippet");
	   sbf.append("&");
	   sbf.append("maxResults=1");
	   sbf.append("&");
	   sbf.append("order=relevance");
	   sbf.append("&");
	   sbf.append("q="+artistname);
	   sbf.append("&");
	   sbf.append("type=playlist");
	   sbf.append("&");
	   sbf.append("key="+Utils.YOU_TUBE_API_KEY);
	   String jsonresult = restTemplate.getForObject(sbf.toString(), String.class);
	   return jsonresult;
   }
   
   
   @RequestMapping(value="/loadPlaylistItem/{playlistId}", method=RequestMethod.GET)
   @ResponseBody
   public String loadPlayListItem(@PathVariable String playlistId){
	   RestTemplate restTemplate = new RestTemplate();
	   StringBuffer sbf = new StringBuffer("https://www.googleapis.com/youtube/v3/playlistItems?part=snippet");
	   sbf.append("&");
	   sbf.append("playlistId="+playlistId);
	   sbf.append("&");
	   sbf.append("key="+Utils.YOU_TUBE_API_KEY);
	   String jsonresult = restTemplate.getForObject(sbf.toString(), String.class);
	   return jsonresult;
   }
   

   
   @RequestMapping(value="/searchMovieTrailer/{videotrailer}", method=RequestMethod.GET)
   @ResponseBody
   public String searchMovieTrailer(@PathVariable String videotrailer){
	   RestTemplate restTemplate = new RestTemplate();
	   StringBuffer sbf = new StringBuffer("https://www.googleapis.com/youtube/v3/search?part=snippet");
	   sbf.append("&");
	   sbf.append("maxResults=1");
	   sbf.append("&");
	   sbf.append("order=relevance");
	   sbf.append("&");
	   sbf.append("q="+videotrailer.concat(" trailer"));
	   sbf.append("&");
	   sbf.append("type=video");
	   sbf.append("&");
	   sbf.append("key="+Utils.YOU_TUBE_API_KEY);
	   String jsonresult = restTemplate.getForObject(sbf.toString(), String.class);
	   return jsonresult;
   }
   
   

}
