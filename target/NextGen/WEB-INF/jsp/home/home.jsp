<!DOCTYPE html> 

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html lang="en">

<head> 
  <jsp:include page="../fragments/headTag.jsp"/>
	
	
	<script type="text/javascript">
	
	$(document).ready(function(){	
		 
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
				<img src="resources/images/banner-graphic.png" />
				<p> NextGeneration Entertainment </p>	
		</div>
		
		<div id="leftpanel">
			<!-- 1. The <iframe> (and video player) will replace this <div> tag. -->
    		<div id="player"></div>
		</div>
		
		
		<div id="rightpanel">
			<input type="search" id="artistName"> 
			<button id="playArtist"> Watch  </button>
		</div>
		 
	 	<div id="footer">
			
		</div>
	 
	 </div>
	
	
	

	</body>
</html>
