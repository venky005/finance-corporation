<%@ page import="java.sql.*;"%>
<%
	String user=request.getParameter("user").toLowerCase();
	String pass=request.getParameter("pass").toLowerCase();
 %>
<%	Connection con=null;
	Statement st=null;
	ResultSet rs=null;
	try{
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		con=DriverManager.getConnection("jdbc:odbc:apsfc","apsfc","apsfc");
		String cmd="Select * from apsfc_admin where username='"+user+"' and password='"+pass+"'";
		st=con.createStatement();
	    rs=st.executeQuery(cmd);
		out.println("<center><h1>Un Authorized User Found</font></h1></center>");
		if(rs.next()) response.sendRedirect("index.htm");
		String cmd1="Select * from apsfc_users where USER_ID ='"+user+"' and PASSWORD='"+pass+"'";
		Statement st1=con.createStatement();
		ResultSet rs1=st1.executeQuery(cmd1);
	
		if(rs1.next())
			{	response.sendRedirect("custindex.htm");	}
		else out.println("<link rel=stylesheet href='dyn.xsl'><body bgcolor=gray><p><font face=tahoma color=maroon>No Such User Exist .<BR><BR>Please Check The User Name and Password u supplied is Correct or Not</h1><br><br><center><a href=\"javascript:history.back()\">Continue</a>&nbsp;&nbsp;<a href=\"javascript:self.close()\">Skip From This Page</a>");
		}catch(Exception e)	{
		out.println("<link rel=stylesheet href='dyn.xsl'><body bgcolor=ivory><h1>Error Occured! While Processing Ur Transaction</font></h1><br><br><center><a href=\"javascript:history.back()\">Continue</a>&nbsp;&nbsp;<a href=\"javascript:self.close()\">Skip From This Page</a>");
		}
%>