<!DOCTYPE html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!--
NextGen :: The header tag
-->
<%@ page isELIgnored="false"%>


    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>NextGen</title>
    
    
    

 	<c:set var="nextCss" value="/resources/css/nextgen.css" />
    <link type="text/css" href="<%= request.getContextPath()%>${nextCss}" rel="stylesheet"/>    
    
    
    
     <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
  	 <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
     <script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
   
    <!-- jquery ui
      
    <c:set var="jQuery" value="/resources/javascript/jquery-2.1.0.min.js"> </c:set>
    <script src="<%= request.getContextPath()%>${jQuery}"></script>
    
    
    <c:set var="jqueryUiJs" value="/resources/javascript/jquery-1.10.2.js"> </c:set>
    <script src="<%= request.getContextPath()%>${jqueryUiJs}"></script>
        
    <c:set var="jqueryUiJs" value="/resources/javascript/jquery-ui.js"> </c:set>
    <script src="<%= request.getContextPath()%>${jqueryUiJs}"></script>
    
    <c:set var="jqueryUiCss" value="/resources/css/jquery-ui.css"> </c:set> 
    <link type="text/css" href="<%= request.getContextPath()%>${jqueryUiCss}" rel="stylesheet"></script>
    
   -->
    


