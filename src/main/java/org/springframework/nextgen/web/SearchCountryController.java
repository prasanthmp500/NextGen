package org.springframework.nextgen.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.nextgen.model.Country;
import org.springframework.nextgen.utils.CountryCityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value="/searchCountry")
public class SearchCountryController {

	 @RequestMapping(value="/search/{cityName}", method=RequestMethod.GET)
	   @ResponseBody
	   public Country searchCountryInfo(@PathVariable String cityName, HttpServletRequest req){
		   return getCountry(cityName,req);
	   }
	
	 
	  private Country getCountry(String cityOrCountryName,HttpServletRequest req){
		 Country country = CountryCityUtils.getCountry(cityOrCountryName);
		 if(country!=null){
			 
			 String url = req.getRequestURL().toString();
			 String baseURL = url.substring(0, url.length() - req.getRequestURI().length()) + req.getContextPath() + "/";
			 String imageUrl = baseURL+"resources/images/countryflagsmall/"+country.getName()+".png";
			 country.setImageUrl(imageUrl);
		 } 
		 return country;
	  }
	 
	
}
