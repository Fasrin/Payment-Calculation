<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="Payment123.css">
<title> Payment </title>
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
<form action="Update123.jsp">
	<table class="container">
		<tr>
			<th>Customer Name</th>
			<th>Medicine</th>
			<th>Price</th>
			<th>Quantity</th>
			<th>Total Amount</th>
			<th>Control</th>
		</tr>
		
		<tr>
			<%
			int sumTot=0;
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pms","root","");
		Statement st = con.createStatement();
		String cid = request.getParameter("cid");
 		String sql = "SELECT * FROM payment p, customer c where p.cutomer_id=c.cid AND cutomer_id='"+cid+"'";

		ResultSet rs = st.executeQuery(sql);
		int i = 0;	
		while(rs.next())
		{
			%>
			<tr>
					<td>
						<%=rs.getString("cname") %>
						<span style="display:none">
							<input name="pid" value="<%=rs.getString("payment_id") %>">
							<input name="cid" value="<%=rs.getString("cutomer_id") %>">
						</span>
					</td>
					<td><%=rs.getString("medicine") %></td>
					<td id="unitPrice<%=i %>"><%=rs.getString("price") %></td>
					<td style="text-align:center"><input name="qty" style="width:20%;outline:none;border:none;border-bottom:1px solid black" type="text" id="num<%=i %>" value="<%=rs.getString("quantity") %>"></td>
					<td id="totalAmount<%=i %>">
					<%
						int price = Integer.parseInt(rs.getString("price"));
						int quantity = Integer.parseInt(rs.getString("quantity"));
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
					<td><button type="button" onclick="calctotal(<%= i%>,<%= rs.getString("payment_id")%>)">Calculate</button></td>
				 
			</tr>
			<%
			i++;
		}
		
		con.close();
	}
	catch(Exception e)
	{
		out.println(e);
	}

	%>
	<br/>
		</tr>

	</table>
	<input style="display:none;" name="total" value="<%= sumTot %>">
	<input type="submit" value="Update">
</form>
</body>
</html>