<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="sideBar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/05d425af79.js" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,300;0,900;1,100;1,200;1,400;1,900&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.5/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.5/dist/sweetalert2.min.js"></script>
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
			<div style="width: 80vw;">
			
				<img id="poster" class="img-fluid mt-5 rounded shadow mx-auto mb-2 mt-4" style=" display: block;" alt="Responsive image" /> 
				<video class="d-none mt-4" id="videoBox" style="width: 65vw;" autoplay muted>
					<source src="get-Video-Based-On-Id?id=${requestScope.media_id}" type="video/mp4">
				</video>
				
				<div style="width: 100%;" class="d-flex justify-content-center align-items-center flex-column">
					<h1 class="display-2 text-light text-center mt-4" id="name"></h1>
					<h1 class="display-4 text-light text-center mb-5 mt-4" id="date"></h1>
					<p id="overview"  style="width: 60vw; font-family: 'Sacramento', cursive; font-size: 30px; color: #8E8B9A; letter-spacing: 3px;"></p>
				</div>
				
				<div class="d-flex justify-content-center align-items-center flex-column mb-5">
					<button type="button" class="btn btn-outline-light btn-lg mb-2 mt-3">Watch Episode</button><div id="addIcon" class="rounded d-flex justify-content-center align-items-center"><i class="fa-duotone fa-plus text-light" style="font-size: 20px;"></i></div>
				</div>
			</div>

		</div>


</body>

<script>

	let id;
	let posterPath;
	let overview;
	let releaseData;
	let title;

	async function getDetailsObjectOfMedia() {
		let url = "https://api.themoviedb.org/3/movie/"+id+"?api_key=296bd1ae695a72c69dba2a4d67dd7ec2";
		fetch(url)
		.then(function(response) {
			return response.json();
		})
		.then(function(data){
			posterPath = data.poster_path;
			overview = data.overview;
			releaseData = data.release_date;
			title = data.original_title;
			appendPoster();
		});
	}
	
	function getIdFromUrl() {
		let queryString = window.location.search;
		let searchParams = new URLSearchParams(queryString);
		
		id = searchParams.get("id");
	}
	
	function appendPoster() {
		document.querySelector("#poster").src = 'https://image.tmdb.org/t/p/w500' + posterPath + '?api_key=296bd1ae695a72c69dba2a4d67dd7ec2';
		document.querySelector("#name").textContent = 'Name : '+title;
		document.querySelector("#overview").textContent = 'Overview : '+overview;
		document.querySelector("#date").textContent = "Release Date : "+releaseData;
	}
	
	getIdFromUrl();
	getDetailsObjectOfMedia();
</script>

</html>