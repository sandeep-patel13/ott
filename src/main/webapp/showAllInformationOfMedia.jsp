<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="sideBar.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/05d425af79.js" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,300;0,900;1,100;1,200;1,400;1,900&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.5/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.5/dist/sweetalert2.min.js"></script>
<title>Show All Info Of Media</title>

<style>

	body{
		
		background-color: rgb(15,16,20);
	
	}

	.shadow{
		box-shadow: rgba(17, 12, 46, 0.15) 0px 48px 100px 0px;
	}
	
	.fontOne {
	  font-family: 'Montserrat', sans-serif;
	  font-weight: 400;
	}
	#addIcon{
		background-color: #694966;
		width: 50px;
		height: 50px;
		cursor: pointer;
	}
	#addIcon:hover{
		background-color: #8E648A;
	}
</style>
</head>




<body>

		<div class="d-flex justify-content-center">

			<%  
			  String id = (String) request.getAttribute("media_id");
			  String url = "media-List-Image?id=" + id;
			%>
			<div>
			
				<img id="poster" class="img-fluid mt-5 rounded shadow mx-auto mb-2 img-fluid mt-4" style="width: 65vw; display: block;" alt="Responsive image" src='<%= url %>'/> 
				<video class="d-none mt-4" id="videoBox" style="width: 65vw;" autoplay muted>
					<source src="get-Video-Based-On-Id?id=${requestScope.media_id}" type="video/mp4">
				</video>
				
				<p class="fontOne shadow p-2" style="color: white;  display: block; width: 400px;"><strong>Name</strong> : ${media.name}</p>
				<p class="fontOne  shadow p-2" style="color: white;  display: block; width: 400px;"><strong>Category</strong>  : ${media.category}</p>
				<p class="fontOne  shadow p-2" style="color: white; display: block; width: 400px;"><strong>Ratings</strong>  : ${mediaInfo.ratings}</p>
				<p class="fontOne shadow p-2" style="color: white; display: block; width: 400px;"><strong>Length</strong>  : ${mediaInfo.length}</p>
				<p class="fontOne shadow p-2" style="color: white; display: block; width: 65vw;"><strong>Discription</strong>  : ${mediaInfo.discription}</p>
				<p class="fontOne shadow p-2" style="color: white; display: block; width: 400px;"><strong>Release Date</strong>  : ${mediaInfo.release_date}</p>
				<p class="fontOne shadow p-2" style="color: white; display: block; width: 400px;"><strong>Directors</strong>  : ${mediaInfo.directors}</p>
				<p class="fontOne shadow p-2" style="color: white; display: block; width: 400px;"><strong>Actors</strong>  : ${mediaInfo.actors}</p>
			</div>

		</div>
		<div class="d-flex justify-content-center align-items-center flex-column mb-5">
			<button type="button" class="btn btn-outline-light btn-lg mb-2">Watch Episode</button><div id="addIcon" class="rounded d-flex justify-content-center align-items-center"><i class="fa-duotone fa-plus text-light" style="font-size: 20px;"></i></div>
		</div>

	</body>
	
	<script>
	
	function showAlert(title, text, icon, button) {
		Swal.fire({
            title: title,
            text: text,
            icon: icon,
            confirmButtonText: button
        });
	}
	
	function addMediaOnWatchList() {
		
		let mediaId = '${requestScope.media_id}';
		
		$.ajax({
           type: "GET",
           url: "add-media-to-watchlist?id="+mediaId,
           success: function (response) {
           	if(response.trim() == "success") {
           		showAlert("Dear User", "Media Added On WatchList", "success", "OK");
           	}
           	else {
           		showAlert("Dear User", "Media Is Already Added!", "error", "OK");
           	}
           },
           error: function (error) {
           	showAlert("Dear User", "Some Network Problem , Try Later!", "error", "OK");
           }
        });	
	}
	
	function setReloadTime() {
		localStorage.setItem('reloadTime', Date.now());
	}

	function playVideo() {
		const reloadTime = localStorage.getItem('reloadTime');
		const currentTime = Date.now();
		const diff = (currentTime - reloadTime) / 1000;
		if(diff > 5) {
			
			document.getElementById("poster").classList.toggle("d-none");
			document.getElementById("videoBox").classList.toggle("d-none");
			clearInterval(intervalid);
			
		}
	}	

	document.getElementById("addIcon").addEventListener("click", addMediaOnWatchList);
	intervalid = setInterval(playVideo , 1000);
	
		
	</script>
</html>





























