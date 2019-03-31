<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Update </title>
</head>
<body>

<%@page import="java.sql.*" %>
<% 

		String qry = "update payment set quantity=? where payment_id=?";
		String cid = request.getParameter("cid");
		String sql = "SELECT * FROM payment p, customer c where p.cutomer_id=c.cid AND cutomer_id='"+cid+"'";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pms","root","");
		PreparedStatement st = con.prepareStatement(qry);
 	
 		String[] pid = request.getParameterValues("pid");
		String[] qty = request.getParameterValues("qty");
		String total = request.getParameter("total");

		String cname = request.getParameter("cname");
		
		for (int i=0; i<pid.length; i++) {
			//out.println(pid[i] + " qty: " + qty[i] + "<br>" );
			try {
				st.setString(1, qty[i]);
				st.setString(2, pid[i]);
				
				st.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		%>
		
		<form method="post" action = "Update111.jsp">
			<input hidden type="text" name="cid" value="<% out.println(cid); %>">
			<input type="submit" value="Next">
		</form>
		
		<% 
		//response.sendRedirect("Update111.jsp");
	/*	out.println("Total: " + total);
		out.println("Customer Id: " + cid);
		out.println("Customer Name: " + cname);
	 */	
 	
 		
	
	
%>
</body>
</html>