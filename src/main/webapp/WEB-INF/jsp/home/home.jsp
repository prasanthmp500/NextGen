<!DOCTYPE html> 

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html lang="en">

<head> 
	<jsp:include page="../fragments/headTag.jsp"/>
	
	<script type="text/javascript">
		
	function getArtist(searchBox){
		var input = searchBox.value;
		if(input.length > 3) {
			loadXMLDoc(input);
		}
	}
	
	
	
	function loadXMLDoc(searchResult)
	{

		var xmlhttp;
		if (window.XMLHttpRequest)
	 		 {// code for IE7+, Firefox, Chrome, Opera, Safari
	 			 xmlhttp=new XMLHttpRequest();
	 		 }
		else
	 		 {// code for IE6, IE5
				  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
			 }
		
		xmlhttp.onreadystatechange=function()
		  {
		  if (xmlhttp.readyState==4 && xmlhttp.status==200)
		    {
			  
			
			var jqueryObj = jQuery.parseJSON(xmlhttp.responseText);
			
		    document.getElementById("searchResults").innerHTML=xmlhttp.responseText;
		    }
		  }
	
		xmlhttp.open("GET","/NextGen/search/artist/".concat(searchResult),true);
		xmlhttp.send();

	}

	
	</script>
</head>	
	
	<body>
		<div class="container">
			<!-- 
				<div class="test"> Home page </div>
				<img src="resources/images/banner-graphic.png" />
			 -->
			<form action="/search/similarArtist" method="post">
			
				<input type="search" name="artistName" onkeyup="getArtist(this);">
				
					<div id="searchResults">
				
					</div>
				
			</form>
	
		</div>
	</body>
</html>
