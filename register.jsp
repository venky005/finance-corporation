<%@ page import="java.sql.*;"%>
<%
	String user=request.getParameter("user").toLowerCase();
	String pass=request.getParameter("pass").toLowerCase();
 %>
<%	Connection con=null;
	PreparedStatement sst=null;
	Statement st=null;
	ResultSet rs=null;
	try{
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		con=DriverManager.getConnection("jdbc:odbc:apsfc","apsfc","apsfc");
		String cmd="INSERT INTO APSFC_ADMIN VALUES(?,?)";
		sst=con.prepareStatement(cmd);
	    sst.setString(1,user);
		sst.setString(2,pass);
		sst.executeUpdate();
		out.println("<link rel=stylesheet href='dyn.xsl'><body bgcolor=gray><h1>Your Transaction is Succeeded</h1><br><br><center><a href=\"javascript:history.back()\">Continue</a>&nbsp;&nbsp;<a href=\"index.htm\" target=\"_parent\">Home</a>");
		}catch(Exception e)	{
   		String msgs=" ";
		msgs=(e.getMessage().toLowerCase().indexOf("unique")!=-1)?"The User Name U Specified is Already Existed.<BR><BR>Please Choose Another Name":"UnKnown Exception Occured";
		out.println("<link rel=stylesheet href='dyn.xsl'><body bgcolor=ivory><h1>Error Occured! While Processing Ur Transaction</font></h1><P>"+msgs+"</p><br><br><center><a href=\"javascript:history.back()\">Continue</a>&nbsp;&nbsp;<a href=\"index.htm\" target=\"_parent\">Home</a>");

			}
%>