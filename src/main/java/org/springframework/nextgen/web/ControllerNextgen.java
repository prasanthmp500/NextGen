package org.springframework.nextgen.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/test")
public class ControllerNextgen {

	
	public ControllerNextgen() {
	}

	@RequestMapping(value="/hello",method=RequestMethod.GET)
	public String getHello(){
		return "test/test";
	}
	

}
