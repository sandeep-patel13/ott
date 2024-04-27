<%@ page import="java.util.List, dto.Media" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="/WEB-INF/tag.tld" prefix="mytag"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show all Media</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.5/dist/sweetalert2.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,300;0,900;1,100;1,200;1,400;1,900&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<style>

	#mainBox{
		height: 350vh;
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

</style>
</head>


<body>


<div class="container-fluid" id="mainBox">
		
	<div class="d-flex flex-column align-items-center">
		 
		<h1 class="text-light pt-3 mb-5" style="font-family: 'Montserrat', sans-serif; font-weight: 900">See All Media List</h1>

		<mytag:printmedialist list="${requestScope.mediaList}"/>

		<% 
		
			int offset = (Integer)request.getAttribute("offset");
			int limit = (Integer)request.getAttribute("limit");
			int remaining = (Integer)request.getAttribute("remaining");

			if(remaining != 0 && limit <= remaining) {
				
				/* for next 5 elements */
				offset+=5;
				remaining-=5;
				
				String url = "get-list-media?offset="+offset+"&remaining="+remaining+"&limit="+limit+"&visitToJsp="+"yes";
				out.println("<a href='" + url + "' class='btn btn-outline-light text-decoration-none'>NEXT PAGE</a>");
				
			}
			

			else if(remaining != 0 && limit > remaining) {
				
				offset+=5;
				limit = remaining;
				remaining = 0;
				
				
				request.setAttribute("limit", limit);
				request.setAttribute("remaining", remaining);
				request.setAttribute("offset", offset);
				String url = "get-list-media?offset="+offset+"&remaining="+remaining+"&limit="+limit+"&visitToJsp="+"yes";
				out.println("<a href='" + url + "' class='btn btn-outline-light text-decoration-none'>NEXT PAGE</a>");
			}

			
			else {
				
				out.println("<h1 class='text-light pt-3 mb-5' style=\"font-family: 'Montserrat', sans-serif; font-weight: 900\">No Item Is Left Now</h1>");
				
			}
		%>
		
	</div>
</div>

</body>
</html>












