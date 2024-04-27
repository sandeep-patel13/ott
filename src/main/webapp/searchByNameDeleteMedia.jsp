<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Media Jsp</title>
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

<h1 class="fontOne shadow text-light text-center">Delete Media</h1>

<div class="container-fluid" id="mainBox">
		
		<div class="d-flex flex-column align-items-center">
		 
			
			<form class="p-3 mt-5"  id="myform">
				<div class="mb-3">
				    <label for="name" class="form-label text-light">Type name</label>
				    <input onkeyup="sendToServlet()" type="text" class="form-control bg-dark text-light border-0" id="media_name" name="name" required>
				</div>
			   
			</form>
						
		</div>
		
		<div id="result" class="d-flex justify-content-center align-items-center flex-column mb-5">
			
			
		
		</div>
	
	</div>

</body>


<script>

	function sendToServlet() {
		
		let name = document.getElementById("media_name").value;
		console.log(name);
		if(name != null){
			
			let url = "send-to-media-dao-to-delete?name="+name;
			document.getElementById("myform").action = url;
            $.ajax({
                type: "GET",
                url: url,
                data: {"name" : name},
                success: function (response) {
                    
                	if(response != null) {
                		
                		document.getElementById("result").innerHTML = "";
                		document.getElementById("result").innerHTML = response;
                		
                	}
                	
                },
                error: function (xhr, status, error) {
                    console.log("Error:", error);
                }
            });
			
		}
		
	}

	
</script>











</html>