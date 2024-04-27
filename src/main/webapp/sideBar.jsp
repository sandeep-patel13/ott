<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Side Bar</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@900&family=Righteous&family=Sacramento&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/05d425af79.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.5/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.5/dist/sweetalert2.min.js"></script>
<style>

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
	.fa-solid {
	  cursor: pointer;
	}
</style>
</head>
<body>

	<div id="sideBar">
		
		
		<div id="sideBarPart1">
		
			<a href = 'UserProfleWebPage.jsp'><i class="fa-solid fa-user text-light"></i></a>
			<i class="fa-solid fa-magnifying-glass text-light"></i>
			<a href = "Send-Index-Page"><i class="fa-solid fa-house text-light"></i></a>
			<i class="fa-solid fa-tv text-light"></i>
			<i class="fa-solid fa-radio text-light"></i>
		
		</div>
	
	</div>

</body>

<script>


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

document.getElementById("sideBarPart1").addEventListener('mouseover', showSideContentOnHovering);
document.getElementById("sideBarPart1").addEventListener('mouseout', removeSideBarContent); 

</script>

</html>