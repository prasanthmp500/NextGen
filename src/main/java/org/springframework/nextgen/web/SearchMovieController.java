package org.springframework.nextgen.web;

import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.nextgen.utils.Utils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.google.gson.Gson;

@Controller
@RequestMapping(value="/searchMovie")
public class SearchMovieController {
	
	
	   @RequestMapping(value="/search/{moviename}", method=RequestMethod.GET)
	   @ResponseBody
	   public String searchMovies(@PathVariable String moviename){
		   RestTemplate restTemplate = new RestTemplate();
		   StringBuffer sbf = new StringBuffer("http://api.rottentomatoes.com/api/public/v1.0/movies.json?page_limit=50");
		   sbf.append("&");
		   sbf.append("apikey="+Utils.ROTTEN_TOMATOES_API_KEY);
		   sbf.append("&");
		   sbf.append("q="+moviename);
		   String jsonresult = restTemplate.getForObject(sbf.toString(), String.class);
		   Gson gson = new Gson();
		   LinkedHashMap hashMap = gson.fromJson(jsonresult, LinkedHashMap.class);
		   List<LinkedHashMap> movies= (List<LinkedHashMap>) hashMap.get("movies");
		   String imdbUrl = "http://www.omdbapi.com/?i=tt";
		   for(LinkedHashMap map : movies ){
			    if( map.get("alternate_ids")!=null){ 
			    	String imdbId = (String) ((LinkedHashMap) map.get("alternate_ids")).get("imdb"); 
			    	String imdbMovieData = restTemplate.getForObject(imdbUrl.concat(imdbId), String.class);
			    	map.put("imdbInfo", imdbMovieData);
			    }
		   }
		   
		   hashMap.put("movies",movies);
		   return gson.toJson(hashMap);
	   }
	
	
	

}
