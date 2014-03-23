<!DOCTYPE html> 

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html lang="en">

<head> 
  <jsp:include page="../fragments/headTag.jsp"/>
	<c:set var="nextCss" value="/resources/css/nextgen.css" />
    <link type="text/css" href="<%= request.getContextPath()%>${nextCss}" rel="stylesheet"/>  
	
	<script type="text/javascript">
	
	var Page;
			$(function() {
				
				Page = (function() {

					var $navArrows = $('#nav-arrows' ).hide(),
						$shadow = $( '#shadow' ).hide(),
						slicebox = $( '#sb-slider' ).slicebox( {
							onReady : function() {

								$navArrows.show();
								$shadow.show();

							},
							orientation : 'r',
							cuboidsRandom : true,
							disperseFactor : 30
						} ),
						
						init = function() {

							initEvents();
							
						},
						initEvents = function() {

							// add navigation events
							$navArrows.children( ':first' ).on( 'click', function() {

								slicebox.next();
								return false;

							} );

							$navArrows.children( ':last' ).on( 'click', function() {
								
								slicebox.previous();
								return false;

							} );

						};

						return { init : init };

				})();

				Page.init();

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
				 $.get("/NextGen/search/artist/".concat(input),function(data,status){
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
		    	if(input.length > 0){
		    		// play selected input artist name in youtube 
		    			playYouTubeArtistPlayList(input);
		    		}
		    	
		   		 }).click(function(){
		   			var input = $("#artistName").val();
		   			if(input.length > 3){
		   			
		   				$.get("/NextGen/search/similarArtist/".concat(input),function(data,status){
		   					if(status=="success"){
		   						var jsonObjectSimilarArtists = jQuery.parseJSON(data);
		   						var showDiv = $('#showSimilarArtists');
		   						for(var i=0;i<(jsonObjectSimilarArtists.similarartists["artist"]).length;i++){
		   							var $div = $("<div>", {class: "kc-item"});
		   							var img  = $('<img>');
		   							img.attr('src', jsonObjectSimilarArtists.similarartists["artist"][i].image["4"]["#text"]);
		   							
		   							var artistName = jsonObjectSimilarArtists.similarartists["artist"][i].name;
		   							$div.attr('title',artistName);
		   							$div.attr('artistName',artistName);
		   							$div.click(function(e){
				    	    			playSelectedArtist(e);
				    	    		});
		   							
		   							
		   							
		   							$div.append(img);
		   							
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
		   					}		   						
		   				});//end of get function
		   				
		   				
		   			}
		   			
		   			 
		   		 });
		    
		    
   			function playSelectedArtist (event) {   				
   				var artistName = $(event.currentTarget).attr('artistName');
   				playYouTubeArtistPlayList(artistName);
	   			
   			}
   			
   			function playYouTubeArtistPlayList(input){
   			 $.get("/NextGen/searchYoutube/playlist/".concat(input),function(data,status){
				  if(status=="success"){
		    	      var jsonObjectPlayList = jQuery.parseJSON(data);
		    	      var youtTubePlaylistId = jsonObjectPlayList.items[0].id.playlistId;
		    	      
		    	      // get the video ids in the playlist 
		    	   
		    	      $.get("/NextGen/searchYoutube/loadPlaylistItem/".concat(youtTubePlaylistId), function(data,status){ 
		    	    	  if(status=="success"){
		    	    		  var jsonObjectPlayListItems = jQuery.parseJSON(data);	  
		    	    		    var playListItemsArray = jsonObjectPlayListItems["items"];
		    	    		    var videoId = new Array();
		    	    		    for(var i=0;i<playListItemsArray.length;i++){
		    	    		    	videoId[i] = playListItemsArray[i].snippet.resourceId.videoId
		    	    		    }
		    	  
		    	    		    player.loadPlaylist(videoId)
		    	    		    player.playVideo();
		    	    	  }
		    	      });
			     	 }	
		   		 });
   			}
   			
   			
		    
		    
		    $(function(){		    	
		    	  $.get("/NextGen/search/allEventLocations",function(data,status){
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
		    	
		    	var locationSelected = $(this).val();
		    
		    	deleteMarkers();
		    	
		    	$.get("/NextGen/search/allEvents/".concat(locationSelected),function(data,status){
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
		    	
		    	$.get("/NextGen/searchCountry/search/".concat(locationSelected),function(data,status){
		    		
		    		if(status=="success"){
		    			    var marker = new google.maps.Marker();
		    				var eventLatLng =  new google.maps.LatLng(data.latitude ,data.longitude);		    				
		    				marker.setPosition(eventLatLng);
		    				marker.setAnimation(google.maps.Animation.DROP);
		    				marker.setTitle(data.name);
		    				marker.setIcon({url:data.imageUrl, scaledSize:new google.maps.Size(25, 25) });
		    				marker.setMap(map);
		    				markers.push(marker);
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
		    						'<p> <span style="font-weight:bold;text-decoration:underline"> Artists  </span></p>'+
		    						'<p> <span style="font-weight:bold"> Head Liner  </span>'+ event.artists.headliner + '</p>'+
		    						'<p> <span style="font-weight:bold;text-decoration:underline"> Venue Details </span> </p>'+
		    						'<p> <span style="font-weight:bold">Venue Name: </span>'+ event.venue.name +'  </p>'+
		    						'<p> <span style="font-weight:bold;text-decoration:underline"> Venue Name Location </span></p>'+
		    						'<p> <span style="font-weight:bold">City: </span>'+ event.venue.location.city +'  </p>'+
		    						'<p> <span style="font-weight:bold">Country: </span>'+ event.venue.location.country +'  </p>'+
		    						'<p> <span style="font-weight:bold">Street: </span>'+ event.venue.location.street +'  </p>'+
		    						'<p> <span style="font-weight:bold">Postal Code: </span>'+ event.venue.location.postalcode +'  </p>'+
		    						'<p> <span style="font-weight:bold">Phone Number: </span>'+ event.venue.phonenumber +'  </p>'+
		    						'<p> <span style="font-weight:bold">Last fm url: </span>'+ event.venue.url +'  </p>'+
		    						'<p> <span style="font-weight:bold">Website url: </span>'+ event.venue.website +'  </p>'+
		    						'<p> <img src="'+event.image[3]['#text']+'"> </p>'+
		    						'<p> <span style="font-weight:bold"> Event Date: </span>'+ event.startDate +' </p>'+
		    						'<p> <span style="font-weight:bold">Tags: </span>'+ eventTag  +'</p>'+
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
					
						 $.get("/NextGen/searchMovie/search/".concat(input),function(data,status){
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
		 		
		 	  $("#infoDiv").empty();
				  
		 		
		 	  var input = $("#movieName").val();
	
		 	  if(input.length > 3 ){
		 		
		 		  $.get("/NextGen/searchMovie/search/".concat(input), function(data,status){
		 			 if(status=="success"){
		 			
		 			     var jsonObject = jQuery.parseJSON(data);		
				         var arrayResultLength = (jsonObject["movies"]).length; 
				         movieMap = new Object();
				        // $("#sliceBoxWrapper").append("<ul id='sb-slider' class='slider'>");
				         
				       //   $("#sb-slider").empty();
				        
				       
				   	//    var list = $("#sliceBoxWrapper").prepend('<ul id="sb-slider" class="sb-slider"></ul>');
							
				            
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
			    	    		var movie_cast = '';
			    	    		
			    	    		if(typeof movieItem.abridged_cast != "undefined" ) {
			    	    			for(var j=0;j<movieItem.abridged_cast.length;j++) {
			    	    				
			    	    				movie_cast = movie_cast + ''+ movieItem.abridged_cast[j].name +'|';
				    	    		
			    	    			}
			    	    		}
			    	    		
			    	    		movieMap[id] = new Movie(id,movie_title,movie_year,movie_mpa_rating,movie_runtime,movie_critics_consensus,movie_cast );
			    	    		
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
			    	 
			    	     
			    	     
		 			 }
		 		  });
		 	  	}
		 	});
		 	
		 	
		  function showMovieInfoInDetail(event) {
			  
			  var movieToDisplay =  movieMap[event.currentTarget.id]; 
			  
			  var infoDivTag =  $("#infoDiv");
			  infoDivTag.empty();
			  
			  
			  var titleTag = $('<p></p>');
			  titleTag.append('<span style="font-weight:bold;text-decoration:underline">'+  movieToDisplay.title() + '</span>');
			  infoDivTag.append(titleTag);
			  
			  
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
			  
			  
		  }
		  
		  
		  function Movie (id,movie_title,movie_year,movie_mpaa_rating,movie_runtime,movie_critics_consensus,movie_cast ){
			  this.id = id;
			  this.movie_title = movie_title;
			  this.movie_year = movie_year;
			  this.movie_mpaa_rating = movie_mpaa_rating;
			  this.movie_runtime = movie_runtime;
			  this.movie_critics_consensus = movie_critics_consensus;
			  this.movie_cast = movie_cast;
		  }
		  
		  
		  Movie.prototype.title = function(){
		      return this.movie_title;
		  }

		  
		  Movie.prototype.releaseYear = function(){
		      return this.movie_year;
		  }
		  
		  Movie.prototype.mpaaRating = function(){
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
          $( this ).dialog( "close" );
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
          width: '400',
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
	 
		<div id="header">
				
				<!-- 
				<img src="resources/images/banner-graphic.png" />
				 -->
				
				
				
				<div id="profilePhotoDiv">
					<img src="${mymap['image']}" alt="noimage" height="100" width="100">
			    	<p> Welcome : <c:out value="${mymap['profilename']}"/> </p>	
			    </div>
			   
			   <div id="profileInfoDiv">
			   		<nav>
			            
			            <a id="feedbackfrm" href="#">Usability Feed Back </a> | 
			  			<a href="<c:url value="/signout"/>"> Sign out</a>
			  		
			  		</nav>
				</div>
				
		</div>
		
		<div id="leftpanel">
			<!-- 1. The <iframe> (and video player) will replace this <div> tag. -->
    		<div id="player"></div>
    		
		</div>
		
		
		<div id="rightpanel">
			
			
			<!--  -->
			<div id="tabs">
			  <ul>
			    <li><a href="#tabs-1" id="searchMusicLink">Search Music</a></li>
			    <li><a href="#tabs-2" id="searchEventsLink">Search Events</a></li>
			    <li><a href="#tabs-3" id="notYet">Search Movies</a></li>
			  </ul>
			  
			  <div id="tabs-1">
			    <p>
			   	  Artist Name: <input type="search" id="artistName"> <button id="playArtist"> Watch  </button>
			    </p>
			
			    <div id="showSimilarArtists" class="kc-wrap"></div>
			  </div>

			  <div id="tabs-2">
			    <p>
			    	Country : <select id="country"> </select>
			    </p>
			    <div id="map-canvas"></div>
			
			  </div>
			  
			  
			  <div id="tabs-3">
			    <p>
			   	Movie Name:	<input type="search" id="movieName"> <button id="showMovieDetails"> Search Movies </button>
			    </p>
			    
				<div id="infoDiv">
				</div>
			    
			    <div id="carousel">
			  	</div>
			  		
			  </div>
			  
			</div>  

			<!--  -->	
			
			
			
		</div>
		 
	 	<div id="footer">
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
	
	
	
	

	</body>
</html>
