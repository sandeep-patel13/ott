<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Media</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.5/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.5/dist/sweetalert2.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,300;0,900;1,100;1,200;1,400;1,900&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<style>

	body{
		
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
	
</style>
</head>
<body>

	<h1 class='fontOne text-light text-center mt-3'>Old Details Here, Now You Can Update</h1>
		<div class="d-flex flex-column justify-content-center align-items-center">
		 
			<form enctype="multipart/form-data" method = "POST" action="send-updated-media?id=${requestScope.id}" class="shadow p-3" id="myform" style="width: 40%">
			<div class="mb-3">
			    <label for="name" class="form-label text-light">Update name</label>
			    <input type="text" class="form-control border-0" id="name" name="name" value="${requestScope.media.name}" required>
			 </div>
			  	  
			  <div class="mb-3">
			    <label for="category" class="form-label text-light">Type category</label>
			    <input type="text" class="form-control border-0" id="category" name="category" value="${requestScope.media.category}"  placeholder="ex: action,thriller etc" required>
			   </div>
			  	
			   <div class="mb-3">
			    <label for="ratings" class="form-label text-light">Type ratings out of 10</label>
			    <input type="text" class="form-control border-0" id="ratings"  name="ratings"  value="${requestScope.mediaInfo.ratings}" required>
			   </div>
			   
			    <div class="mb-3">
			    <label for="length" class="form-label text-light">Type media length</label>
			    <input type="text" class="form-control border-0" id="length" placeholder="ex: 02:30:15 (hh:mm:ss)" name="length" value="${requestScope.mediaInfo.length}"  required>
			   </div>
			 
			 
			 	<div class="mb-3">
			    <label for="description" class="form-label text-light">Type description</label>
			    <input type="text" class="form-control border-0" id="description" name="description" value="${requestScope.mediaInfo.discription}" required>
			   </div>
			   
			   <div class="mb-3">
			    <label for="directorName" class="form-label text-light">Type directors name</label>
			    <input type="text" class="form-control border-0" id="directorName" name="directorName" placeholder="ex: Rajkumar Hirani,Neeraj Pandey" value="${requestScope.mediaInfo.directors}" required>
			   </div>
			   
			    <div class="mb-3">
				    <label for="actors" class="form-label text-light">Type actors name</label>
				    <input type="text" class="form-control border-0" id="actors" name="actors" placeholder="ex: Vin Diesel,Tom Cruise" value="${requestScope.mediaInfo.actors}" required>
			   </div>
			   
			   
			   <div class="mb-3">
				    <label for="releaseDate" class="form-label text-light">Upload release date</label><br>
				    <input type="text"  class="form-control border-0" id="releaseDate" name="releaseDate" placeholder="ex: 2023-03-10 (yyyy-mm-dd)" value="${requestScope.mediaInfo.release_date}" required>
			   </div>
			 
			   <div class="mb-3">
				    <label for="video" class="form-label text-light">Upload video</label>
				    <video width="100%" height="240" class="mb-4 mt-3 rounded shadow" controls>
					  <source src="get-Video-Based-On-Id?id=${requestScope.id}" type="video/mp4">
					</video>
				    <input type="file" class="form-control border-0" id="video" name="video" accept=".mp4, .avi, .mov, .video/*" required>
			   </div>

			   <div class="mb-3">
				    <label for="thumbnail" class="form-label text-light">Upload thumbnail</label>
				    <img style="display : block; width: 100%; margin: auto;" class="shadow mb-3 mt-3 rounded" src="media-List-Image?id=${requestScope.id}"/>
				    <input type="file" class="form-control border-0" id="thumbnail" name="thumbnail" accept=".jpg, .jpeg, .png" required>
			   </div>
			   
			  <button class="btn btn-primary">Submit</button>
			</form>
						
		</div>
</body>

<script>

	document.getElementById("myform").addEventListener("submit", (event) => {
		event.preventDefault();
		
		 $.ajax({
	            type: 'POST', 
	            url: 'send-updated-media?id=${requestScope.id}',
	            data: new FormData(document.getElementById("myform")),
	            processData: false,
	            contentType: false,
	            success: function(response) {
					
	            	let resp = response.trim();
	            	
	            	switch(resp) {
	            	
	            		case "NumberFormatException":
	            			swal('Dear User!', 'Please Enter Valid Length!', 'error', 'Try Again');
	                 		break;
	                 		
	            		case "ParseException":
	            			swal('Dear User!', 'Please Enter Valid Date or Time!', 'error', 'Try Again');
	                 		break;
	                 		
	            		case "ServletException":
	            		case "FileNotFoundException": 
	            		case "IOException":
	            			swal('Dear User!', 'Some Exception at Server End!', 'error', 'Try Again');
	                 		break;
	                 	
	                 	default:
	                 		swal('Dear User!', 'Media updated successfully!', 'success', 'ok');
	                 		setTimeout(function() {
	                 			location.reload();
	                 		}, 2000);
	                 		break;
	            	
	            	}
	            	
	            },
	            error: function() {
	                // Handle error
	                $('#responseContainer').html('An error occurred while updating media.');
	            }
	        });
		
	});

</script>

</html>