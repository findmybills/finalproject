<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Results</title>
<style>
body {

   
}
td, tr{
font-size: 18px;
}
#results{
  margin-left: 10%;
  margin-right: 10%;
 
}
.navbar-bccolor{
	background-color: #2F4F4F;

}
.form-control{
margin-top: 7px;}
td{
  display: flex;
  float: left;
}
#search{
float:left;
}
#select{
font-size:16px;
}
#header{
padding-left: 10%;


}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
<nav class="navbar navbar-expand-md navbar-dark navbar-bccolor">
  <a class="navbar-brand" href="Home.jsp">Home</a>
 <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarnav" aria-controls="navbarnav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
     <div class="collapse navbar-collapse" id="navbarnav">
	    	<ul class="navbar-nav mr-auto">
	      		<li class="nav-item ">
		      		<a class = "nav-link" href="Aboutus.jsp">About Us</a>
	      		</li>
	      		<li class="nav-item">
		      		<a class = "nav-link" href="Profile.jsp">Profile</a>
	      		</li>
	      		<li class="nav-item">
		      		<a class = "nav-link" href="register.jsp">Sign Up</a>
	      		</li>
	    	</ul>
	 </div>
</nav>
<br>
<h1 id = header>Search Results for: <%=request.getAttribute("keyword") %></h1>
<br>
<br>
<h2 id = "result"></div>
<form action="Servlet" style="padding-left: 30%;">
 
  <input type="text" style = "width:400px;" class="form-control" id="search" name="search" placeholder = "Search Bills">
  <select id="select" style= "    width: 150px;height: 40px;" onmouseout="return placeholder()" >
    <option selected>--SELECT--</option>
    <option value="bills">Bill</option>
    <option value="users">User</option>
    
  </select>
<input type = "submit" value = "Submit" class="btn btn-primary">
</form>
<div id="results"></div>
</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	let data = <%= session.getAttribute("data") %>;
	let keyword = "<%=request.getAttribute("keyword") %>";
	/* for(let i=0; i<keyword.length; ++i) {
		if(keyword.charAt(i) == '+')
			keyword = keyword.replace("+", " ");
	} */
	//var keyword2 = keyword.replace("+", key)
	//document.getElementById.innerHTML = ("Search Results for: ");
	//let data = JSON.parse(temp);
	//window.alert(JSON.parse(data));
	$("#results").append("<hr style='border-top: dotted 1px;' />");
	
	if (data==null || data.results==null || data.results.length<1){
	    
	}
	var party = [0];
	var imgArray = new Array();
	var newimg = document.createElement("img"); 
	var summary = [0];
	for(i=0; i<data.results[0].bills.length; i++) {
		imgArray[i] = new Image();
		if(data.results[0].bills[i].sponsor_party == "D"){
			party[i] = "Democratic";
		}
		else{
			party[i] = "Republican";
		}
		
		if(data.results[0].bills[i].summary_short == "" ||data.results[0].bills[i].summary_short==null){
			summary[i] = "No Summary";
		}
		else{
			summary[i] = data.results[0].bills[i].summary_short;
		}
		$("#results").append('<table><tr><td rowspan="4">&nbsp</td><td>&nbsp</td></tr>'
		+'<tr><td>&nbsp<strong>Title:</strong> '+data.results[0].bills[i].title+'</td></tr>'
		+'<tr><td>&nbsp<strong>Name of the Sponser: </strong> '+data.results[0].bills[i].sponsor_name+'</td></tr>'
		+'<tr><td>&nbsp<strong>Party</strong>: '+party[i]+'</td></tr>'
	
		+'<tr><td>&nbsp<strong>Sponsor State:</strong>'+data.results[0].bills[i].sponsor_state+'</td></tr>'
		+'<tr><td>&nbsp<strong>Summary: </strong>'+summary[i]+'</td></tr></table>'
		+"<hr style='border-top: dotted 1px;' />");
	}
	<%
		session.removeAttribute("data");
	%>
	
	function placeholder() {
		   if(document.getElementById("select").value == "bills"){
			   document.getElementById("search").setAttribute("placeholder", "Search Bills with keywords");
		   }
		   if(document.getElementById("select").value == "users"){
			   document.getElementById("search").setAttribute("placeholder", "Search Users with First Name or Last Name");
		   
		   }
		}

</script>
</html>