<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    

<%@ page import="java.util.Date" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
	table th {
        font-size: 25px;
        line-height: 45px;
        color: lightgreen;
    }
   table tr {
        font-size: 18px;
        color: #333;
    } 
</style>
<script type="text/javascript" src="jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
				
			function calctotal(i, pid)
			{
				var num1 = document.getElementById("num"+i).value;
				num = parseInt(num1);
				var sel1 = document.getElementById("unitPrice"+i).innerText;
				sel = parseInt(sel1);
				var sel3 = sel*num;
								
				document.getElementById("totalAmount"+i).innerHTML= sel3;
								
			}
</script>
</head>
<body>

<%@page import="java.sql.*" %>
	<center>
		<h1 style="background-color:black;color:white"> Invoice </h1>
	</center>
	<div style="float:right">	
		<img  src="pharmacy copy.png" width="250px" >
	</div>
	<br/>	
	<div>
	<h3>pharma.lk
	<br/>
	15a,Peters Lane,
	<br/>
	Dehiwala.
	<br>
	<br/>
	Contact No: 0117739896
	</h3>
	
	<br/>
	
	</div>
<form action="Update111.jsp">
<center>
	<table class="container" cellspacing="20">
		<tr>
			<th>Medicine</th>	
			<th>Unit Price</th>
			<th>Quantity</th>
			<th>Total Amount</th>
		</tr>
		
		<tr>
			<%
			int sumTot=0;
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pms","root","");
		Statement st = con.createStatement();
		Statement st2 = con.createStatement();
		Statement st3 = con.createStatement();
		String cid = request.getParameter("cid");
		Date fasrin = new Date();
 		String sql = "SELECT * FROM payment p, customer c where p.cutomer_id=c.cid AND cutomer_id='"+cid+"'";
 		String sql2 = "INSERT INTO invoice (cid,subTotal) values (" +cid+ ","+sumTot+ ")";
 		String cname="";
 		String iid="";
		
		ResultSet rs = st.executeQuery(sql);
		ResultSet rs1 = st.executeQuery(sql);
		
		int i = 0;
		
		
		while(rs1.next())
		{
			cname = rs1.getString("cname");
			%>
			<tr>
					<td><%=rs1.getString("medicine") %></td>
					<td id="unitPrice<%=i %>"><%=rs1.getString("price") %></td>
					<td><%=rs1.getString("quantity") %></td>
					<td id="totalAmount<%=i %>">
					<%
						int price = Integer.parseInt(rs1.getString("price"));
						int quantity = Integer.parseInt(rs1.getString("quantity"));
						int total = cal(price,quantity);
						sumTot += total;
						out.println(total);
					%>
					<%!
						public int cal(int price,int quantity)
						{
							return price*quantity;
						}
						
						
					%>
					</td>
			
			</tr>
			<%
			i++;

		}
		out.println("Customer Name : "+cname);
		
		String s = "INSERT INTO invoice (cid,subTotal) values (" +cid+ ","+sumTot+ ")";
		int result = st2.executeUpdate(s);
		
		String fs = "SELECT * FROM payment p, invoice i where p.cutomer_id=i.cid AND cutomer_id='"+cid+"'";
		ResultSet result2 =  st3.executeQuery(fs);
		
		if (result2.next()) { %>
			<p>Receipt ID : <%=result2.getString("iid") %></p>

	<% }
		con.close();
	}
	catch(Exception e)
	{
		out.println(e);
	}

	%>
	<br/>
		</tr>
		<tr>
			<td> </td>
			<td> </td>
			<td> </td>
			<td style="background-color:black"> </td>
		</tr>
		<tr>
			<td> </td>
			<td> </td>
			<td> Sub Total  </td>
			<td> <input style="display:none;" name="total" value=""> <% out.println(sumTot); %> </td>
		</tr>	 		
	</table>
	</center>
</form>
 		
</body>
</html>