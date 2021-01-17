<%
HttpSession se= request.getSession(false);
se.removeAttribute("name");
session.invalidate();
response.sendRedirect("loginpage.html");
%>