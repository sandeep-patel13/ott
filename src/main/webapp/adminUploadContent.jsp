<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/05d425af79.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.5/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.5/dist/sweetalert2.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,300;0,900;1,100;1,200;1,400;1,900&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<style>

	#mainBox{
		height: 200vh;
		width: 100vw;
		background-image: url(images/bluredadmin.jpg);
		background-repeat: no-repeat;
		background-size: cover;
	}

	.shadow{
		box-shadow: rgba(17, 12, 46, 0.15) 0px 48px 100px 0px;
	}
	
	.fontOne {
	  font-family: 'Montserrat', sans-serif;
	  font-weight: 900;
	}
	
	.fontTwo{
	
	  font-family: 'Montserrat', sans-serif;
	  font-weight: 400;
		
	}
	
	.genres{
	
		border-radius: 4px;
		height: 17em;
		width: 100%;
		padding: 8px;
		overflow-y: hidden;
	
	}
	
	.genreValue{
	
		margin-bottom: 5px;
		
	}

	   #mediaLogo1 {
	   		width: 100px;
	   		position: fixed;
	   		top: 20vh;
	   		left: 15vw;
            transition-property: transform;
            transition-duration: 2s;
            transition-timing-function: ease-out;
        }

        #mediaLogo1:hover {
            
/*             transform: scale(1.3, 1.3); */
            transform: rotateX(360deg);
           
        }
	
</style>
	
</head>

<!-- user , admin -->
<!-- admin , media  -->

<body>

	<img  id="mediaLogo1" src="images/media1.jpg" />

	<div class="container-fluid" id="mainBox">
		
		<div class="d-flex flex-column align-items-center">
		 
			<h1 class="text-light pt-3 mb-5" style="font-family: 'Montserrat', sans-serif; font-weight: 900">Upload Media Information</h1>
			
			<form class="shadow p-3"  id="myform" onsubmit="submitDetails(event)">
			<div class="mb-3">
			    <label for="name" class="form-label text-light">Type name</label>
			    <input type="text" class="form-control text-dark border-0" id="name" name="name" required>
			 </div>
			  	  
			  <div class="mb-3">
			    
			    <div class="d-flex justify-content-between align-items-center" style="width: 100%; background-color: white; margin-bottom: 8px; padding: 10px; border-radius: 4px;">
			    	<span class="fontOne">Genres</span>
			    	<i id="caret" class="fa-solid fa-caret-down" style="color: #000000;"></i>
			    </div>
			
			  	<div id="genre-cont" style="font-size: 16px; display: none; opacity: 0;">
			  		
			  			<select id="select-cont" class="genres" name="category" id="category" style="width: 100%;" multiple required>
			  			
			  				  <option value="" selected style="display: none;">Option Name</option>
							  <option class="genreValue fontTwo" value="action">Action</option>
							  <option class="genreValue fontTwo" value="adventure">Adventure</option>
							  <option class="genreValue fontTwo" value="comedy">Comedy</option>
							  <option class="genreValue fontTwo" value="drama">Drama</option>
							  <option class="genreValue fontTwo" value="fantasy">Fantasy</option>
							  <option class="genreValue fontTwo" value="horror">Horror</option>
							  <option class="genreValue fontTwo" value="romance">Romance</option>
							  <option class="genreValue fontTwo" value="sci-fi">Science Fiction</option>
							  <option class="genreValue fontTwo" value="thriller">Thriller</option>
							  <option class="genreValue fontTwo" value="western">Western</option>
										  			
			  			</select>
			  		
			  	</div>
			    <!-- dropdown -->
			    
			   </div>
			  	
			   <div class="mb-3">
			    <label for="ratings" class="form-label text-light">Type ratings out of 10</label>
			    <input type="text" class="form-control text-dark border-0" id="ratings" placeholder="ex: 5, 5.2" name="ratings" required>
			   </div>
			   
			    <div class="mb-3">
			    <label for="length" class="form-label text-light">Type media length</label>
			    <input type="text" class="form-control text-dark border-0" id="length" placeholder="ex: 02:30:15 (hh:mm:ss)" name="length" required>
			   </div>
			 
			 
			 	<div class="mb-3">
			    <label for="description" class="form-label text-light">Type description</label>
			    <!-- <input type="text" class="form-control text-light border-0" id="description" name="description" required> -->
			    <textarea class="form-control" id="description" name="description" required></textarea>
			   </div>
			   
			   <div class="mb-3">
			    <label for="directorName" class="form-label text-light">Type directors name</label>
			    <input type="text" class="form-control text-dark border-0" id="directorName" name="directorName" placeholder="ex: Rajkumar Hirani,Neeraj Pandey" required>
			   </div>
			   
			    <div class="mb-3">
				    <label for="actors" class="form-label text-light">Type actors name</label>
				    <input type="text" class="form-control text-dark border-0" id="actors" name="actors" placeholder="ex: Vin Diesel,Tom Cruise" required>
			   </div>
			   
			   
			   <div class="mb-3">
				    <label for="releaseDate" class="form-label text-light">Upload release date</label>
				    <input type="text"  class="form-control text-dark border-0" id="releaseDate" name="releaseDate" placeholder="ex: 2023-03-10 (yyyy-mm-dd)" required>
			   </div>
			 
			   <div class="mb-3">
				    <label for="video" class="form-label text-light">Upload video</label>
				    <input type="file" class="form-control text-dark border-0" id="video" name="video" accept=".mp4, .avi, .mov, .video/*" required>
			   </div>

			   <div class="mb-3">
				    <label for="thumbnail" class="form-label text-light">Upload thumbnail</label>
				    <input type="file" class="form-control text-dark border-0" id="thumbnail" name="thumbnail" accept=".jpg, .jpeg, .png" required>
			   </div>
			   
			  <button class="btn btn-primary" style="width: 100%;">Submit</button>
			</form>
						
		</div>
	
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
	
	function submitDetails(event) {
		
		event.preventDefault();
		
		let formData = new FormData($("#myform")[0]);
		for (let [key, value] of formData.entries()) {
			  console.log(key, value);
			}

		
	 	$.ajax({
            url: "upload-media-info",
            type: "POST",
            data: formData,
            contentType: false,
            processData: false,
            success: function (data) {
				
				let cause = data.trim();
                 switch(cause){
                 
                 	case "empty-name":
                 		sweetAlert('Dear User!', 'empty media name!', 'error', 'Try Again');
                 		break;
                 		
                 	case "empty-category":
                 		showAlert('Dear User!', 'empty category!', 'error', 'Try Again');
                 		break;
                 		
                 	case "wrong-length" :
                 		document.getElementById("length").value = "";
                 		showAlert('Dear User!', 'wrong length!', 'error', 'Try Again');
                 		break;
                 	
                 	case "empty-description":
                 		showAlert('Dear User!', 'empty description!', 'error', 'Try Again');
                 		break;
                 		
                 	case "empty-director-name":
	             		showAlert('Dear User!', 'empty director name!', 'error', 'Try Again');
	             		break;
                 		
                 	case "empty-actor-name":
	             		showAlert('Dear User!', 'empty actor name!', 'error', 'Try Again');
	             		break;
	             		
                 	case "wrong-date":
                 		document.getElementById("releaseDate").value = "";
                 		showAlert('Dear User!', 'wrong release date!', 'error', 'Try Again');
                 		break;
                 	
                 	case "NumberFormatException":
                 		document.getElementById("ratings").value = "";
                 		showAlert('Dear User!', 'wrong ratings!', 'error', 'Try Again');
                 		break;
                 	
                 	case "empty-thumbnail":
                 		showAlert('Dear User!', 'no thumbnail found!', 'error', 'Try Again');
                 		break;
                 		
                 	case "empty-video":
                 		showAlert('Dear User!', 'no video found!', 'error', 'Try Again');
                 		break;
                 		
                 	case "empty-category":
                 		showAlert('Dear User!', 'no category found!', 'error', 'Try Again');
                 		break;
                 		
                 	default:
                 		showAlert('Dear User!', 'Media uploaded successfully!', 'success', 'ok');
                 		setTimeout(function() {
                 			location.reload();
                 		}, 2000);
                 		break;
                 }
            	
            },
            error: function (xhr, status, error) {
                console.error("Error:", error);
            }
        }); 
	 
	}
	
	
	document.querySelector("#caret").addEventListener("click", function() {
		
		
		let ele = document.querySelector("#genre-cont");
		
		if(ele.style.opacity == 0){
			ele.style.transition = "opacity 2s ease";
			ele.style.display = "inline";
			ele.style.opacity = 1;	
		}
		else{
			ele.style.display = "none";
			ele.style.opacity = 0;			
		}
		
		
	});
	
	
	
</script>

</html>