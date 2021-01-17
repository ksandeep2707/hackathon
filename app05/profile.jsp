<%@page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
	<title>profile</title>

<style>
      table {
  table-layout: fixed;
  width: 60%;

}
body{
	background: radial-gradient(ellipse at bottom, #1b2735 0%, #090a0f 100%);

}
.dropdown:hover>.dropdown-menu {
  display: block;
}

.dropdown>.dropdown-toggle:active {
  /*Without this, clicking will make it sticky*/
    pointer-events: none;
}


.b{
font-weight:700;
font-color:rgba(136,136,136,1);
}
#a{
color:white;
font-size: 20px;
}

#b{
font-weight:600;
color:white;
}

.but{
border:2px solid white;
border-radius:30px;
background-color:rgba(136,136,136,0.9);
  transition-duration: 0.4s;
 font-size: 20px;
color:white;
font-weight:500;
padding: 12px 28px;
  text-align: center;
}
.but:hover{
	color:black;
background-color:white;
border:2px solid black;

}
u{color:white;}


.body{
  margin-left:10%;
  margin-right: 7%;

}
td{
  font-size:120%;
}
h3{
 font-size:120%;
 color:white;
}
h4{
 color:white;
}
h1{
  text-align: center;
color:white;
}
.dec
{

    font-size:120%;
}

.sec{
  border-radius: 2rem;
  border:3px solid white;
  margin:2rem;
  padding:1px 100px 50px 20px;
}
.img{
  margin-left:60rem;
  position:absolute;
  border:2px solid white;
  top:10rem;
}

.head{
  position:relative;
  z-index: 1;
  bottom:2.5rem;
  font-size:100%;

}
input {
  border: 2px solid white;
  border-radius: 4px;
}

    </style>






<style >
    footer
{
    position: fixed;
   left: 0;
   bottom: 0;
   width: 100%;
   background-color:#e6e6e6;
   color:black;
   text-align: center;
   padding: 0.8rem;
    margin-top: 3%;
}

  </style>
	<title></title>
	<link rel="stylesheet" type="text/css" href="bootstrap.css">
  <script src="https://kit.fontawesome.com/a076d05399.js"></script>

  <link rel="stylesheet" type="text/css" href="css.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link href='https://fonts.googleapis.com/css?family=Lato:300,400,700' rel='stylesheet' type='text/css'>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js" type="text/javascript"></script>


</head>
<body>
	<%
          HttpSession se = request.getSession(false);
          if(se==null)
          	response.sendRedirect("loginpage.html");
          ArrayList<String> names= (ArrayList)se.getAttribute("names");
          if(names==null)
          	 response.sendRedirect("loginpage.html");
          if(names!=null){

          String name=names.get(0);
          String n=new String(name);
          String password=names.get(1);


	%>
</h1>

	 <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
      	<div class="container">
  <a class="navbar-brand b" href="index.html"><i class="fas fa-university"></i> GETQ</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.html"><i class="fa fa-home" aria-hidden="true"></i> Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item dropdown ">
        <a class="nav-link" href="view.jsp?category=question&year=all">
          <i class="fab fa-quora"></i>
          Question Papers
        </a>
        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
          <a class="dropdown-item" href="view.jsp?category=question&year=1st">1st Year</a>
          <a class="dropdown-item" href="view.jsp?category=question&year=2nd">2nd Year</a>
          <a class="dropdown-item" href="view.jsp?category=question&year=3rd">3rd Year</a>
          <a class="dropdown-item" href="view.jsp?category=question&year=4th">4th Year</a>
          
      </li>
      <li class="nav-item dropdown ">
       <a class="nav-link" href="view.jsp?category=syllabus&year=all">
          <i class="fas fa-scroll"></i>Syllabus
        </a>
        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
          <a class="dropdown-item" href="view.jsp?category=syllabus&year=1st">1st Year</a>
          <a class="dropdown-item" href="view.jsp?category=syllabus&year=2nd">2nd Year</a>
          <a class="dropdown-item" href="view.jsp?category=syllabus&year=3rd">3rd Year</a>
          <a class="dropdown-item" href="view.jsp?category=syllabus&year=4th">4th Year</a>
          
      </li>
       

<li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-book"></i>Prescribed books
        </a>
        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
          <a class="dropdown-item" href="#">1st Year</a>
          <a class="dropdown-item" href="#">2nd Year</a>
          <a class="dropdown-item" href="#">3rd Year</a>
          <a class="dropdown-item" href="#">4th Year</a>
          
      </li>

      </li>
      </ul>
      <ul class="navbar-nav ml-auto">
       
      </li>
       <li class="nav-item">
        <a class="nav-link" href="logout.jsp"><i class="fas fa-sign-out-alt"></i>Logout&nbsp;&nbsp;&nbsp;&nbsp;</a>
      </li>
      <li class="nav-item">
        <CENTER><B><i class="fa fa-user-circle-o" aria-hidden="true"></i>
        	WELCOME<Br>&nbsp;&nbsp;<%=n.toUpperCase()%></B></CENTER>
      </li>
  </ul>








       
  
  </div>
</div>
</nav>
<div style="padding-top: 120px;padding-left:50px;padding-right:50px;">
<div class="acc-details sec">
      <div class="head ab">
        <h3>UPDATION</h3>
      </div>
      <table>
        <tr>
          <center>
          	<h4><u>UPLOAD FILE</u><H4><br>
          		 <a href="upload.jsp"><button type="button" class=" but">CLICK HERE TO UPLOAD FILE</button></a>
          </center>
        </tr>
        <br><br>
        <%if((name.equals("nipun"))&&(password.equals("12345"))){ %>
        <tr>
        	<center>
          	<h4><u>REGISTER NEW PERSON</u><H4><br>
          		 <a href="registerform.jsp"><button type="button" class=" but">CLICK HERE TO REGISTER</button></a>
          </center>
          
        </tr>
        <%}}%>


      </table>
    </div>
</div>




<footer>
       <p>Copyright &copy; 2020,getyourQ</p>
</footer>
</body>
</html>