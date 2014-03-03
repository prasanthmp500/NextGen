<!DOCTYPE html> 

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html lang="en">

<head> 
  <jsp:include page="../fragments/headTag.jsp"/>
	
	
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
		    	var youtTubePlaylistId = "";
		    	if(input.length > 0){
		    		<!-- -->
					 $.get("/NextGen/searchYoutube/playlist/".concat(input),function(data,status){
						  if(status=="success"){
				    	      var jsonObjectPlayList = jQuery.parseJSON(data);
				    	      youtTubePlaylistId = jsonObjectPlayList.items[0].id.playlistId;
				    	      
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
		   							$div.attr('title',jsonObjectSimilarArtists.similarartists["artist"][i].name);
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
		    
		    	$.get("/NextGen/search/allEvents/".concat(locationSelected),function(data,status){
		    		if(status=="success"){
		    			
		    			var eventDetails = jQuery.parseJSON(data);	
		    			
		    			deleteMarkers();
		    			
		    			for(var i=0; i < (eventDetails.events["event"]).length;i++ ){
		    				
		    				var event = (eventDetails.events["event"])[i];		    				
		    				var geo = eventDetails.events["event"][i].venue.location["geo:point"];
		    				var eventLatLng =  new google.maps.LatLng(geo["geo:lat"] ,geo["geo:long"]);
		    				var marker = new google.maps.Marker({position: eventLatLng,animation: google.maps.Animation.DROP, title: event.title });
		    				marker.setMap(map);
		    				google.maps.event.addListener(marker, 'click',setInfoWindowOnMarker(event, map, marker) );
		    				markers.push(marker);
		    			}
		    			
		    			
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
		    	
		    	
		    	var content = '<div id="content">'+
		    					'<h1 id="firstHeading" class="firstHeading">'+ event.title +'</h1>'+
		    					'<p> Artists </p>'+
		    					'<p>'+ event.artists.headliner + '</p>'+
		    					'<p> Venue Details </p>'+
		    					'<p> Venue Name '+ event.venue.name +'  </p>'+
		    					'<p> Venue Name Location  </p>'+
		    					'<p> City '+ event.venue.location.city +'  </p>'+
		    					'<p> Country '+ event.venue.location.country +'  </p>'+
		    					'<p> Street '+ event.venue.location.street +'  </p>'+
		    					'<p> Postal Code '+ event.venue.location.postalcode +'  </p>'+
		    					'<p> Phone Number '+ event.venue.phonenumber +'  </p>'+
		    					'<p> last fm url  '+ event.venue.url +'  </p>'+
		    					'<p> website url  '+ event.venue.website +'  </p>'+
		    					'<p> <img src="'+event.image[3]['#text']+'"> </p>'+
		    					'<p> website url  '+ event.startDate +'  </p>'+
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
		    	mapOptions = {center: new google.maps.LatLng(51.5072,0.1275), zoom: 4};
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
									  
						    	  	  	$(movieNameInput).autocomplete({source: movies});					    	  	  
							     	 
									 }
									 
						   		 });
							}		  
					  	});	
		 	
		 	 
		 	$("#showMovieDetails").click(function(){
		 		
		 	  var input = $("#movieName").val();
	
		 	  if(input.length > 3 ){
		 		
		 		  $.get("/NextGen/searchMovie/search/".concat(input), function(data,status){
		 			 if(status=="success"){
		 			
		 			     var jsonObject = jQuery.parseJSON(data);		
				         var arrayResultLength = (jsonObject["movies"]).length; 
			    	     
				        // $("#sliceBoxWrapper").append("<ul id='sb-slider' class='slider'>");
				         
				       //   $("#sb-slider").empty();
				        
				       
				   //    var list = $("#sliceBoxWrapper").prepend('<ul id="sb-slider" class="sb-slider"></ul>');
							
				            
				   			$("#carousel").empty();
				   			for(var i=0;i<arrayResultLength;i++){
			    	    	 
				        	var img = $('<img>'); //Equivalent: $(document.createElement('img'))
			    	    	img.attr('src', (jsonObject["movies"][i]).posters.original);
			    	    	img.height(300);
			    	    	img.width(300);
			    	    	$("#carousel").append(img);
			    	    	 
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
          width: '350',
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
	
	
		</script>
	

	
	
	
	 <div id="wrapper">
	 
		<div id="header">
				<img src="resources/images/banner-graphic.png" />
				<p> NextGeneration Entertainment </p>	
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
			   		<input type="search" id="artistName"> <button id="playArtist"> Watch  </button>
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
			   		<input type="search" id="movieName"> <button id="showMovieDetails"> Search Movies  </button>
			    </p>
			    

			  <div id="carousel">
			  
			  
			  
			  </div>
			    
			    
			  </div>
			  
			</div>



  

			<!--  -->	
			
			
			
			
		</div>
		 
	 	<div id="footer">
			
		</div>
	 
	 </div>
	
	
	

	</body>
</html>
