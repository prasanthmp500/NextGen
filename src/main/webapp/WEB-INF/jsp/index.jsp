<!DOCTYPE html> 

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html lang="en">

<head> 
	
    <title>NextGen</title>
    
      <jsp:include page="../jsp/fragments/headTag.jsp"/>
      
  </head>

<body>


<form action="<c:url value="/signin/facebook/" />" method="POST">
    <input type="hidden" name="scope" value="email,publish_stream,offline_access" />	
    <button type="submit">Sign in with Facebook</button>    
</form>



</body>

<%-- 
    String redirectUrl = request.getContextPath().concat("/home");
	response.sendRedirect(redirectUrl); 
	
--%>

</html>
