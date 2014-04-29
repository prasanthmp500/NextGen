<!DOCTYPE html> 

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<html lang="en">

<head> 
  <jsp:include page="../fragments/headTag.jsp"/>
	

	<script type="text/javascript">


		$( document ).ajaxError(function( event, request, settings ) {
			
			/*
			$( "#error" ).html("");
			$( "#error" ).append( "Error requesting page " + settings.url + "" );
			$( "#error-dialog-modal" ).dialog( "open" );
			*/
			
		});
		
		
		$(function() {
		    $( "#error-dialog-modal" ).dialog({
		      autoOpen: false,
		      show: {
		        effect: "blind",
		        duration: 1000
		      },
		      hide: {
		        effect: "explode",
		        duration: 1000
		      }
		    });
		 
		
		  });
		
		
	</script>
			
		
	<script>
		  $(function() {
		    $( "#accordion" ).accordion();
		  });
 		</script>
			
			
			
<script type="text/javascript">
			   
      $(document).ready(
    		  
    function () {
    	
        var carousel = $("#carousel").waterwheelCarousel({
          flankingItems: 3,
          linkHandling:2,
          movingToCenter: function ($item) {
            $('#callback-output').prepend('movingToCenter: ' + $item.attr('id') + '<br/>');
          },
          movedToCenter: function ($item) {
            $('#callback-output').prepend('movedToCenter: ' + $item.attr('id') + '<br/>');
          },
          movingFromCenter: function ($item) {
            $('#callback-output').prepend('movingFromCenter: ' + $item.attr('id') + '<br/>');
          },
          movedFromCenter: function ($item) {
            $('#callback-output').prepend('movedFromCenter: ' + $item.attr('id') + '<br/>');
          },
          clickedCenter: function ($item) {
            $('#callback-output').prepend('clickedCenter: ' + $item.attr('id') + '<br/>');
          }
        });

        $('#prev').bind('click', function () {
          carousel.prev();
          return false
        });

        $('#next').bind('click', function () {
          carousel.next();
          return false;
        });

        $('#reload').bind('click', function () {
          newOptions = eval("(" + $('#newoptions').val() + ")");
          carousel.reload(newOptions);
          return false;
        });

      });
    </script>
			
			
			
			
	
	<script type="text/javascript">
	
	$( ".selector" ).accordion({ active: 2 });
	
	
	$(document).ready(function(){
		
		var  movieMap;
		
		var map ;
		
		var markers = [];
		
		$( document ).tooltip();
		
		$( "#tabs" ).tabs();
		
        $('.kc-wrap').KillerCarousel({
            // Default natural width of carousel.
            width: 800,
            // Item spacing in 3d (has CSS3 3d) mode.
            spacing3d: 120,
            // Item spacing in 2d (no CSS3 3d) mode. 
            spacing2d: 120,
            showShadow: true,
            showReflection: true,
            // Looping mode.
            infiniteLoop: true,
            // Scale at 75% of parent element.
            autoScale: 75
        });
		
		 
		$("#artistName").keyup(function(){
			var similarArtists = new Array();
			var artistNameInput = $(this);
			var input = $(this).val();
            if(input.length > 3 ){
            	
				 $.get("<c:url value='/search/artist/'/>".concat(input),function(data,status){
					      if(status=="success"){
				    	      var jsonObject = jQuery.parseJSON(data);							    	  
				    	      var arrayResultLength = (jsonObject["results"]["artistmatches"]["artist"]).length; 
				    	  	  for(var i=0;i<arrayResultLength;i++){
				    	    	  similarArtists[i] = jsonObject["results"]["artistmatches"]["artist"][i].name;  
				    	      }
				    	  	  $(artistNameInput).autocomplete({source: similarArtists});					    	  	  
					     	 }					      
				   		 });
					}		  
			  	});	 
		
		
		    $("#playArtist").click(function() {
		    	var input = $("#artistName").val();
		    	if(input.length > 3){
		    		// play selected input artist name in youtube 
		    			playYouTubeArtistPlayList(input);
		    		}
		    	
		   		 }).click(function(){
		   			var input = $("#artistName").val();
		   			if(input.length > 3){
		   			 $('#loadingmessage').show();
		   			 $('#loadingmessage').delay(6000).fadeOut();
		   			 
		   				$.get("<c:url value='/search/similarArtist/'/>".concat(input),function(data,status){
		   					if(status=="success"){
		   						var jsonObjectSimilarArtists = jQuery.parseJSON(data);
		   						var showDiv = $('#showSimilarArtists');
		   						
		   					
		   						if( jsonObjectSimilarArtists.similarartists == undefined ){
		   							
		   							$('#loadingmessage').hide();
		   							$( "#notFoundError" ).text(jsonObjectSimilarArtists.message);
		   						  	$( "#dialog-modal" ).dialog({
		   						      height: 140,
		   						      modal: true
		   						    });
		   							
		   						} else {
		   							
			   						for(var i=0;i<(jsonObjectSimilarArtists.similarartists["artist"]).length;i++){
			   							var $div = $("<div>", {class: "kc-item"});
			   							
			   							
			   							var hyperLink =  $('<a>');
			   							hyperLink.attr('href','#');
			   							
			   							var img  = $('<img>');
			   							img.attr('src', jsonObjectSimilarArtists.similarartists["artist"][i].image["4"]["#text"]);		   							
			   							var artistName = jsonObjectSimilarArtists.similarartists["artist"][i].name;
			   							
			   							
			   							hyperLink.append(img);
			   							
			   							$div.attr('title',artistName);
			   							$div.attr('artistName',artistName);
			   							$div.click(function(e){
					    	    			playSelectedArtist(e);
					    	    		});
			   							
			   							$div.append(hyperLink);
			   							showDiv.append($div);
			   						}
			   						
			   						
					                $('.kc-wrap').KillerCarousel({
					                    // Default natural width of carousel.
					                    width: 800,
					                    // Item spacing in 3d (has CSS3 3d) mode.
					                    spacing3d: 120,
					                    // Item spacing in 2d (no CSS3 3d) mode. 
					                    spacing2d: 120,
					                    showShadow: true,
					                    showReflection: true,
					                    // Looping mode.
					                    infiniteLoop: true,
					                    // Scale at 75% of parent element.
					                    autoScale: 75
					                });
			   						//
			   						
			   						 $('#loadingmessage').hide(); // hide the loading message
		   						}
		   						
		   						

		   					}		   						
		   				});//end of get function
		   				
		   				
		   			}
		   			
		   			 
		   		 }).click(function(){
		   			var input = $("#artistName").val();
		   			showLastFmArtistInfo(input);
		   		 });
		    
		    
		    function showLastFmArtistInfo(artistName){
	   			if(artistName.length > 3){
	   				$.get("<c:url value='/search/artistInfo/'/>".concat(artistName), function(data,status){
	   						if(status=="success"){
	   							var artistLastFmInfoDiv	= $('#artistLastFmInfo'); 
	   							artistLastFmInfoDiv.empty();
	   							var img  = $('<img>');
	   							var jsonObjectArtistInfo = jQuery.parseJSON(data);
	   							img.attr('src', jsonObjectArtistInfo.artist.image["3"]["#text"]);
	   							img.attr('title',jsonObjectArtistInfo.artist.name);
	   							img.height(180).width(180);
	   							artistLastFmInfoDiv.append(img);
	   						}
	   					}	
	   					
	   				);
	   			}
		    }
		    
		    
   			function playSelectedArtist (event) {   				
   				var artistName = $(event.currentTarget).attr('artistName');
   				playYouTubeArtistPlayList(artistName);
   				showLastFmArtistInfo(artistName);
	   			
   			}
   			
   			function playYouTubeArtistPlayList(input){
   				
   			 $.get("<c:url value='/searchYoutube/playlist/'/>".concat(input),function(data,status){
				  if(status=="success"){
		    	      var jsonObjectPlayList = jQuery.parseJSON(data);
		    	      var youtTubePlaylistId = jsonObjectPlayList.items[0].id.playlistId;
		    	      
		    	      // get the video ids in the playlist 
		    	   
		    	      $.get("<c:url value='/searchYoutube/loadPlaylistItem/'/>".concat(youtTubePlaylistId), function(data,status){ 
		    	    	  if(status=="success"){
		    	    		  var jsonObjectPlayListItems = jQuery.parseJSON(data);	  
		    	    		    var playListItemsArray = jsonObjectPlayListItems["items"];
		    	    		    var videoId = new Array();
		    	    		    for(var i=0;i<playListItemsArray.length;i++){
		    	    		    	videoId[i] = playListItemsArray[i].snippet.resourceId.videoId;
		    	    		    }
		    	  
		    	    		    player.loadPlaylist(videoId);
		    	    		    player.playVideo();
		    	    		    
		    	    		    $("#playList").empty();
		    	    		    for(var i=0;i<playListItemsArray.length;i++){
		    	    		    	var imgUrl = playListItemsArray[i].snippet.thumbnails.default.url;
		    	    		    	var img = $('<img>');
		    	    		    	img.attr('src',imgUrl);
		    	    		    	img.height(50);
		    	    		    	img.width(50);
		    	    		    	
		    	    		    	var listItem = $('<li></li>');
		    	    		    	
		    	    		    	listItem.append(img);
		    	    		    	
		    	    		    	listItem.append(' '+ playListItemsArray[i].snippet.title+' ' );
		    	    		    	/* '<li>'+img.html() + +' '+ playListItemsArray[i].snippet.title  +'</li>' */
		    	    		    	$("#playList").append(listItem);
		    	    		    	
		    	    		    }
		    	    		    
		    	    	  }
		    	      });
			     	 }	
		   		 });
   			 
   			}
   			
   			function clearAccordion(){
					  $("#playList").empty();
   					  $("#artistLastFmInfo").empty();
   			}
   			
   			
   			function showYoutubeMovieTrailer(moviename){
   				$.get("<c:url value='/searchYoutube/searchMovieTrailer/'/>".concat(moviename) ,function(data,status){
	   				 if(status=="success"){
	   					 
	   					  player.loadPlaylist(null);
	   					  
	   					  clearAccordion();
	   					
	   					  var jsonObjectVideoTrailerItems = jQuery.parseJSON(data);	
	   					  var videoItems = jsonObjectVideoTrailerItems["items"];
	   					  if(videoItems.length>0){
   							var youtubeVideoId = videoItems[0].id["videoId"]; 
   							player.loadVideoById(youtubeVideoId);
   							player.playVideo();
	   					  }
	   				 }
   				});
   			}
   			
   			
		    $(function(){		    	
		    	  $.get("<c:url value='/search/allEventLocations'/>",function(data,status){
					  if(status=="success") { 
						  var jsonEventLocations = jQuery.parseJSON(data);
						  var metrosLength =(jsonEventLocations.metros["metro"]).length;
						  var map = new Object();						  
						  for(var i=0;i<metrosLength;i++){
							var region = (jsonEventLocations.metros["metro"][i]).name;
							var country = (jsonEventLocations.metros["metro"][i]).country;
							if( typeof map[country] == "undefined"){
									var regions = new Array();
									regions.push(region);
									map[country] = regions;
								} else {
							    	 (map[country]).push(region);
							}
						  }						  
						  var keys = Object.keys(map);
						  for(var i=0;i<keys.length;i++){				  
							 $("#country").append('<option value="'+keys[i]+'">'+keys[i]+'</option>');
							 var regionsArray  = map[keys[i]];
							 for(var j=0; j< regionsArray.length; j++ ){
								$("#country").append('<option value="'+regionsArray[j]+'">&nbsp;&nbsp;&nbsp;'+regionsArray[j]+'</option>');								
								 }
						 	 }
					 	 }
		    	  	});		
				});
		    
			  
		    
		 
		    $("#country").change(function(){
		    	$('#loadingmessage').show();
		    	var locationSelected = $(this).val();
		    
		    	deleteMarkers();
		    	
		    	$.get("<c:url value='/search/allEvents/'/>".concat(locationSelected),function(data,status){
		    		if(status=="success"){
		    			
		    			var eventDetails = jQuery.parseJSON(data);	
		    			
		    			
		    			
		    			for(var i=0; i < (eventDetails.events["event"]).length;i++ ){
		    				var event = (eventDetails.events["event"])[i];		    				
		    				var geo = eventDetails.events["event"][i].venue.location["geo:point"];
		    				var eventLatLng =  new google.maps.LatLng(geo["geo:lat"] ,geo["geo:long"]);
		    				var marker = new google.maps.Marker();
		    				marker.setPosition(eventLatLng);
		    				marker.setAnimation(google.maps.Animation.DROP);
		    				marker.setTitle(event.title);
		    				marker.setMap(map);
		    				google.maps.event.addListener(marker, 'click',setInfoWindowOnMarker(event, map, marker) );
		    				markers.push(marker);
		    			}
		    			
		    		}
		    		
		    		
		    		
		    		
		    		
		    	});
		    	
		    	$.get("<c:url value='/searchCountry/search/'/>".concat(locationSelected),function(data,status){
		    		
		    		if(status=="success"){
		    			    var marker = new google.maps.Marker();
		    				var eventLatLng =  new google.maps.LatLng(data.latitude ,data.longitude);		    				
		    				marker.setPosition(eventLatLng);
		    				marker.setAnimation(google.maps.Animation.DROP);
		    				marker.setTitle(data.name);
		    				marker.setIcon({url:data.imageUrl, scaledSize:new google.maps.Size(25, 25) });
		    				marker.setMap(map);
		    				markers.push(marker);
		    				$('#loadingmessage').hide();
		    				
		    			}
		    	
		    	});
		    	
		    	
		    	
		    });
		    
		
		    
		    
		   function setInfoWindowOnMarker(event, map, marker) {			   
			   return function() { getInfoWindow(event).open(map, marker); }
		   }
		    
		    
		    
		    function getInfoWindow(event){
		    	var infowindow =  new google.maps.InfoWindow();
		    	infowindow.setContent(getContentString(event));
		    	return infowindow;
		    }
		    
		    
		    
		    function getContentString(event){
		    	
			    	var eventTag = '';
			    	if( typeof event.tags!= "undefined" ){
			    		if( typeof event.tags["tag"] != "undefined"){
				    		if(typeof (event.tags["tag"]).length != "undefined" ) {
				    			for(var i=0;i<event.tags["tag"].length;i++  ){
					    			eventTag = eventTag +' ' +event.tags["tag"][i];
					    		}
				    		} else {
				    			eventTag = event.tags.tag;
				    		}
				    	}
			    	}
		    	
		    	
			    	var content = '<div id="content">'+
					'<h1 id="firstHeading" class="firstHeading">'+ event.title +'</h1>'+
					'<p><span style="font-weight:bold;text-decoration:underline"> Artists  </span> <br>'+
					'<span style="font-weight:bold"> Head Liner  </span>'+ event.artists.headliner + '<br>'+
					'<span style="font-weight:bold;text-decoration:underline"> Venue Details </span> <br>'+
					'<span style="font-weight:bold">Venue Name: </span>'+ event.venue.name +'<br> '+
					'<span style="font-weight:bold;text-decoration:underline"> Venue Name Location </span> <br>'+
					'<span style="font-weight:bold">City: </span>'+ event.venue.location.city +'<br>'+
					'<span style="font-weight:bold">Country: </span>'+ event.venue.location.country +' <br>'+
					'<span style="font-weight:bold">Street: </span>'+ event.venue.location.street +' <br>'+
					'<span style="font-weight:bold">Postal Code: </span>'+ event.venue.location.postalcode +' <br>'+
					'<span style="font-weight:bold">Phone Number: </span>'+ event.venue.phonenumber +' <br>'+
					'<span style="font-weight:bold">Last fm url: </span>'+ event.venue.url +' <br>'+
					'<span style="font-weight:bold">Website url: </span>'+ event.venue.website +'<br>'+
					'<img src="'+event.image[3]['#text']+'"> <br>'+
					'<span style="font-weight:bold"> Event Date: </span>'+ event.startDate +'<br>'+
					'<span style="font-weight:bold">Tags: </span>'+ eventTag  +'<br> </p>'+
			    '</div>';
		    				    
		    				    
		    				
		    	return content;
		    }
		    
		    
		    
		 // Deletes all markers in the array by removing references to them.
		    function deleteMarkers() {
		    	  for (var i = 0; i < markers.length; i++) {
		    		 markers[i].setMap(null);
		    	  }
		    	  markers = [];
		    	}
		 
		 
		 	$("#searchEventsLink").click(function(event){
		 		var mapOptions;
		    	mapOptions = {center: new google.maps.LatLng(51.5072,0.1275), zoom: 1};
				map = new google.maps.Map(document.getElementById("map-canvas"),mapOptions);
		 		$( this ).off(event);
		 	});
		 	
		 	
		 	 $("#movieName").keyup(function(){
		 		 
		 		 
					var movies = new Array();
					var movieNameInput = $(this);
					var input = $(this).val();
			
		            if(input.length > 3 ){
		            	
						 $.get("<c:url value='/searchMovie/search/'/>".concat(input),function(data,status){
							      if(status=="success"){
						    	      var jsonObject = jQuery.parseJSON(data);		
							    	  
						    	      var arrayResultLength = (jsonObject["movies"]).length; 
									  
						    	  	  for(var i=0;i<arrayResultLength;i++){
						    	    	  movies[i] = jsonObject["movies"][i].title;  				    	      
									  }
									  
						    	  	var uniqueMovieNames = new Array();
						    	  	$.each(movies, function(i, el){
						    	  	    if($.inArray(el, uniqueMovieNames) === -1) uniqueMovieNames.push(el);
						    	  	});
						    	  	  
						    	  	  
						    	  	  	$(movieNameInput).autocomplete({source: uniqueMovieNames});						    	  	  
							     	 
									 }
									 
						   		 });
							}		  
					  	});	
		 	
		 	 
		 	$("#showMovieDetails").click(function(){
		 		
		 	 $('#loadingmessage').show();
		 	   
		 	 $("#infoDiv").empty();
				  
		 		
		 	  var input = $("#movieName").val();
	
		 	  if(input.length > 3 ){
		 		 
		 		  $.get("<c:url value='/searchMovie/search/'/>".concat(input), function(data,status){
		 			 if(status=="success"){
		 				 
		 				
		 			     var jsonObject = jQuery.parseJSON(data);		
				         var arrayResultLength = (jsonObject["movies"]).length; 
				         movieMap = new Object();
								
				         if(jsonObject.total == 0) {
				        	 
				        	 $( "#notFoundError" ).text("No Movies found");
	   						  	$( "#dialog-modal" ).dialog({
	   						      height: 140,
	   						      modal: true
	   						    });
				        	 
				         }
				         
				         
				   			$("#carousel").empty();
				   			for(var i=0;i<arrayResultLength;i++){
			    	    	 
				        		var img = $('<img>'); //Equivalent: $(document.createElement('img'))
			    	    		var movieItem = (jsonObject["movies"][i]);
				        	    img.attr('src', (jsonObject["movies"][i]).posters.original);
				        		img.height(240);
			    	    		img.width(180);
			    	    		var id = movieItem.id;
			    	    		img.attr( "id", id);
			    	    		
			    	    		var movie_title = movieItem.title;
			    	    		var movie_year = movieItem.year;
			    	    		var movie_mpa_rating = movieItem.mpaa_rating;
			    	    		var movie_runtime = movieItem.runtime;
			    	    		
			    	    		var movie_critics_consensus = movieItem.critics_consensus; 
			    	    		
			    	    		if (typeof movieItem.critics_consensus == "undefined" ) {
			    	    			movie_critics_consensus = '';
			    	    		}
			    	    		
			    	    		var movie_cast = '';
			    	    		
			    	    		if(typeof movieItem.abridged_cast != "undefined" ) {
			    	    			for(var j=0;j<movieItem.abridged_cast.length;j++) {
			    	    				movie_cast = movie_cast + ''+ movieItem.abridged_cast[j].name +'|';
			    	    			}
			    	    		}
			    	    		
			    	    		
			    	    		var criticsRating = '';
			    	    		var criticsScore = '';
			    	    		var audienceScore = '';
			    	    		var audienceRating = '';
			    	    		
			    	    		
			    	    		if(movieItem.ratings.critics_rating != "undefined"){
			    	    			criticsRating = movieItem.ratings.critics_rating;
			    	    		}
			    	    		
			    	    		if(movieItem.ratings.critics_score != "undefined"){
			    	    			criticsScore = movieItem.ratings.critics_score;
			    	    		}
			    	    		
			    	    		if(movieItem.ratings.audience_score != "undefined"){
			    	    			audienceScore = movieItem.ratings.audience_score;
			    	    		}
			    	    		
			    	    		if(movieItem.ratings.audience_rating != "undefined"){
			    	    			audienceRating = movieItem.ratings.audience_rating;
			    	    		}
			    	    		
			    	    		
			    	    		var imdbInfoGenre = '';
			    	    		var imdbInfoDirector = '';
			    	    		var imdbInfoWriter = '';
			    	    		var imdbInfoPlot = '';
			    	    		var imdbInfoLanguage = '';
			    	    		var imdbInfoCountry = '';
			    	    		var imdbInfoMetaScore = '';
			    	    		var imdbInfoRating = '';
			    	    		var imdbInfoVotes = '';
			    	    		var imdbInfoType = '';
			    	    		
				    	    	if( typeof movieItem.imdbInfo != "undefined" ){
				    	    		
				    	    		var imdbdatabaseInformation  = jQuery.parseJSON(movieItem.imdbInfo);
				    	    		
				    	    		if(typeof imdbdatabaseInformation.Genre != "undefined"){
				    	    			imdbInfoGenre = imdbdatabaseInformation.Genre;
				    	    		}
				    	    		
				    	    		
				    	    		if(typeof imdbdatabaseInformation.Director != "undefined"){
				    	    			imdbInfoDirector = imdbdatabaseInformation.Director;
				    	    		}
				    	    		

				    	    		if(typeof imdbdatabaseInformation.Writer != "undefined"){
				    	    			imdbInfoWriter = imdbdatabaseInformation.Writer;
				    	    		}

				    	    		if(typeof imdbdatabaseInformation.Plot != "undefined"){
				    	    			imdbInfoPlot = imdbdatabaseInformation.Plot;
				    	    		}
				    	    		
				    	    		if(typeof imdbdatabaseInformation.Language != "undefined"){
				    	    			imdbInfoLanguage = imdbdatabaseInformation.Language;
				    	    		}
				    	    		
				    	    		
				    	    		if(typeof imdbdatabaseInformation.Country != "undefined"){
				    	    			imdbInfoCountry = imdbdatabaseInformation.Country;
				    	    		}
				    	    		
				    	    		if(typeof imdbdatabaseInformation.Metascore != "undefined"){
				    	    			imdbInfoMetaScore = imdbdatabaseInformation.Metascore;
				    	    		}
				    	    		
				    	    		if(typeof imdbdatabaseInformation.imdbRating != "undefined"){
				    	    			imdbInfoRating = imdbdatabaseInformation.imdbRating;
				    	    		}
				    	    		
				    	    		if(typeof imdbdatabaseInformation.imdbVotes != "undefined"){
				    	    			imdbInfoVotes = imdbdatabaseInformation.imdbVotes;
				    	    		}
				    	    		
				    	    		if(typeof imdbdatabaseInformation.Type != "undefined"){
				    	    			imdbInfoType = imdbdatabaseInformation.Type;
				    	    		}
				    	    		
				    	    	}
			    	    		
				    	 	
			    	    		
			    	    		
			    	    		movieMap[id] = new Movie(id,movie_title,movie_year,movie_mpa_rating,movie_runtime,movie_critics_consensus,movie_cast,
			    	    				criticsRating,criticsScore,audienceScore,audienceRating,
			    	    				imdbInfoGenre,imdbInfoDirector,imdbInfoWriter,imdbInfoPlot,imdbInfoLanguage,imdbInfoCountry,imdbInfoMetaScore,imdbInfoRating,
			    	    				imdbInfoVotes,imdbInfoType);
			    	    		
			    	    		img.click(function(e){
			    	    			showMovieInfoInDetail(e);
			    	    		});
			    	    		
			    	    		
			    	    		$("#carousel").append($(img));
			    	    	 
			    	     }
			    	   
				   			$("#carousel").waterwheelCarousel({
				   	          flankingItems: 3,
				   	          movingToCenter: function ($item) {
				   	            $('#callback-output').prepend('movingToCenter: ' + $item.attr('id') + '<br/>');
				   	          },
				   	          movedToCenter: function ($item) {
				   	            $('#callback-output').prepend('movedToCenter: ' + $item.attr('id') + '<br/>');
				   	          },
				   	          movingFromCenter: function ($item) {
				   	            $('#callback-output').prepend('movingFromCenter: ' + $item.attr('id') + '<br/>');
				   	          },
				   	          movedFromCenter: function ($item) {
				   	            $('#callback-output').prepend('movedFromCenter: ' + $item.attr('id') + '<br/>');
				   	          },
				   	          clickedCenter: function ($item) {
				   	            $('#callback-output').prepend('clickedCenter: ' + $item.attr('id') + '<br/>');
				   	          }
				   	        });
			    	 
				   		  $('#loadingmessage').hide();
			    	     
		 			 }
		 		  });
		 	  	}
		 	});
		 	
		 	
		 	
		 	
		 	 function showMovieInfoInDetail(event) {
				  
				  var movieToDisplay =  movieMap[event.currentTarget.id]; 
				  
				  var infoDivTag =  $("#infoDiv");
				  infoDivTag.empty();
				  
				  var titleTag = $('<p></p>');
				  titleTag.append('<span style="font-weight:bold;text-decoration:underline">'+  movieToDisplay.title() + '</span> &nbsp;');
				  var buttonYoutube = $('<button></button>');
				  buttonYoutube.text("watch youtube trailer");
				  buttonYoutube.bind('click', function(){
					  showYoutubeMovieTrailer(movieToDisplay.title())
				  } );
				  titleTag.append(buttonYoutube);
				  
				  infoDivTag.append(titleTag);
				  
				  var rottenTomatoesTable = $('<table></table>');
				  rottenTomatoesTable.attr('width','100%');
				  rottenTomatoesTable.attr("border",1);
				  var row1 = $('<tr></tr>');
				 
				  var row1col1 = $('<th></th>');
				  row1col1.attr("colspan",4);
				  row1col1.text("Rotten Tomatoes");
				  rottenTomatoesTable.append(row1.append(row1col1));
				  infoDivTag.append(rottenTomatoesTable);
				  
				  
				  var row2 = $('<tr></tr>');
				  var row2col1 = $('<td></td>');
				  var row2col2 = $('<td></td>');
				  var row2col3 = $('<td></td>');
				  row2col3.attr('colspan',2);
				  
				  row2col1.append('<span style="font-weight:bold;text-decoration:underline">Released</span> :');
				  row2col1.append('<span>'+ movieToDisplay.releaseYear()+'</span>'); 
				  
				  
				  row2col2.append('<span style="font-weight:bold;text-decoration:underline">MPAA Rating</span> : <span>'+ movieToDisplay.mpaaRating()+'</span>');
				  row2col3.append('<span style="font-weight:bold;text-decoration:underline">Duration </span>  :  <span>'+ movieToDisplay.runtime()+' (Minutes) </span>');
				  row2.append(row2col1, row2col2 ,row2col3 );
				  rottenTomatoesTable.append(row2);

				  
				
					
				
				  
				  var row4  = $('<tr></tr>');
				 
				  var row4col1 = $('<td></td>');
				  row4col1.attr("colspan",4);
				  row4col1.append('<span style="font-weight:bold;text-decoration:underline">Movie Cast </span> : <span>'+ movieToDisplay.movieCast()+'</span>');
				  rottenTomatoesTable.append(row4.append(row4col1));
				  
				  var row3 = $('<tr></tr>');
				  var row3col3 = $('<td></td>');
				  row3col3.attr("colspan",4);
				  row3col3.append('<span style="font-weight:bold;text-decoration:underline">Critics Consensus </span> : <span>'+movieToDisplay.criticsConsensus()+'</span>');
				  rottenTomatoesTable.append(row3.append(row3col3));
				  
				  
				  
				  
				  var row5  = $('<tr></tr>');
				  var row5col1 = $('<td></td>');
				  var row5col2 = $('<td></td>');
				  var row5col3 = $('<td></td>'); 
				  var row5col4 = $('<td></td>');
				  
				  row5col1.append('<span style="font-weight:bold;text-decoration:underline">Critics Rating </span> : <span>'+ movieToDisplay.movieRating()+'</span>');
				  row5col2.append('<span style="font-weight:bold;text-decoration:underline">Critics Score </span> : <span>'+ movieToDisplay.movieScore()+'</span>');
				  row5col3.append('<span style="font-weight:bold;text-decoration:underline">Audience Score </span> : <span>'+movieToDisplay.movieAudienceScore()+'</span>');
				  row5col4.append('<span style="font-weight:bold;text-decoration:underline">Audience Rating </span> : <span>'+movieToDisplay.movieAudienceRating()+'</span>');
				  rottenTomatoesTable.append(row5.append(row5col1,row5col2,row5col3,row5col4));
				  
				  var imdbTable = $('<table></table>');
				  imdbTable.attr('width','100%');
				  imdbTable.attr("border",1);
				  var tb2row1 = $('<tr></tr>');
				  
				  var tb2row1col1 = $('<th></th>');
				  tb2row1col1.attr("colspan",6);
				  tb2row1col1.text("Internet Movie Database(IMDB)");
				  imdbTable.append(tb2row1.append(tb2row1col1));
				  infoDivTag.append(imdbTable);
				  
				  
				  var tb2row2 = $('<tr></tr>');
				  var tb2row2col1 = $('<td></td>');
				  var tb2row2col2 = $('<td></td>');
				  var tb2row2col3 = $('<td></td>');
				  tb2row2col3.attr('colspan',3);
				  tb2row2col1.append('<span style="font-weight:bold;text-decoration:underline">Genre </span> : <span>'+ movieToDisplay.movieImdbInfoGenre()+'</span>');
				  tb2row2col2.append('<span style="font-weight:bold;text-decoration:underline">Director </span> : <span>'+ movieToDisplay.movieImdbInfoDirector()+'</span>');
				  tb2row2col3.append('<span style="font-weight:bold;text-decoration:underline">Writer </span> : <span>'+ movieToDisplay.movieImdbInfoWriter()+'</span>');
				  imdbTable.append(tb2row2.append(tb2row2col1,tb2row2col2,tb2row2col3));
	
				  var tb2row3 = $('<tr></tr>');
				  var tb2row3col1 = $('<td></td>');
				  var tb2row3col2 = $('<td></td>');
				  var tb2row3col3 = $('<td></td>');
				  var tb2row3col4 = $('<td></td>');
				  var tb2row3col5 = $('<td></td>');
				  var tb2row3col6 = $('<td></td>');
				  tb2row3col1.append('<span style="font-weight:bold;text-decoration:underline">Language </span> : <span>'+ movieToDisplay.movieImdbInfoLanguage()+'</span>');
				  tb2row3col2.append('<span style="font-weight:bold;text-decoration:underline">Country </span> : <span>'+ movieToDisplay.movieImdbInfoCountry()+'</span>');
				  tb2row3col3.append('<span style="font-weight:bold;text-decoration:underline">MetaScore </span> : <span>'+ movieToDisplay.movieImdbInfoMetaScore()+'</span>');
				  tb2row3col4.append('<span style="font-weight:bold;text-decoration:underline">Rating </span> : <span>'+ movieToDisplay.movieImdbInfoRating()+'</span>');
				  tb2row3col5.append('<span style="font-weight:bold;text-decoration:underline">Votes </span> : <span>'+movieToDisplay.movieImdbInfoVotes()+'</span>');
				  tb2row3col6.append('<span style="font-weight:bold;text-decoration:underline">Type </span> : <span>'+movieToDisplay.movieImdbInfoType()+'</span>');
				 
				  imdbTable.append( tb2row3.append(tb2row3col1,tb2row3col2,tb2row3col3,tb2row3col4,tb2row3col5,tb2row3col6));
				  
				  var tb2row4 = $('<tr></tr>');
				  var tb2row4col1 = $('<td></td>');
				  tb2row4col1.attr('colspan',6);
				  tb2row4col1.append('<span style="font-weight:bold;text-decoration:underline">Plot </span>: <span>'+ movieToDisplay.movieImdbInfoPlot()+'</span>');
				  imdbTable.append( tb2row4.append(tb2row4col1));
 					
			
				  
			  }
		 	
		 	 
		 	 
		 	 
		 	 
		 	
		 /*
		  function showMovieInfoInDetail(event) {
			  
			  var movieToDisplay =  movieMap[event.currentTarget.id]; 
			  
			  var infoDivTag =  $("#infoDiv");
			  infoDivTag.empty();
			  
			  
			  var titleTag = $('<p></p>');
			  titleTag.append('<span style="font-weight:bold;text-decoration:underline">'+  movieToDisplay.title() + '</span>');
			  infoDivTag.append(titleTag);
			  
			  
			  var rottentomatoesMovieDatabase = $('<p></p>');
			  rottentomatoesMovieDatabase.append('<span style="font-weight:bold"> Rotten Tomatoes </span>');
			  infoDivTag.append(rottentomatoesMovieDatabase);
			  
			  
			  var releaseYearTag = $('<p></p>');
			  releaseYearTag.append('<span style="font-weight:bold"> Released : </span>'+ movieToDisplay.releaseYear()+' ');
			  infoDivTag.append(releaseYearTag);
			  
			  
			  var mpaaTag = $('<p></p>');
			  mpaaTag.append('<span style="font-weight:bold"> MPAA Rating : </span>'+ movieToDisplay.mpaaRating()+' ');
			  infoDivTag.append(mpaaTag);
			  
			  
			  var runtimeTag = $('<p></p>');
			  runtimeTag.append('<span style="font-weight:bold"> Duration : </span>'+ movieToDisplay.runtime()+' (Minutes)');
			  infoDivTag.append(runtimeTag);
			  
			  
			  var criticsConsensusTag = $('<p></p>');
			  criticsConsensusTag.append('<span style="font-weight:bold"> Critics Consensus : </span>'+ movieToDisplay.criticsConsensus()+' ');
			  infoDivTag.append(criticsConsensusTag);
			  
			  var castTag = $('<p></p>');
			  castTag.append('<span style="font-weight:bold"> Movie Cast : </span>'+ movieToDisplay.movieCast()+' ');
			  infoDivTag.append(castTag);
			  
			  
			  var criticsRatingTag = $('<p></p>');
			  criticsRatingTag.append('<span style="font-weight:bold"> Critics Rating : </span>'+ movieToDisplay.movieRating()+' ');
			  infoDivTag.append(criticsRatingTag);
			  
			  var criticsScoreTag = $('<p></p>');
			  criticsScoreTag.append('<span style="font-weight:bold"> Critics ScoreTag : </span>'+ movieToDisplay.movieScore()+' ');
			  infoDivTag.append(criticsScoreTag);
			  
			  
			  var audienceScoreTag = $('<p></p>');
			  audienceScoreTag.append('<span style="font-weight:bold"> Audience Score : </span>'+ movieToDisplay.movieAudienceScore()+' ');
			  infoDivTag.append(audienceScoreTag);
			  
			  var audienceRatingTag = $('<p></p>');
			  audienceRatingTag.append('<span style="font-weight:bold"> Audience Score : </span>'+ movieToDisplay.movieAudienceRating()+' ');
			  infoDivTag.append(audienceRatingTag);
			  
			  var imdbMovieDatabase = $('<p></p>');
			  imdbMovieDatabase.append('<span style="font-weight:bold"> Internet Movie Database(IMDB) </span>');
			  infoDivTag.append(imdbMovieDatabase);
			  
			 
			  var imdbInfoGenreTag = $('<p></p>');
			  imdbInfoGenreTag.append('<span style="font-weight:bold"> Genre : </span>'+ movieToDisplay.movieImdbInfoGenre()+' ');
			  infoDivTag.append(imdbInfoGenreTag);
			  
			  
			  var imdbInfoDirectorTag = $('<p></p>');
			  imdbInfoDirectorTag.append('<span style="font-weight:bold"> Director : </span>'+ movieToDisplay.movieImdbInfoDirector()+' ');
			  infoDivTag.append(imdbInfoDirectorTag);
			  
			  var imdbInfoWriterTag = $('<p></p>');
			  imdbInfoWriterTag.append('<span style="font-weight:bold"> Writer : </span>'+ movieToDisplay.movieImdbInfoWriter()+' ');
			  infoDivTag.append(imdbInfoWriterTag);
			  
			  var imdbInfoPlotTag = $('<p></p>');
			  imdbInfoPlotTag.append('<span style="font-weight:bold"> Plot : </span>'+ movieToDisplay.movieImdbInfoPlot()+' ');
			  infoDivTag.append(imdbInfoPlotTag);
			  
			  var imdbInfoLanguageTag = $('<p></p>');
			  imdbInfoLanguageTag.append('<span style="font-weight:bold"> Language : </span>'+ movieToDisplay.movieImdbInfoLanguage()+' ');
			  infoDivTag.append(imdbInfoLanguageTag);
			  
			  var imdbInfoCountryTag = $('<p></p>');
			  imdbInfoCountryTag.append('<span style="font-weight:bold"> Country : </span>'+ movieToDisplay.movieImdbInfoCountry()+' ');
			  infoDivTag.append(imdbInfoCountryTag);
			  
			  
			  var imdbInfoMetaScoreTag = $('<p></p>');
			  imdbInfoMetaScoreTag.append('<span style="font-weight:bold"> MetaScore : </span>'+ movieToDisplay.movieImdbInfoMetaScore()+' ');
			  infoDivTag.append(imdbInfoCountryTag);
			  
			  var imdbInfoRatingTag = $('<p></p>');
			  imdbInfoRatingTag.append('<span style="font-weight:bold"> Rating : </span>'+ movieToDisplay.movieImdbInfoRating()+' ');
			  infoDivTag.append(imdbInfoRatingTag);
			 
			  
			  var imdbInfoVotesTag = $('<p></p>');
			  imdbInfoVotesTag.append('<span style="font-weight:bold"> Votes : </span>'+ movieToDisplay.movieImdbInfoVotes()+' ');
			  infoDivTag.append(imdbInfoVotesTag);
			 
			  var imdbInfoTypeTag = $('<p></p>');
			  imdbInfoTypeTag.append('<span style="font-weight:bold"> Type : </span>'+ movieToDisplay.movieImdbInfoType()+' ');
			  infoDivTag.append(imdbInfoTypeTag);
			  
		  }
		 */ 
		  
	
		  

		  
		  function Movie (id,movie_title,movie_year,movie_mpaa_rating,movie_runtime,movie_critics_consensus,movie_cast,criticsRating,criticsScore,audienceScore,audienceRating,
				  imdbInfoGenre,imdbInfoDirector,imdbInfoWriter,imdbInfoPlot,imdbInfoLanguage,imdbInfoCountry,imdbInfoMetaScore,imdbInfoRating,imdbInfoVotes,imdbInfoType ){
			  this.id = id;
			  this.movie_title = movie_title;
			  this.movie_year = movie_year;
			  this.movie_mpaa_rating = movie_mpaa_rating;
			  this.movie_runtime = movie_runtime;
			  this.movie_critics_consensus = movie_critics_consensus;
			  this.movie_cast = movie_cast;
			  
			  this.criticsRating = criticsRating;
			  this.criticsScore  = criticsScore;
			  this.audienceScore = audienceScore;
			  this.audienceRating = audienceRating;
			  
			  this.imdbInfoGenre = imdbInfoGenre;
			  this.imdbInfoDirector = imdbInfoDirector;
			  this.imdbInfoWriter = imdbInfoWriter;
			  this.imdbInfoPlot = imdbInfoPlot;
			  this.imdbInfoLanguage = imdbInfoLanguage;
			  this.imdbInfoCountry = imdbInfoCountry;
			  this.imdbInfoMetaScore = imdbInfoMetaScore;
			  this.imdbInfoRating = imdbInfoRating;
			  this.imdbInfoVotes = imdbInfoVotes;
			  this.imdbInfoType = imdbInfoType;
			  
		  }
		  
		  
		  
		  Movie.prototype.title = function(){
		      return this.movie_title;
		  }

		  
		  Movie.prototype.releaseYear = function(){
		      return this.movie_year;
		  }
		  
		  Movie.prototype.mpaaRating = function(){
			  if(this.movie_mpaa_rating == 'G'){
				  return 'General Audiences (G)';
			  }
			  
			  if(this.movie_mpaa_rating == 'PG'){
				  return 'Parental Guidance Suggested (PG)';
			  }
			  
			  if(this.movie_mpaa_rating == 'PG-13'){
				  return 'Parents Strongly Cautioned (PG-13)';
			  }
			  
			  if(this.movie_mpaa_rating == 'R'){
				  return 'Restricted (R)';
			  }
			  
			  if(this.movie_mpaa_rating == 'NC-17'){
				  return 'Adults Only (NC-17)';
			  }
			  
		      return this.movie_mpaa_rating;
		  }
		  
		  Movie.prototype.runtime = function(){
		      return this.movie_runtime;
		  }
		 	
		  
		  Movie.prototype.criticsConsensus = function(){
		      return this.movie_critics_consensus;
		  }
		  
		  
		  Movie.prototype.movieCast = function(){
		      return this.movie_cast;
		  }
		  
		  Movie.prototype.movieRating = function(){
		      return this.criticsRating;
		  }
		  
		  Movie.prototype.movieScore = function(){
		      return this.criticsScore;
		  }
		  
		  Movie.prototype.movieAudienceScore = function(){
		      return this.audienceScore;
		  }
		  
		  Movie.prototype.movieAudienceRating = function(){
		      return this.audienceRating;
		  }
		  
		
		  Movie.prototype.movieImdbInfoGenre = function(){
		      return this.imdbInfoGenre;
		  }
		  
		  Movie.prototype.movieImdbInfoDirector = function(){
		      return this.imdbInfoDirector;
		  }
	
		  Movie.prototype.movieImdbInfoWriter = function(){
		      return this.imdbInfoWriter;
		  }
	
		  Movie.prototype.movieImdbInfoPlot = function(){
		      return this.imdbInfoPlot;
		  }
	
		  
		  Movie.prototype.movieImdbInfoLanguage = function(){
		      return this.imdbInfoLanguage;
		  }
	
		  
		  Movie.prototype.movieImdbInfoCountry = function(){
		      return this.imdbInfoCountry;
		  }
		  
		 
		  Movie.prototype.movieImdbInfoMetaScore = function(){
		      return this.imdbInfoMetaScore;
		  }
		  
		  Movie.prototype.movieImdbInfoRating = function(){
		      return this.imdbInfoRating;
		  }
		  
		  Movie.prototype.movieImdbInfoVotes = function(){
		      return this.imdbInfoVotes;
		  }
		  
		  Movie.prototype.movieImdbInfoType = function(){
		      return this.imdbInfoType;
		  }
		  
			  
		});
	
	</script>
	
	
	<!-- for the feedback dialog box -->
	
	<script>
  $(function() {
   
    $( "#dialog-form" ).dialog({
      autoOpen: false,
      height: 800,
      width: 800,
      modal: true,
      buttons: {
	  
        "Submit": function() {
		
		var bValid = false;
		
		var rb1Checked = !(!$("input[name='rb1']:checked").val());
		var rb2Checked = !(!$("input[name='rb2']:checked").val());
		var rb3Checked = !(!$("input[name='rb3']:checked").val());
		var rb4Checked = !(!$("input[name='rb4']:checked").val());
		var rb5Checked = !(!$("input[name='rb5']:checked").val());
		var rb6Checked = !(!$("input[name='rb6']:checked").val());
		var rb7Checked = !(!$("input[name='rb7']:checked").val());
		var rb8Checked = !(!$("input[name='rb8']:checked").val());
		var rb9Checked = !(!$("input[name='rb9']:checked").val());
		var rb10Checked = !(!$("input[name='rb10']:checked").val());
		var profileName = $("#profileName").val();
	
		
		bValid = (rb1Checked && rb2Checked && rb3Checked && rb4Checked && rb5Checked && rb6Checked && rb7Checked && rb8Checked && rb9Checked && rb10Checked); 
	   
		if ( bValid ) {
	    	
	    	 var dataString  = 'rb1='+ $("input[name='rb1']:checked").val()+'';
				 dataString  = dataString  + '&'+ 'rb2='+ $("input[name='rb2']:checked").val()+'';
				 dataString  = dataString  + '&'+ 'rb3='+ $("input[name='rb3']:checked").val()+'';
				 dataString  = dataString  + '&'+ 'rb4='+ $("input[name='rb4']:checked").val()+'';
				 dataString  = dataString  + '&'+ 'rb5='+ $("input[name='rb5']:checked").val()+'';
				 dataString  = dataString  + '&'+ 'rb6='+ $("input[name='rb6']:checked").val()+'';
				 dataString  = dataString  + '&'+ 'rb7='+ $("input[name='rb7']:checked").val()+'';
				 dataString  = dataString  + '&'+ 'rb8='+ $("input[name='rb8']:checked").val()+'';
				 dataString  = dataString  + '&'+ 'rb9='+ $("input[name='rb9']:checked").val()+'';
				 dataString  = dataString  + '&'+ 'rb10='+ $("input[name='rb10']:checked").val()+'';
				 dataString  = dataString  + '&'+ 'profileName='+profileName+'';
				 
		
				 var postfeedbackUrl = $('#userFeedBackFrm').attr('action');
				 $.ajax({
					  type: "POST",
					  url: postfeedbackUrl,
					  data: dataString,
					  success: function responseRcvd(){
						  $("#feedbackSubmittedMsg").html("!!!!!!!! Dear User thank your for submitting your valuable feedback !!!!!");
						  
						  setTimeout(function(){
							  $( "#dialog-form" ).effect( "explode","slow");
							  $( "#dialog-form" ).dialog( "close" );
							  },1000);
						  
					  }

					}); 
				 
	  		  }
	    
        },
        Cancel: function() {
        	 $( "#dialog-form" ).effect( "explode","slow");
			 $( "#dialog-form" ).dialog( "close" );
          
        }
      }
  
  
    });
 
    $( "#feedbackfrm")
      .click(function() {
        $( "#dialog-form" ).dialog( "open" );
      });
	  
	  
  });
  </script>
	
	
	
</head>	
	
	<body>
	
				<div id="loadingmessage" style='display:none'>
  					<img id="loadingStatusImg" src="resources/images/ajax-loader.gif" />
				</div>
				
				
				
	
	<!-- 
				<img src="resources/images/banner-graphic.png" />
				 -->
				
	
	 <script>
      // 2. This code loads the IFrame Player API code asynchronously.
      var tag = document.createElement('script');
      tag.src = "https://www.youtube.com/iframe_api";
      var firstScriptTag = document.getElementsByTagName('script')[0];
      firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

      // 3. This function creates an <iframe> (and YouTube player)
      //    after the API code downloads.
      var player;
      function onYouTubeIframeAPIReady() {
        player = new YT.Player('player', {
          height: '225',
          width: '250',
          videoId: 'M7lc1UVf-VE',
          events: {
            'onReady': onPlayerReady,
            'onStateChange': onPlayerStateChange
          }
        });
      }

      // 4. The API will call this function when the video player is ready.
      function onPlayerReady(event) {
        event.target.playVideo();
      }

      // 5. The API calls this function when the player's state changes.
      //    The function indicates that when playing a video (state=1),
      //    the player should play for six seconds and then stop.
      var done = false;
      function onPlayerStateChange(event) {
        if (event.data == YT.PlayerState.PLAYING && !done) {
          setTimeout(stopVideo, 1000);
          done = true;
        }
      }
      
      function stopVideo() {
        player.stopVideo();
      }
      
    </script>
	
	
	 <div id="wrapper">
				
				<!-- 
				<img src="resources/images/banner-graphic.png" />
				 -->
				
				<div id="profilePhotoDiv">
					<img src="${mymap['image']}" alt="noimage" height="100" width="100">
			    	<p> Welcome : <c:out value="${mymap['profilename']}" />  </p>	
			    </div>
			   
			   <div id="profileInfoDiv">
			   		<nav>
			            <a id="feedbackfrm" href="#">Usability Feed Back </a> | 
			  			<a href="<c:url value="/signout"/>"> Sign out</a>
			  		</nav>
				</div>
				

				
				
				
				<div id="leftpanel">
				
				
					<!-- 1. The <iframe> (and video player) will replace this <div> tag. -->
		    		<div id="player"></div>
		    		
		    		
		    		
		    		<div id="accordion" style="width: 200px;">
		    			
		    			<h3> Youtube Play List </h3>
		    			<div id="playlistDivScrollable" style="width: 200px;">
	    					<ol id="playList"></ol>
						</div>
						
						<h3> Artist Info... </h3>
						<div id="artistLastFmInfo" style="width: 200px;"></div>
						
					</div>		
		    		
		    		
		    		
				</div>
		
		
			<div id="rightpanel">
				
				
				<!--  -->
				<div id="tabs">
				  
				  <ul>
				    <li><a href="#tabs-1" id="searchMusicLink">Search Music</a></li>
				    <li><a href="#tabs-2" id="searchEventsLink">Search Events</a></li>
				    <li><a href="#tabs-3" id="searchMovies">Search Movies</a></li>
				  </ul>
				  
					  <div id="tabs-1">
					   Artist Name/Band: <input type="search" id="artistName"> <button id="playArtist"> Watch  </button>
					  <div id="showSimilarArtists" class="kc-wrap"></div>
				  </div>
	
				  <div id="tabs-2">
				    <div>
				    	Country : <select id="country"> </select>
				    </div>
				    <div id="map-canvas"></div>
				
				  </div>
				  
				  
				  <div id="tabs-3">
				   	 <div>
				   		Movie Name:	<input type="search" id="movieName"> <button id="showMovieDetails"> Search Movies </button>
				    </div>
					<div id="infoDiv"></div>				    
				    <div id="carousel"></div>
				  </div>
				  
				</div>  
				<!--  -->
				
			</div>
		</div>

	 </div>
	
	
	
	
<div id="dialog-form" title="Feedback Form">
 <p class="validateTips">All form fields are required.</p>
 
 <p id="feedbackSubmittedMsg"></p>
 <form  id="userFeedBackFrm" action="<c:url value='/feedback'/>" method="post">
 	
  <fieldset>
  	<input type="hidden" id="profileName" name="profileName" value="<c:out value="${mymap['profilename']}"/>" /> 
    <table>

		<tr> 
			<td> 1.I think that I would like to use this system frequently. </td>			
		</tr>		
		<tr>
			<td>
					<table> 
						<tr> 
						  <td width="20%"> Strongly Disagree </td>
						  <td width="60%" colspan="3"> &nbsp; </td>
						  <td width="20%"> Strongly Agree </td>
						<tr>
						<tr>
							<td> <input type="radio" name="rb1" value="1"> </td>
							<td> <input type="radio" name="rb1" value="2"> </td>
							<td> <input type="radio" name="rb1" value="3"> </td>
							<td> <input type="radio" name="rb1" value="4"> </td>
							<td> <input type="radio" name="rb1" value="5"> </td>
						</tr>
					</table>
			</td>
		</tr>
	
		
		<tr> 
			<td> 2.I found the system unnecessarily complex. </td>
		</tr>
		<tr> <td>
					<table> 
						
						<tr> 
						  <td width="20%"> Strongly Disagree </td>
						  <td width="60%" colspan="3"> &nbsp; </td>
						  <td width="20%"> Strongly Agree </td>
						<tr>
						<tr>
							<td> <input type="radio" name="rb2" value="1"> </td>
							<td> <input type="radio" name="rb2" value="2"> </td>
							<td> <input type="radio" name="rb2" value="3"> </td>
							<td> <input type="radio" name="rb2" value="4"> </td>
							<td> <input type="radio" name="rb2" value="5"> </td>
						</tr>
						
					</table>
				</td>
		
		</tr>
		
		<tr> <td> 3. I thought the system was easy to use.</td> </tr>
		<tr>
			<td>
					<table> 
						
						<tr> 
						  <td width="20%"> Strongly Disagree </td>
						  <td width="60%" colspan="3"> &nbsp; </td>
						  <td width="20%"> Strongly Agree </td>
						<tr>
						
						<tr>
							<td> <input type="radio" name="rb3" value="1"> </td>
							<td> <input type="radio" name="rb3" value="2"> </td>
							<td> <input type="radio" name="rb3" value="3"> </td>
							<td> <input type="radio" name="rb3" value="4"> </td>
							<td> <input type="radio" name="rb3" value="5"> </td>
						</tr>
					</table>
				</td>
		</tr>
		
		<tr> <td> 4. I think that I would need the support of a technical person to be able to use this system. </td> </tr>
		<tr> <td>
					<table>  
						
						<tr> 
						  <td width="20%"> Strongly Disagree </td>
						  <td width="60%" colspan="3"> &nbsp; </td>
						  <td width="20%"> Strongly Agree </td>
						<tr>
						
						<tr>
							<td> <input type="radio" name="rb4" value="1"> </td>
							<td> <input type="radio" name="rb4" value="2"> </td>
							<td> <input type="radio" name="rb4" value="3"> </td>
							<td> <input type="radio" name="rb4" value="4"> </td>
							<td> <input type="radio" name="rb4" value="5"> </td>
						</tr>
						
					</table>
			</td>
		</tr>
		
		<tr> <td> 5.I found the various functions in this system were well integrated. </td> </tr>
		<tr> <td>
				<table> 
						<tr> 
						  <td width="20%"> Strongly Disagree </td>
						  <td width="60%" colspan="3"> &nbsp; </td>
						  <td width="20%"> Strongly Agree </td>
						<tr>
						<tr>
							<td> <input type="radio" name="rb5" value="1"> </td>
							<td> <input type="radio" name="rb5" value="2"> </td>
							<td> <input type="radio" name="rb5" value="3"> </td>
							<td> <input type="radio" name="rb5" value="4"> </td>
							<td> <input type="radio" name="rb5" value="5"> </td>
						</tr>						
					</table>
			</td>
		
		</tr>
		
		
		<tr> <td> 6.I thought there was too much inconsistency in this system. </td> </tr>
		<tr>
			<td>
				<table>
						<tr> 
						  <td width="20%"> Strongly Disagree </td>
						  <td width="60%" colspan="3"> &nbsp; </td>
						  <td width="20%"> Strongly Agree </td>
						<tr>
						<tr>
							<td> <input type="radio" name="rb6" value="1"> </td>
							<td> <input type="radio" name="rb6" value="2"> </td>
							<td> <input type="radio" name="rb6" value="3"> </td>
							<td> <input type="radio" name="rb6" value="4"> </td>
							<td> <input type="radio" name="rb6" value="5"> </td>
						</tr>
					</table>
			</td>
		</tr>
		
		<tr> <td> 7.I would imagine that most people would learn to use this system very quickly. </td> </tr>
		<tr>
			<td>
					<table>  
						<tr> 
						  <td width="20%"> Strongly Disagree </td>
						  <td width="60%" colspan="3"> &nbsp; </td>
						  <td width="20%"> Strongly Agree </td>
						<tr>
						
						<tr>
							<td> <input type="radio" name="rb7" value="1"> </td>
							<td> <input type="radio" name="rb7" value="2"> </td>
							<td> <input type="radio" name="rb7" value="3"> </td>
							<td> <input type="radio" name="rb7" value="4"> </td>
							<td> <input type="radio" name="rb7" value="5"> </td>
						</tr>
						
					</table>
			</td>
		</tr>
		
		<tr> <td> 8. I found the system very cumbersome to use. </td> </tr>
		<tr> 
			<td>
		
				<table> 
						
						<tr> 
						  <td width="20%"> Strongly Disagree </td>
						  <td width="60%" colspan="3"> &nbsp; </td>
						  <td width="20%"> Strongly Agree </td>
						<tr>
						
						<tr>
							<td> <input type="radio" name="rb8" value="1"> </td>
							<td> <input type="radio" name="rb8" value="2"> </td>
							<td> <input type="radio" name="rb8" value="3"> </td>
							<td> <input type="radio" name="rb8" value="4"> </td>
							<td> <input type="radio" name="rb8" value="5"> </td>
						</tr>
						
					</table>
		</td>
		
		</tr>
		
		<tr> <td> 9. I felt very confident using the system. </td> </tr>
		<tr>
			<td>
		
				<table> 
						
						<tr> 
						  <td width="20%"> Strongly Disagree </td>
						  <td width="60%" colspan="3"> &nbsp; </td>
						  <td width="20%"> Strongly Agree </td>
						<tr>
						
						<tr>
							<td> <input type="radio" name="rb9" value="1"> </td>
							<td> <input type="radio" name="rb9" value="2"> </td>
							<td> <input type="radio" name="rb9" value="3"> </td>
							<td> <input type="radio" name="rb9" value="4"> </td>
							<td> <input type="radio" name="rb9" value="5"> </td>
						</tr>
						
					</table>
			</td>
		</tr>
		
		<tr> <td> 10 .I needed to learn a lot of things before I could get going with this system. </td> </tr>
		<tr> 
			<td>
					<table> 
						<tr> 
						  <td width="20%"> Strongly Disagree </td>
						  <td width="60%" colspan="3"> &nbsp; </td>
						  <td width="20%"> Strongly Agree </td>
						<tr>
						<tr>
							<td> <input type="radio" name="rb10" value="1"> </td>
							<td> <input type="radio" name="rb10" value="2"> </td>
							<td> <input type="radio" name="rb10" value="3"> </td>
							<td> <input type="radio" name="rb10" value="4"> </td>
							<td> <input type="radio" name="rb10" value="5"> </td>
						</tr>
					</table>
			</td>
		</tr>
		
    </table>	
  
  
  
  </fieldset>
  </form>
</div>
	
<div id="error-dialog-modal" title="Error">
  <p id="error"></p>
</div>

<div id="dialog-modal" title="Error">
  <p id="notFoundError"></p>
</div>
	
	

	</body>
</html>
