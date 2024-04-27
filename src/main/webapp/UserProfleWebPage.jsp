<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="sideBar.jsp" %>
<%@ page import="dto.User" %>
<%@ page import="dao.UserDao" %>


<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>User Profile</title>
    <script src="https://kit.fontawesome.com/05d425af79.js" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.5/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.5/dist/sweetalert2.min.js"></script>
	<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@900&family=Righteous&family=Sacramento&display=swap" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
  	<style>
  		body{
  			background-color: rgb(15,16,20);
  			margin: 0;
  			padding: 0;
  		}
  		#top1{
  			background-color: #320A28;
  			width: 90vw;
  			height: 90vh;
  		}
  		#banner{
			width: 100vw;
			height: 85vh;
			background-image: url('images/userBanner.jpg');
			background-size: cover;
  		}
  		#bluredDiv{
			width: 100%;
			height: 100%;
			backdrop-filter: blur(3px);  		
  		}
  		.rounded-image{
			width: 150px;
			height: 170px;
			border-radius: 50%;
			overflow: hidden;
			vertical-align: middle;		
  		}
  		#profile{
  			position: absolute;
  		}
		#image{
			display: none;
		}
  		#imageLabel {
			color: white;
	        height: 60px;
	        width: 250px;
	        background-color: #f5af09;
	        position: relative; 
	        font-size: 20px;
	        display: flex;
	        justify-content: center;
	        align-items: center; 	
	        font-family: 'Montserrat', sans-serif;
	        border-radius: 5px;
	        cursor: pointer;
  		}
  		.moreDetails{
  			position: relative;
			bottom: 3px;
			font-family: 'Sacramento', cursive !important;
			color: white;
			font-size: 20px;
			display: block;
			text-align: center;
			text-decoration: none;
			letter-spacing: 4px;
			transition-property: transform;
			transition-timing-function: ease;
			transition-duration: 0.2s;
  		}
  		
  		.moreDetails:hover{
  			color: white;
  			transform: scale3d(1.2, 1.2, 1);
  		}
  		
  	</style>
  </head>
  <body>
  
	<div id="banner" class="d-flex justify-content-center align-items-center">
	
		<div id="bluredDiv"></div>
		
		<div id="profile" class="d-flex justify-content-center flex-column align-tems-center">
		
			 <%
			  	User user = (User)session.getAttribute("user");
			  	String profileStatus = user.getProfileStatus();
			  	if(profileStatus.length() == 0) {
			  		out.println("<img src='images/profile.png' class='mb-3 rounded-image' style='width: 180px; display: block; margin-left: auto; margin-right: auto;'>");
			  	}
			  	else {
			  		out.println("<img src='get-profile-of-user' class='mb-3 rounded-image' style='width: 180px; display: block; margin-left: auto; margin-right: auto;'>");
			  	}
			  %>
			  <h1 class="display-1 mb-5">${sessionScope.user.name}</h1>
			 <form class="mx-auto" id="uploadForm" onsubmit="uploadProfile(event)">
				  <input type="file" accept=".jpeg, .jpg, .png" name="profile" class="form-control" id="image" >
				  <label id="imageLabel" for="image"><i class="fa-solid fa-file-import px-2"></i>Choose Profile</label>
				  <button type="submit" class="btn btn-dark btn-lg mx-auto mt-3" style="display: block">Upload</button>
			</form>
		
		</div>
	
	</div>
	
	<h1 class="display-1 mb-5 text-center mt-5" style="color: #FF70A6; letter-spacing: 4px; ">Watch List</h1>
	<div class="thumbnail-gallery container mt-5">
		
		<div class="row"  id="gallery-row1">
		
		</div>
		
		<div class="row mt-5" id="gallery-row2">
		
		</div>
	
		<div class="load-more d-flex justify-content-center align-items-center pt-4">
			<button type="button" onclick="loadMoreContent(event)" class="btn mx-5 showMore" style="background-color: #FED6E5;"><i class="fa-sharp fa-solid fa-backward"></i></button>
			<button type="button" onclick="loadLessContent(event)" class="btn showMore" style="background-color: #FED6E5;"><i class="fa-solid fa-forward"></i></button>
		</div>
		
	</div>
	
	<a href="Send-Index-Page">Index page</a> 
	
  	<script>
  	
  		let limit = 4 , offset = -1 , count = 0 , mediaCount = 0;
  		let response1;
  		
  		function checkLength() {
  			console.log("hy1");
  			let length = response1.length;
  			if(length < 4) {
  			
  				document.querySelectorAll(".showMore").forEach((ele)=>{
  					ele.classList.add("d-none");
  				});
  				
  			}
  		}
  		
  		function makeRowEmpty() {
  			document.querySelector("#gallery-row1").innerHTML = "";
  			document.querySelector("#gallery-row2").innerHTML = "";
  		}
  		
  		function loadMoreContent() {
  			
  			makeRowEmpty();
  			
  			mediaCount = 0;
  			let i = offset ;
  			
  			if(i == response1.length-1){
  				offset = -1;
  				mediaCount = 0;
  				getWatchListMedia();
  			}
  			
  			while(i < response1.length-1){
  				
        		if(mediaCount == 3) {
        			break;
        		}
  				i++;
        		offset++;
  				let media = response1[i];
        		let name = media.name;
        		let mediaId = media.media_id;
        		let category = media.category;	
        		
        		createThumbnail(name , mediaId , category);
        		
        		mediaCount++;
        		
  			}
  			
  		}
  		
  		function loadLessContent() {
  			
  			makeRowEmpty();
  			
  			mediaCount = 0;
  			let i = offset;
  			while(i > 0){
  				
  				let media = response1[i];
        		let name = media.name;
        		let mediaId = media.media_id;
        		let category = media.category;	
        		
        		createThumbnail(name , mediaId , category);
  				i--;
        		offset--;
        		
        		mediaCount++;
        		if(mediaCount == 4) {
        			break;
        		}
        		
  			}
  			
  			/* ab element bache h ni retrieve karne ke liye  */
  			if(i == 0 && mediaCount == 0){
  				offset = -1;
  				mediaCount = 0;
  				getWatchListMedia();
  			}
  			
  		}
  		
  		function createThumbnail(name ,mediaId ,category) {
	  		
  			
	  		let card = document.createElement("div");
	  		card.classList.add("card" , "col-6");
	  		card.style.backgroundColor = "rgb(25,25,28)";
	  		card.style.color = "#605D6B";
	  		
	  		let img = document.createElement("img");
	  		img.classList.add("rounded");
	  		img.src = "media-List-Image?id="+mediaId;
	  		card.appendChild(img);
	  		
	  		let b1 = document.createElement("div");
	  		b1.classList.add("card-body");
	  		
	  		let p = document.createElement("p");
	  		p.classList.add("text-center");
	  		p.style.fontFamily = "'Montserrat', sans-serif";

	  		
	  		let a = document.createElement("a");
	  		a.classList.add("moreDetails");
	  		a.href = "get-all-info-media?id="+mediaId;
	  		a.textContent = "More Details";
	  		
	  		p.textContent = name;
	  		b1.appendChild(p);
	  		b1.appendChild(a);
	  		
	  		card.appendChild(b1);
	  		
  			if(count < 2) {
  				document.getElementById("gallery-row1").appendChild(card);
  			}
  			else {
  				document.getElementById("gallery-row2").appendChild(card);
  				
  			}
  			
  			count++;

  			if(count == 4)
  				count = 0;
  		}
  		
  		async function getWatchListMedia() {
  			makeRowEmpty();
  			await $.ajax({
                type: "GET",
                url: "get-watchList-media?limit="+limit+"&offset="+offset,
                headers: {
                	"custom-header": "application/json",
                },
                success: function (response) {

		  			console.log("hy2");
                	let gallery = document.querySelector("#gallery-row");
                	
                	response1 = response;
                	let i = offset; 
                	
                	if(response.length == 0)
                		return;
                	
                	while(i < response.length) {
                		
                		i++;
                		offset++;
                		let media = response[i];
                		let name = media.name;
                		let mediaId = media.media_id;
                		let category = media.category;	
                		
                		createThumbnail(name , mediaId , category);
                		
                		mediaCount++;
                		
                		if(mediaCount == 4) {
                			break;
                		}
                		
                	}
                	
                },
                error: function (error) {
                	
                }
            });
  		}
  	
	  	function showAlert(title, text, icon, button) {
			Swal.fire({
	            title: title,
	            text: text,
	            icon: icon,
	            confirmButtonText: button
	        }).then(()=>{
	        	window.location.reload();
	        });
		}	
  		
  		function uploadProfile(event) {
  			
  			event.preventDefault();
  			
  			let form = document.getElementById("uploadForm");
  			let formData = new FormData(form);
  			
  			$.ajax({
                type: "POST",
                url: "upload-user-profile",
                data: formData,
                processData: false,
                contentType: false,
                success: function (response) {
                	if(response.trim() == "success") {
                		showAlert("Dear User", "Profile Updated Successfully", "success", "OK");
                	}
                	else {
                		showAlert("Dear User", "Problem In Uploading Image!", "error", "OK");
                	}
                },
                error: function (error) {
                	showAlert("Dear User", "Some Network Problem , Try Later!", "error", "OK");
                }
            });
  		}
  		
  		async function temp() {
	  		await getWatchListMedia();
	  		checkLength(); 
  		}
  		temp();
  	</script>
  </body>
</html>