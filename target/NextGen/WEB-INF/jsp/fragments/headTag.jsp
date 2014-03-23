


<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!--
NextGen :: The header tag

-->
<%@ page isELIgnored="false"%>



    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1.0, maximum-scale=1.0">
    
    <title>NextGen</title>

 	<c:set var="nextCss" value="/resources/css/nextgen.css" />
    <link type="text/css" href="<%= request.getContextPath()%>${nextCss}" rel="stylesheet"/>    
    
    
    
     <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
  	 <script src="http://code.jquery.com/jquery-1.10.1.js"></script>
     <script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
         
    <c:set var="killerCarouselJS" value="/resources/javascript/killercarousel.js"> </c:set>
    <script src="<%= request.getContextPath()%>${killerCarouselJS}"></script>
   
    <c:set var="killerCarouselCss" value="/resources/css/killercarousel.css"> </c:set> 
    <link type="text/css" href="<%= request.getContextPath()%>${killerCarouselCss}" rel="stylesheet">
   
    <!-- jquery ui
      
    <c:set var="jQuery" value="/resources/javascript/jquery-2.1.0.min.js"> </c:set>
    <script src="<%= request.getContextPath()%>${jQuery}"></script>
    
    
    <c:set var="jqueryUiJs" value="/resources/javascript/jquery-1.10.2.js"> </c:set>
    <script src="<%= request.getContextPath()%>${jqueryUiJs}"></script>
        
    <c:set var="jqueryUiJs" value="/resources/javascript/jquery-ui.js"> </c:set>
    <script src="<%= request.getContextPath()%>${jqueryUiJs}"></script>
    
    <c:set var="jqueryUiCss" value="/resources/css/jquery-ui.css"> </c:set> 
    <link type="text/css" href="<%= request.getContextPath()%>${jqueryUiCss}" rel="stylesheet">
    
   -->
    
	<link rel="stylesheet" href="https://jqueryui.com/jquery-wp-content/themes/jqueryui.com/style.css">

	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCvv1yvsXQiqYrkh_XQBo8TVKuRlaYqjSk&sensor=false"></script>
	
	<!-- for the slice box	 -->	
	
	
	<c:set var="sliceBoxCss1" value="/resources/css/slicebox.css"> </c:set> 
    <link type="text/css" href="<%= request.getContextPath()%>${sliceBoxCss1}" rel="stylesheet">
	
	<c:set var="sliceBoxCss2" value="/resources/css/sliceboxcustom.css"> </c:set> 
    <link type="text/css" href="<%= request.getContextPath()%>${sliceBoxCss2}" rel="stylesheet">
	
	<c:set var="sliceBoxCss3" value="/resources/css/sliceboxdemo.css"> </c:set> 
    <link type="text/css" href="<%= request.getContextPath()%>${sliceBoxCss3}" rel="stylesheet">
    
    
    <c:set var="sliceBoxJS1" value="/resources/javascript/slicebox.modernizr.custom.46884.js"> </c:set>
    <script src="<%= request.getContextPath()%>${sliceBoxJS1}"></script>
   
    <c:set var="sliceBoxJS2" value="/resources/javascript/jquery.slicebox.js"> </c:set>
    <script src="<%= request.getContextPath()%>${sliceBoxJS2}"></script> 
    
    <!-- end of slice box -->
    
    <c:set var="waterWheelCarouselJS" value="/resources/javascript/jquery.waterwheelCarousel.min.js"> </c:set>
    <script src="<%= request.getContextPath()%>${waterWheelCarouselJS}"></script> 
    
     <c:set var="waterWheelCarouselCSS" value="/resources/css/waterwheelcarousel.css"> </c:set> 
    <link type="text/css" href="<%= request.getContextPath()%>${waterWheelCarouselCSS}" rel="stylesheet">
    
    
    <!-- for the feedbackform dialog -->
    
    <c:set var="feedbackformCss" value="/resources/css/feedbackformdialog.css"> </c:set> 
    <link type="text/css" href="<%= request.getContextPath()%>${feedbackformCss}" rel="stylesheet">
    
    
 