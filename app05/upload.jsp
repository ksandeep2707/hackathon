<%@ page import="java.sql.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>

<head>

<style >
    
    footer
{
    position:fixed;
   left: 0;
   bottom: 0;
   width: 100%;
   background-color:#e6e6e6;
   color:black;
   text-align: center;
   padding: 0.5rem;

    margin-top: 3%;
}
.green-text
{
  font-size:20px;
  font-weight:bold;
  color:white;
}
.red-text
{
  font-size:20px;
  font-weight:bold;
  color:white;
}

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
padding: 8px 25px;
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
tr
{
    padding: 10px;
}
.link{
    font-size:23px;
    color:white;
    display: inline;
}
.link:hover
{
  color:blue;
}

td{
    padding: 5px;
    text-align: left;
    color:white;
  font-size:120%;
}
h3{
  display: inline;
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
  padding:1px 5px 5px 2px;
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
form{
    text-align:center;
}



</style>


   

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <title>AJAX</title>



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
        <a class="nav-link" href="profile.jsp"><i class="fa fa-user-circle-o" aria-hidden="true"></i>Profile&nbsp;&nbsp;&nbsp;</a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="logout.jsp"><i class="fas fa-sign-out-alt"></i>Logout&nbsp;&nbsp;&nbsp;</a>
      </li>
      <li class="nav-item">
        <CENTER><B><i class="fa fa-user-circle-o" aria-hidden="true"></i>
          WELCOME<Br>&nbsp;&nbsp;<%=n.toUpperCase()%></B></CENTER><%}%>
      </li>
  </ul>
       
     

  
  </div>
</div>
</nav>

<div class="container">
    <div class="row ">
      <div class="col-lg-12">

<div style="padding-top: 120px;padding-left:50px;padding-right:50px;">
<div class="acc-details sec">
      <div class="head ab">
        <h3>&nbsp;&nbsp;&nbsp;&nbsp;UPLOAD FILES DETAILS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="view.jsp?category=question&year=all">   <div class="link">ViewAllQuestionPapers</div></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="view.jsp?category=syllabus&year=all"><div class="link">ViewAllSyllabus</div></a> </h3>
       
      </div>

      <form action="#" method="post" id="myform" enctype="multipart/form-data">
      <table>
        <center><div id="msg"></div></center>
        <tr>
            <td>Category</td>
            <td> <select name = "category">
                <option value="" disabled selected hidden>Select Category</option>
              <option value = "syllabus" >Syllabus</option>
              <option value = "question">Question paper</option>
             </select></td>
          </tr>
          <tr>
            <td>Year</td>
            <td> <select name = "year">
                <option value="" disabled selected hidden>Select Year</option>
              <option value = "1st" >1st</option>
              <option value = "2nd" >2nd</option>
              <option value = "3rd" >3rd</option>
              <option value = "4th" >4th</option>
             </select></td>
          </tr>
          <tr>
            <td>Subject Code</td>
            <td><input type="text" name="subjectcode" placeholder="Subject Code"></td>
          </tr>
          <tr>
            <td>Subject Name</td>
            <td><input type="text" name="subjectname" placeholder="Subject Name"></td>
          </tr>
          <td>Select File: </td>
                    <td>
                        <input type="file" name="file" style="width:10;">
                    </td>


        <tr><td></td><td></td><td><br>
          <center>
                 <a href="upload.jsp"><button type="submit" class=" but form">UPLOAD</button></a>

                 <div class="loader center-align" style="margin-top: 10px; display:none;">
            <center>
                        <h5> Uploading File... </h5>
                        <div class="spinner-border" role="status">
                          <span class="sr-only">Loading...</span>
                         </div>
                        
                        <h5>Please Wait....</h5>
                    </center>
                    </div>
          </center>
        </tr>
         


      </table>
  </form>
    </div>
</div>
<div>
</div>
</div>
      



    <script src="https://code.jquery.com/jquery-3.5.1.min.js"
        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
                <script>
                $(document).ready(function(){
                    console.log("Page is ready");

                    $("#myform").on('submit',function(event){
                           event.preventDefault();
                           var f=new FormData(this);
                           $("#msg").empty();
                           $("#msg").removeClass();
                        
                           console.log(f);
                           $(".loader").show();
                           $(".form").hide();

                           $.ajax({
                               url: "UploadServlet" ,
                               data:f,
                               contentType: false,
                               processData: false,
                               type:'POST',
                               success: function(data,textStatus,jqXHR){
                                 console.log(data);
                                 console.log("succes");
                                 $(".loader").hide();
                                   $(".form").show();
                                   if(data.trim()==="success"){
                                       $("#msg").html("File Uploaded Succesfully!!!");
                                       $("#msg").addClass("green-text");
                                   }
                                   
                                   else{
                                       $("#msg").html("Failed to Upload!!!");
                                       $("#msg").addClass("red-text");
                                   }

                               },
                               error: function(jqXHR,textStatus,errorThrown){
                                  // console.log(data);
                                   console.log("error.....");
                                   $(".loader").hide();
                                   $(".form").show();
                                   $("#msg").html("Registering Failed !!!");
                                   $("#msg").addClass("red-text");

                               }
                              

                

                           })
                    })


                })
            </script>

<footer style="width:100;">
       <p>Copyright &copy; 2020,getyourQ</p>
</footer>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</body>

</html>