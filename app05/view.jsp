<%@ page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

h3{
  display: inline;
 color:white;
}
h2{
 color:white;
 font-size:90%;
}
h4
{
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
  padding:3px 50px 45px 45px;
}


.head{
  position:relative;
  z-index: 1;
  bottom:2.5rem;
  font-size:100%;
}


table {

  max-width: 100%;
}

tr:nth-child(odd) {
  background-color: #eee;
}
tr:nth-child(even) {
  background-color:lightgreen;
}

th {
  background-color: #555;
  color: #fff;
}

th,
td {
  text-align: left;
  padding: 0.5em 1em;
}

td::before {
  display: none;
}

@media screen and (max-width: 680px) {
 table {
   border: 0;
   display: block;
   box-shadow: none;
 }

 thead {
   position: absolute;
   opacity: 0;
 }
  
 tbody {
   display: block;
   width: 100%;
   min-width: 19em;
   max-width: 25em;
 }

 tr {
   border-top: 2px solid #3c3c3b;
   border-bottom: 1px solid #3c3c3b;
   display: grid;
   grid-template-columns: max-content auto;
   margin-bottom: 1em;
 }

 td {
   display: contents;
 }

 td::before {
   display: inline-block;
   font-weight: bold;
   padding: 0.5em;
   border-bottom: 1px solid;
 }
  
  td span {
    padding: 0.5em;
    border-bottom: 1px solid;
  }

 td:last-child {
   border-bottom: 0;
 }
}

.acc
{
    padding-left:50px;
    padding-top:10px;
}

.par{
    font-size:20px;
    
    color: white;
}
.cc{
    font-size:20px;
    
    color:aqua;
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

<%!
            
            PreparedStatement ps = null;
            ResultSet rs = null;
        %>
  <%
          HttpSession se = request.getSession(false);
          if(se==null)
            response.sendRedirect("loginpage.html");
          ArrayList<String> names= (ArrayList)se.getAttribute("names");
          String category=request.getParameter("category");
          String year=request.getParameter("year");
          


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
       
<%
if(names==null) {     
%>
<li class="nav-item">
        <a class="nav-link" href="loginpage.html"><i class="fa fa-user-circle-o" aria-hidden="true"></i>Admin Login&nbsp;&nbsp;&nbsp;</a>
      </li>
<%
}
          if(names!=null){
          String name=names.get(0);
          String n=new String(name);
          String password=names.get(1);
%>
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
<%
               Class.forName("oracle.jdbc.driver.OracleDriver");  
               Connection con=DriverManager.getConnection(  
                  "jdbc:oracle:thin:@localhost:1521:xe","system","manager");
               String sql="";
               if(category.equals("question"))
                     sql = "select * from QuestionTable";
        if(category.equals("syllabus"))
                     sql = "select * from SyllabusTable";
               ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
            

%>


<div style="padding-top: 120px;padding-left:50px;padding-right:50px;">
<div class="acc">
      <div class="head ab">
        <h3 style="font-size:190%;color: #F0E68C;"><b>&nbsp;&nbsp;&nbsp;&nbsp;<%=year.toUpperCase()%> YEAR <%if(category.equals("question")){%>QUESTION PAPERS
            <%}else{%>SYLLABUS<%}%> </b>
        </h3>
        <br><br>
       <p class="par">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Welcome To <b>GetQ</b>!&nbsp;&nbsp;All syllabus and Question Paper Provided here are based on Courses provided by National Institute of Technology ,Patna(NIT PATNA).National Institute of Technology Patna (NIT Patna or NITP), formerly Bihar School of Engineering and Bihar College of Engineering, is a public engineering institution located in Patna in the Indian state of Bihar. It was renamed as NIT Patna, by the Government of India on 28 January 2004</p>
       <p class="cc">&nbsp;&nbsp;&nbsp;&nbsp;Click on download to Download File</p>
      </div>

      <table>
        <%
        if (!rs.isBeforeFirst() ) {    %>
        <h3><center>No Data Found Will be Uploaded Soon!!!</center></h3>

        <%}else{
        
        %>

         <tr>
                <th><CENTER>SUBJECT CODE</CENTER></th><th><CENTER>SUBJECT NAME</CENTER></th><th><CENTER>ADDED DATE</CENTER></th><th><CENTER>DOWNLOAD</CENTER></th>
        </tr>
        
         <%
 while (rs.next()) {
        if(year.equals("all"))
                {
                %>
               <tr>
                <td><%=rs.getString(2)%></td>
                <td><%=rs.getString(3)%></td>
                <td><%=rs.getTimestamp(6)%></td>
                <td><a href="DownloadServlet?fileName=<%=rs.getString(4)%>">Download</a></td>
            </tr>
<%}else{
if(year.equals(rs.getString(1))){%>
                <tr>
                <td><%=rs.getString(2)%></td>
                <td><%=rs.getString(3)%></td>
                <td><%=rs.getTimestamp(6)%></td>
                <td><a href="DownloadServlet?fileName=<%=rs.getString(4)%>">Download</a></td>
            </tr>

         <%}}}}%>


      </table>
    </div>
</div>

      



    <script src="https://code.jquery.com/jquery-3.5.1.min.js"
        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
                

<footer style="width:100;">
       <p>Copyright &copy; 2020,getyourQ</p>
</footer>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</body>

</html>