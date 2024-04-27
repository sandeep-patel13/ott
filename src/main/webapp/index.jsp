<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*"%>
 
<%@ taglib prefix="mytag" uri="/WEB-INF/tag.tld" %>
<%@ taglib prefix="mytag2" uri="/WEB-INF/tag.tld" %>
<%@ include file="sideBar.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@900&family=Righteous&family=Sacramento&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/05d425af79.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.5/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.5/dist/sweetalert2.min.js"></script>
<style>
	
	body{
		
		font-size: 16px;
		margin: 0;
		padding: 0;
		background-color: #19191C;
	
	}
	
	.shadow{
		box-shadow: rgba(17, 12, 46, 0.15) 0px 48px 100px 0px;
	}

	#poster{
	
		background-color: #2F131E;
/* 		padding-left: 8%;
 */		position: sticky;
		top: 0px;
		margin-left: 60px;
		overflow-x: hidden;
		
	}
	
	#content{
	
		background-color: #19191C;
		margin-left: 90px;
		margin-top: 50px;	
		position: absolute;
	
	}
	
	.genres{
	
		background-color: #0f1014;
		margin-top: 30px;
		display: flex;
		flex-direction: column;
		padding-top: 20px;
		padding-bottom: 20px;
	
	}
	
	.viewAll{
		
		opacity: 0;
		transition-property: opacity;
		transition-duration: 0.5s;
		transition-timing-function: ease;
	
	}
	
	.details{
	
		width: 60%;
		height: 60%;
		color: white;
		position: absolute;
		top: 150px;
		z-index: 1;
		padding-left: 40px;
	
	}
	
	.details p{
		
		font-family: 'Sacramento', cursive;
		font-size: 25px;
	
	}
	
	.details h2{
		
		font-family: 'Montserrat', sans-serif;
	
	}

	.imagePoster p, .imagePoster button{
	
		font-family: 'Righteous', sans-serif;
	
	}
	
	.imagePoster .info{
	
		font-family: 'Sacramento', cursive !important;
		font-size: 25px;
	
	}

	.mediaContainer{
		
		margin-bottom: 30px;
		justify-content: space-between;
	
	}
	
	
 	.imagePoster{
 	
	 	width: 20%;
	 	margin-right: 15px;
	 	background-color: #19191C;
		transition-property: transform;
		transition-delay: 0.2s;
		transition-duration: 0.2s;
		transition-timing-function: ease;
		border-radius: 5px;
		cursor: pointer;
	
	}

	.imagePoster:hover{
		
		transform: scale3d(1.1, 1.1, 2);
		
	
	}

	#sideBar{
	
		width: 90px;
		height: 100vh;
		background-color: #141415;
		position: fixed;
		z-index: 1;
		display: flex;
		justify-content: center;
		align-items: center;
		flex-direction: row;
		
	}

	#sideBarPart1{
	
		display: flex;
		flex-direction: column;
		height: 50vh;
		justify-content: space-between;
		width: 60px;
		align-items: center;
	
	}
	
	.heading{
	
		text-align: center;
		font-family: 'Montserrat', sans-serif;
		letter-spacing: 1px;
		
	}
	
	.cards{
	
		cursor: pointer;
		transition-property: transform;
		transition-duration: 0.2s;
		transition-delay: 0.2s;
		transition-timing-funciton: ease;
		font-family: 'Righteous', sans-serif;
	
	}
	
	.cards:hover{
	
		transform: scale3d(1.1, 1.1, 2);
	
	}


	
	
	@media (min-width: 0px) and (max-width: 1000px){
	
		.flexContainer{
		
			flex-wrap: wrap; 
			justify-content: space-between;
			align-items: center;
		
		}	
		
		.cards{
		
			width: 245px !important;
		
		} 
		
		.mediaContainer{
			
			flex-wrap: wrap; 
			justify-content: space-between;
			align-items: center;
		
		}
		
		.imagePoster{
		
			width: 45%;
			margin-bottom: 25px;
		
		}
		
		.imagePoster img{
			
			height: 300px !important;
		
		}

	}

	@media (min-width: 1000px) {
	
		#loginCard, #regCard {
		
			width: 30rem !important;
		
		}
	
	}
	
	.imagePoster .moreDetails{
		position: relative;
		bottom: 3px;
		font-family: 'Sacramento', cursive !important;
		color: white;
		font-size: 20px;
		display: block;
		text-align: center;
		text-decoration: none;
		letter-spacing: 4px;
	}
</style>
</head>


<body id="mainBox">


	<!-- <div id="sideBar">
		
		
		<div id="sideBarPart1">
		
			<i class="fa-solid fa-user text-light"></i>
			<i class="fa-solid fa-magnifying-glass text-light"></i>
			<i class="fa-solid fa-house text-light"></i>
			<i class="fa-solid fa-tv text-light"></i>
			<i class="fa-solid fa-radio text-light"></i>
		
		</div>
	
	</div> -->

	<div id="adv">
	
		<img style='width: 93vw; margin-left: 90px; margin-top: 20px;' src='images/add.png'/>
	
	</div>

	<div id="poster">
		
		<mytag2:printBigBanner></mytag2:printBigBanner>
	
	</div>
	
	<div id="content">
	
		
		<!-- action -->
		<div class="genres" id="action">
		
			  <div class="container-fluid text-center mb-5">
				  <div class="row">
				    <div class="col-11">
					  <h2 style="display: inline;" class='text-light heading px-2 pt-1 pb-1 rounded-3'>Popular In Action</h2>
				    </div>
				    <div class="col-1">
				      <span style="color: #605D6B;">See More</span>
				    </div>
				  </div>
			</div>
			  
			<!-- <div class="d-flex align-items-center">
			  <i class="fa-solid fa-arrow-right" style="color: #ffffff;margin-left: 30px; font-size: 16px;">See More...</i>
			</div> -->
		
			<div class="mediaContainer" style="display: flex; flex-direction: row;">
			
			 	<mytag:printMedia category="action"></mytag:printMedia>
				
			</div>
			
			
			 <div class="container-fluid text-center">
				  <div class="row">
				    <div class="col-11">
						<h2 class='text-light heading mb-4 px-2 pt-1 pb-1 rounded-3'>Top Rated In Romance</h2>
				    </div>
				    <div class="col-1">
				      <span style="color: #605D6B;">See More</span>
				    </div>
				  </div>
			</div>
			<div class="mediaContainer" style="display: flex; flex-direction: row;">
			
			 	<mytag:printMedia category="romance"></mytag:printMedia>
				
			</div>

			 <div class="container-fluid text-center">
				  <div class="row">
				    <div class="col-11">
						<h2  class='text-light heading mb-4 px-2 pt-1 pb-1 rounded-3'>Let's Enjoy Some Horror</h2>
				    </div>
				    <div class="col-1">
				      <span style="color: #605D6B;">See More</span>
				    </div>
				  </div>
			</div>
			<div class="mediaContainer" style="display: flex; flex-direction: row;">
			
			 	<mytag:printMedia category="horror"></mytag:printMedia>
				
			</div>
			
			<h2 class='text-light heading mb-4'>Top Rated In Entertainment</h2>
			<div style="width: 91vw; margin-top: 20px;" id="romanceApi">
		
					

			</div>
			
			<h2 class='text-light heading mb-4'>Excited For Upcoming Dhammal</h2>
			<div style="width: 91vw; margin-top: 20px;" id="upcomingApi">
		
					

			</div>
			
			<div id="playVideoContainer" style="position: absolute; background-color: #141415; top: 0; left: -90px; z-index: 1;" class="d-none">
		        <div id="video-container">
		            <iframe id="videoCont" style="width: 100vw; height: 90vh;" src="" frameborder="0" allowfullscreen allow="autoplay"></iframe>
		        </div>
		        <div style="height: 10vh; background-color: #141415;" class="d-flex justify-content-center align-items-center">
		        
			        <button type="button" id="backBtn" class="btn btn-outline-light">BACK</button>
		        
		        </div>
		    </div>
			
			<div>
		
				<img src='images/footer.png' style='width: 85vw; overflow-x: hidden;'/>
			
			</div>
	
		</div>
		
	
	</div>
	


</body>

<script>

	let openLogin = true;

	function setReloadTime() {
		
		localStorage.setItem('reloadTime', Date.now());
		
	}
	
	function checkInterval() {
		
		const reloadTime = localStorage.getItem('reloadTime');
		const currentTime = Date.now();
		const diff = (currentTime - reloadTime) / 1000;
		if(diff >= 3) {
			
			document.getElementById("image").style.display = "none";
			document.getElementById("video").style.display = "inline";
			clearInterval(intervalId);
			
		}
		
	}
	
	function scaleOnHovering() {
		  let posters = document.querySelectorAll(".box");

		  posters.forEach(function(poster) {
		    poster.addEventListener('mouseover', function() {
		      this.style.transform = "scale3d(1.2, 1.2, 2)";
		      
		     let paragraphs = this.querySelectorAll("p");
		      paragraphs.forEach(function(p) {
		        p.classList.toggle('d-none');
		      }); 
		    });

		    poster.addEventListener('mouseout', function() {
		      this.style.transform = "scale3d(1, 1, 1)";
		      let paragraphs = this.querySelectorAll("p");
		      paragraphs.forEach(function(p) {
		        p.classList.toggle("d-none");
		      });
		    });
		  });
		}
	
	function showSideContentOnHovering() {
		
		let blackCont = document.createElement("div");
		blackCont.style.position = "absolute";
		blackCont.style.backgroundColor = "#141415";
		blackCont.style.width = "100px";
		blackCont.style.height = "100vh";
		blackCont.style.left = "80px";
		blackCont.style.display = "flex";
		blackCont.style.alignItems = "center";
		blackCont.style.opacity = "0";
		blackCont.style.transitionProperty = "opacity";
		blackCont.style.transitionDuration = "1s";
		blackCont.style.transitionTimingFunction = "ease";
		
		
		let newEle = document.createElement('div');
		newEle.style.fontFamily= 'Righteous', 'sans-serif';
		newEle.style.opacity = "0";
		newEle.style.transitionProperty = "opacity";
		newEle.style.transitionDuration = "1s";
		newEle.style.transitionTimingFunction = "ease";
		newEle.style.display = 'flex';
		newEle.style.flexDirection = 'column';
		newEle.style.justifyContent = "space-between";
		/* newEle.style.position = 'absolute'; */
		newEle.style.color = 'white';	
		/* newEle.style.left = "80px"; */
		newEle.style.width = "100%";
		newEle.style.height = "50vh";
		newEle.style.alignItems = "center";
		blackCont.style.backdropFilter = "blur(3px)";
		
		let span1 = document.createElement('span');
		span1.textContent = "MY SPACE";

		let span2 = document.createElement('span');
		span2.textContent = "SEARCH";

		let span3 = document.createElement('span');
		span3.textContent = "HOME";

		let span4 = document.createElement('span');
		span4.textContent = "MOVIES";

		let span5 = document.createElement('span');
		span5.textContent = "SPORTS";
		
		newEle.appendChild(span1);
		newEle.appendChild(span2);
		newEle.appendChild(span3);
		newEle.appendChild(span4);
		newEle.appendChild(span5);
		
		blackCont.appendChild(newEle);
		document.querySelector("#sideBar").appendChild(blackCont);
		
		setTimeout(() => {
			  blackCont.style.opacity = "1";	
			  newEle.style.opacity = "1";
		}, 90);
		
	}
	
 	function removeSideBarContent() {
		
		document.querySelector("#sideBar").lastElementChild.remove();
		
	} 
 	
 	function createCard(posterPath,title,id) {
 		
 		let card = document.createElement("div");
 		card.id = id;
 		card.style.width = "200px";
 		card.style.backgroundColor = "#19191C";
		card.classList.add('mx-4', 'mb-5', 'cards');
		
		let image = document.createElement('img');
	    image.className = 'card-img-top'; 
		image.src =  'https://image.tmdb.org/t/p/w500' + posterPath + '?api_key=296bd1ae695a72c69dba2a4d67dd7ec2&page=';
		
		let body = document.createElement('div');
		
		let text = document.createElement('p');
		text.style.fontFamily = "Montserrat", "sans-serif";
		text.style.color = "#605D6B";
		text.classList.add("mb-1", "text-center");
		text.textContent = title;
		
		let btn = document.createElement('button');
		btn.className = "watchNowBtn";
		btn.style.display = "block";
		btn.classList.add("btn", "btn-outline-light", "mx-auto", "mt-2");
		btn.textContent = "Watch Now";
		
		let anchor = document.createElement("a");
		anchor.href = "SeeMoreDetailsOfApiMedia.jsp?id="+card.id;
		anchor.style.textDecoration = "none";
		let p = document.createElement("p");
		p.classList.add("text-center" , "pt-2");
		p.textContent = "See More";
		p.style.fontFamily = "'Sacramento', cursive";
		p.style.color = "#FED6E5";
		p.style.fontSize = "25px";
		p.style.letterSpacing = "3px";
		anchor.appendChild(p);
		
		body.appendChild(text);
		card.appendChild(image);
		body.appendChild(btn);
		body.appendChild(anchor);
		card.appendChild(body); 
		
		
		return card;
 		
 	}
 	
 	async function getRandomRomanceMovies() {
 		
 		let randome = Math.floor(Math.random() * 120)
 		const url = 'https://api.themoviedb.org/3/movie/popular?include_adult=false&api_key=296bd1ae695a72c69dba2a4d67dd7ec2&page='+randome	;
 	    const options = {
 	        method: 'GET',
 	    };

 	   await fetch(url, options) 
 	   .then((response) => {
 	        return response.json();
 	   }).then((value) => {
 		    let arr = value.results;
 		    let index = 0;

 		   do {
 			   
 			   /* flex box bana lo  */
 			   let box = document.createElement('div');
 			   box.style.display = "flex";
 			   box.style.flexDirection = "row";
 			   box.style.width = "100%";
 			   box.classList.add('flexContainer');
 			   
 			   /* 6 items nikaal lo */
 			   let count = 0;
 			   while(count < 6 && index < arr.length) {
 				   
 				   let card = createCard(arr[index].poster_path, arr[index].title, arr[index].id);
 				   box.appendChild(card);
 				   count++;
 				   index++;
 				   
 			   }
 			   
 			  document.querySelector("#romanceApi").appendChild(box);
 			  
 		   }while(index < arr.length);
 		   
 	   });
 		
 	}
 	
	function playVideoUtil(videoId) {
		
		fetch("https://api.themoviedb.org/3/movie/"+videoId+"/videos?api_key=296bd1ae695a72c69dba2a4d67dd7ec2")
		.then(function(response) {
			return response.json();
		}).then(function(data) {
			if(data.results.length > 0) {
				let key = data.results[0].key;
				document.body.style.overflow = "hidden";
				document.getElementById("playVideoContainer").classList.toggle("d-none");
				document.getElementById("playVideoContainer").scrollIntoView({behavior: "smooth"});
				document.getElementById("videoCont").src = "https://www.youtube.com/embed/"+key+"?autoplay=1";
				
				backBtn.addEventListener('click', function(){
					document.getElementById("playVideoContainer").classList.add("d-none");
					document.body.style.overflow = "auto";
					document.getElementById("videoCont").src = "";
				});
				
			}
			else {
					document.getElementById("videoCont").src = "";
			}
		});
		
	}
 	
 	
 	function playVideoOnClickingOnButton() {
 		
 		let buttons = document.querySelectorAll(".watchNowBtn");
 	 	buttons.forEach(function(btn) {
 	 		
 	 		btn.addEventListener('click', function() {
 	 			
 	 			playVideoUtil(btn.parentElement.parentElement.id);
 	 			
 	 		});
 	 		
 	 		
 	 	});
 		
 	}
 	
 	async function getRandomUpcomingMovies() {
 		/* let randome = Math.floor(Math.random() * 120) */
 		const url = 'https://api.themoviedb.org/3/movie/upcoming?api_key=296bd1ae695a72c69dba2a4d67dd7ec2';
 		const options = {
 	        method: 'GET',
 	    };
 		
 		fetch(url , options)
 		.then(function(response) {
 			return response.json();
 		}).then(function(data) {
 			
 			let items = data.results;

			for(let i = 0 ; i < items.length ; i++) {

				/* flex box bana lo  */
 			   let row = document.createElement('div');
 			   row.style.display = "flex";
 			   row.style.flexDirection = "row";
 			   row.style.width = "100%";
 			   row.classList.add('flexContainer');
				
				/* ek baar me 6 items nikkalo */
				for(let j = 0 ; j < 6 ; j++) {
					
					if(i == items.length)
						break;
					
					/* item nakkal */
					let item = items[i];
					
					/* card bana */
	 				let card = createCard(item.poster_path, item.title, item.id);
					
	 				/* card ko row me daal */
	 				row.appendChild(card);
	 				
	 				i++;
	 				
	 				/* row ko daal */
	 				document.querySelector("#upcomingApi").appendChild(row);
				}
				
			}
 			
 		});
 	}
 	
 	async function temp1(){
 		
		await getRandomRomanceMovies();
		await getRandomUpcomingMovies();
		playVideoOnClickingOnButton();
 		
 	}
 	
 	function showAlert(title, text, icon, button) {
		Swal.fire({
            title: title,
            text: text,
            icon: icon,
            confirmButtonText: button
        });
	}
 	
 	function openLoginBox() {
 		
 		let box = document.createElement("div");
 		box.classList.add("container-fluid", "d-flex", "justify-content-center", "align-items-center" , "flex-column");
 		box.id = "boxForm";
 		box.style.position = "absolute";
 		box.style.width = "100vw";
 		box.style.height = "150vh";
 		box.style.top = "0";
 		box.style.backgroundImage = "url('images/background.jpg')";
 		box.style.backgroundSize = "cover";
 		box.style.zIndex = 1;
		box.style.overflow = "hidden";
 		
 		let blured_div = document.createElement("div");
 		blured_div.id = "blured_div";
 		blured_div.style.width = "100vw";
 		blured_div.style.height = "100%";
 		blured_div.style.backdropFilter = "blur(3px)";
		 	
		let heading = document.createElement("h1");
		heading.id = "heading";
		heading.textContent = "LOGIN";
		heading.style.position = "absolute";
		heading.style.top = "10px";
		heading.style.textAlign = "center";
		
		let boxInnerHTML = `<div class="card" id="loginCard" style="width: 20rem; position: absolute; background-color: #141415;">
							  <img src="images/background.jpg" class="card-img-top" alt="Oops">
							  <div class="card-body">
							   
								  <form action = "validate-user-info" method = "POST" ">
						 			  <div class="mb-3">
								 	    <label for="exampleInputEmail1" class="form-label text-light">Email address</label>
								 	    <input type="email" name = "loginEmailInput" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
								 	    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
								 	  </div>
								 	  <div class="mb-3">
								 	    <label for="exampleInputPassword1" class="form-label text-light">Password</label>
								 	    <input type="password" name="pwdInput" class="form-control" id="exampleInputPassword1">
								 	  </div>
								 	  <div class="mb-3 form-check">
								 	    <input type="checkbox" class="form-check-input" id="exampleCheck1">
								 	    <label class="form-check-label text-light" for="exampleCheck1">Check me out</label>
								 	  </div>
								 	  <button type="submit" id="loginBtn" class="btn btn-primary">LOGIN</button>
								 	 <p class="mt-2 text-center"><a href="#" id="registrationPara" style="text-decoration: none; color: #605D6B;">Don't have account, click here!</a></p>
							 	</form>
							  
							  </div>
							</div>`;
		
		box.appendChild(blured_div);
		blured_div.insertAdjacentElement('afterend', heading);
		blured_div.insertAdjacentHTML('afterend', boxInnerHTML);
 		document.body.appendChild(box);
 		box.scrollIntoView({behavior : "smooth"});
 		document.getElementById("registrationPara").addEventListener('click', openRegistrationForm);
 		
		document.querySelector("#sideBar").style.display = "none";
		document.querySelector("#adv").style.display = "none";
		document.querySelector("#poster").style.display = "none";
		document.querySelector("#content").style.display = "none";
 	}

 	function loginToUser(event) {
 		
 		event.preventDefault();
 		
 		let formEle = event.target;
 		
 		console.log(formEle);
 		
 		let emailId = formEle.elements.loginEmailInput.value;
 		let pwd = formEle.elements.pwdInput.value;
 		
 		let data = {
 				email : emailId,
 				password : pwd
 		};
 		
 		$.ajax({
            type: 'POST',
            url: 'validate-user-info',
            data: data,
            success: function(response) {
            	console.log(response);
            	if(response.trim() == "true"){
	            		showAlert('Dear User!', 'Login Successfull', 'success', 'Move To Profile');
	            		makeInputFiledsEmpty();
	            		openLogin = false;
            		setTimeout(()=>{
	            		window.open("UserProfleWebPage.jsp");
            		}, 3000);
            	}
            	else
            		showAlert('Dear User!', 'Some Error Occured', 'error', 'Try Again');
            },
	 		error: function (xhr, status, error) {
	            console.error("Error:", error);
	        }
        });
 	} 
 	
 	
 	function openRegistrationForm(){

 		let loginCard = document.getElementById("loginCard");
 		
 		let regCardHtml = `<div class="card" id="regCard" style="width: 20rem; position: absolute; background-color: #141415;">
							  <img src="images/background.jpg" class="card-img-top" alt="Oops">
							  <div class="card-body">
							   
								  <form id="registrationForm" onsubmit = "sendUserInfoForRegistration(event)">
								  
								  
									  <div class="row">
									  
									  
									    <div class="col">
									    
										  <div class="mb-3">
									 	    <label for="username" class="form-label text-light">Username</label>
									 	    <input type="text" class="form-control" id="username" name="username" aria-describedby="emailHelp">
									 	  </div>
							 			  <div class="mb-3">
									 	    <label for="exampleInputEmail1" class="form-label text-light">Email address</label>
									 	   <input type="email" class="form-control" id="exampleInputEmail1" name="emailInput" aria-describedby="emailHelp">
									 	    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
									 	  </div>
									 	 <div class="mb-3">
									 	    <label for="contactNo" class="form-label text-light">ContactNo</label>
									 	   <input type="text" class="form-control" id="contactNo" name="contactNo" aria-describedby="emailHelp">
									 	  </div>
									 	  
									    </div>
									    
									    
									    <div class="col">
									      
									 	 <div class="mb-3">
									 	    <label for="age" class="form-label text-light">Age</label>
									 	   <input type="text" class="form-control" id="age" name="age" aria-describedby="emailHelp">
									 	  </div>
									 	  <div class="mb-3">
									 	    <label for="exampleInputPassword1" class="form-label text-light">Password</label>
									 	    <input type="password" class="form-control" name="passwordInput" id="exampleInputPassword1">
									 	  </div>
									 	  <div class="mb-3 form-check">
									 	    <input type="checkbox" class="form-check-input" id="exampleCheck1">
									 	    <label class="form-check-label text-light" for="exampleCheck1">Check me out</label>
									 	  </div>
									 	  <button type="submit" class="btn btn-primary">Register</button>
									    
									    </div>
									   	
									    <div class="row">
									    
									 	 <p class="mt-2 col text-center"><a href="#" id="registrationPara" style="text-decoration: none; color: #605D6B;">Already have account , click here!</a></p>
									    
									    </div>
									    
									  </div>
										  
									  </div>
									  
							 	</form>
							  
							  </div>
							</div>`;
 	
		document.getElementById("heading").textContent = "Registration";
		loginCard.classList.add("d-none");
		document.getElementById("blured_div").insertAdjacentHTML('afterend', regCardHtml);

		document.addEventListener("scroll", function(event) {
			if(window.scrollY > 170){
				
			}
			else
				console.log("NO");
		});
	}
 	
 	function makeInputFiledsEmpty() {
 		let inputFields = document.querySelectorAll('input');
		inputFields.forEach((item)=>{
			item.value = '';
		});
 	}
 	
 	function sendUserInfoForRegistration(event) {
 		
 		event.preventDefault();
 		
 		let form = event.target;
 		
 		let username = form.elements.username.value;
 		let email = form.elements.emailInput.value;
 		let contactNo = form.elements.contactNo.value; // Corrected line
 		let age = form.elements.age.value;
 		let password = form.elements.passwordInput.value;

 		let data = {
 		    username: username,
 		    email: email,
 		    contactNo: contactNo, 
 		    age: age,
 		    password: password
 		};
 		
 		$.ajax({
            type: 'POST',
            url: 'save-user-info',
            data: data,
            success: function(response) {
            	console.log(response);
            	if(response.trim() == "true"){
            		showAlert('Dear User!', 'Registration Successfull', 'success', 'Now Login');
					makeInputFiledsEmpty();
					document.querySelector("#loginCard").classList.remove("d-none");
					document.querySelector("#regCard").classList.add("d-none");
            	}
            	else
            		showAlert('Dear User!', 'Some Error Occured', 'error', 'Try Again');
            },
	 		error: function (xhr, status, error) {
	            console.error("Error:", error);
	        }
        });
 		
 	}
 		
/*  	document.getElementById("sideBarPart1").addEventListener('mouseover', showSideContentOnHovering);
	document.getElementById("sideBarPart1").addEventListener('mouseout', removeSideBarContent);  */

	scaleOnHovering(); 

	setReloadTime();
	
	temp1();
	
	let sessionCreated = '<%=session.getAttribute("email")%>';
	console.log(sessionCreated);
	if(sessionCreated == 'null') {
 		setTimeout(openLoginBox , 6000);
	}
	
	let intervalId = setInterval(checkInterval , 1000);

</script>

</html>