import org.springframework.nextgen.web.HomeController;

import junit.framework.TestCase;


public class HomeControllerTest extends TestCase {


	 @Test
	   public void testHelloController() {
	       HomeController c= new HomeController();
	       ModelAndView mav= c.handleRequest();
	       Assert.assertEquals("hello", mav.getViewName());
	     
	   }

}
