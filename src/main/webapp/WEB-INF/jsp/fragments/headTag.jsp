<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!--
NextGen :: The header tag
-->
<%@ page isELIgnored="false"%>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>NextGen</title>

 	<c:set var="nextCss" value="/resources/css/nextgen.css" />
    <link href="${nextCss}" rel="stylesheet"/>    
   
    <c:set var="jQuery" value="/resources/javascript/jquery-2.1.0.js"> </c:set>
    <script src="${jQuery}"></script>
    
</head>


