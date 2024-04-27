<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Invalid UserName Or Password</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@900&family=Righteous&family=Sacramento&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/05d425af79.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.5/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.5/dist/sweetalert2.min.js"></script>

<style>

	#main{
		
		width: 100vw;
		height: 120vh;
		background-image: url('images/background.jpg');
		background-size: cover;
		background-repeat: no-repeat;
		position: relative;
		top: 0px;
	
	}
	
	#bluredDiv{
		
		width: 100%;
		height: 100%;
		/* background-color: red;  */
		content: "";
		backdrop-filter: blur(3px);
		
	}

	#loginCard{
	
		position: absolute;
		
	}
	
	@media (min-width: 1000px) {
	
		#loginCard{
		
			width: 30rem !important;
		
		}
	
	}
</style>

	

</head>


<body>
	
	
	<div id="main" class="d-flex justify-content-center align-items-center">

		<div id="bluredDiv" class="container-fluid">
		
		</div>
			
		<div class="card" id="loginCard" style="width: 20rem; background-color: #141415;">
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
		</div>

	</div>
	<div class="d-flex justify-content-center">
		<h1 style="position: absolute; top: 0;" class="text-center text-dark mt-3">LOGIN</h1>
	</div>
	
	<script>
	
		function showAlert(title, text, icon, button) {
			Swal.fire({
	            title: title,
	            text: text,
	            icon: icon,
	            confirmButtonText: button
	        });
		}	
		
		showAlert("Dear User!", "Invalid Username Or Password", "error", "Try Again");
	
	</script>
</body>
</html>












