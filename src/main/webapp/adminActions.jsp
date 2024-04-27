<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Actions</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.5/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.5/dist/sweetalert2.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,300;0,900;1,900&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
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
	  color: white;
	}
	
</style>

</head>
<body>

	<h1 class="fontOne mt-4 " style="text-align: center;">Admin Actions</h1>

	<div class="d-flex justify-content-center flex-column align-items-center" style="height: 100vh ; width: 100vw">
	
		<div class="d-flex" style="height: 280px; width: 70vw;">
		
			<div class="mx-5 d-flex justify-content-center align-items-center fontOne shadow rounded" style="height: 100%; width: 50%; background-image: url('images/uploadMedia.jpg') ; background-size: cover; background-repeat: no-repeat;"><a type="button" href="adminUploadContent.jsp" class="btn btn-dark btn-lg shadow">Upload Media</a></div>
			<div class="mx-5 d-flex justify-content-center align-items-center fontOne shadow rounded" style="height: 100%; width: 50%; background-image: url('images/deleteMedia.jpg'); background-size: cover; background-repeat: no-repeat;"><a type="button" href="send-delete-jsp-media" class="btn btn-dark btn-lg shadow">Delete Media</a></div>
	
		</div>
		
		<div class="d-flex mt-5" style="height: 280px; width: 70vw;">
		
			<div class="mx-5 d-flex justify-content-center align-items-center fontOne shadow rounded" style="height: 100%; width: 50%; background-image: url('images/retrieveMedia.jpg'); background-size: cover ; background-repeat: no-repeat;"><a type="button" href="get-list-media" class="btn btn-dark btn-lg shadow">Retrieve Media</a></div>
			<div class="mx-5 d-flex justify-content-center align-items-center fontOne shadow rounded" style="height: 100%; width: 50%; background-image: url('images/updateMedia.jpg'); background-size: cover ; background-repeat: no-repeat;"><a type="button" href="SendMediaUpdateJspControllerServlet" class="btn btn-dark btn-lg shadow">Update Media</a></div>
	
		</div>
	
	</div>
	

</body>
</html>




















