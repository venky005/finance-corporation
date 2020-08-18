<%@ page import="java.sql.*;"%>
<link rel=stylesheet href='dyn.xsl'>
<style>
td
    {
    font-family:Verdana; 
	font-size:12; 
	font-weight:normal; 
	vertical-align:middle; 
	text-align:center;
	color:black;
	height:20px;
	width:400px;
    border:0px;
	
	text-decoration: none; 

	}
	th
    {
    font-family:Verdana; 
	font-size:13; 
	font-weight:bold; 
	vertical-align:middle; 
	text-align:center;
	color:black;
	height:20px;
	width:400px;
    border:0px;
	background:#c5d6cf;
	text-decoration: none; 

	}
	table
	{
	   border:1px black solid;
	   height:50px;
	   width:300px;
	   } 
</style>

<%Connection con=null;
	Statement st=null;
	ResultSet rs=null;
	String abc=null;
	try{
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		con=DriverManager.getConnection("jdbc:odbc:apsfc","apsfc","apsfc");
		String cmd1="Select * from apsfc_users";
		Statement st1=con.createStatement();
		ResultSet rs1=st1.executeQuery(cmd1);%>
        <table>
			<tr>
			   <th>userid</th><th>password</th><th>Name</th><th>Age</th><th>Sex</th><th>Address</th><th>Anual Income</th><th>Scale</th>
			</tr>

        <%
	     while(rs1.next())
		{ %>
		
			<tr>
				<td><%=rs1.getString(1)%></td>
			    <td><%=rs1.getString(2)%></td>
				<td><%=rs1.getString(3)%></td>
			    <td><%=rs1.getString(4)%></td>
				<td><%=rs1.getString(5)%></td>
			    <td><%=rs1.getString(6)%></td>
				<td><%=rs1.getString(7)%></td>
				<td><%=rs1.getString(8)%></td>
			</tr>

			<%}%>
		</table><br><br>
		<%}catch(Exception e)
		{
		out.println("<link rel=stylesheet href='dyn.xsl'><body bgcolor=ivory><h1>Error Occured! While Processing Ur Transaction"+e+"</font></h1><br><br><center><a href=\"javascript:history.back()\">Continue</a>&nbsp;&nbsp;<a href=\"javascript:self.close()\">Skip From This Page</a>");
		}
%>