
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>

<head> 
	
  <jsp:include page="../jsp/fragments/headTag.jsp"/>
    <c:set var="nextCss" value="/resources/css/nextgen.css" />
    <link type="text/css" href="<%= request.getContextPath()%>${nextCss}" rel="stylesheet"/>  
  </head>
  
<body>



<form action="<c:url value="/signin/facebook" />" method="POST">
    <input type="hidden" name="scope" value="email,publish_stream,offline_access" />	
    <button type="submit">Sign in with Facebook</button>    
</form>
 

</body>

</html>