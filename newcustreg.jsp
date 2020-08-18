<%@ page import="java.sql.*;"%>
<%
			String userid=request.getParameter("username").toLowerCase();
			String password=request.getParameter("pass").toLowerCase();
		 	String username=request.getParameter("uname").toLowerCase();
			String age=request.getParameter("age").toLowerCase();
			String sex=request.getParameter("sex").toLowerCase();	
			String address=request.getParameter("address").toLowerCase();
			String anualincome=request.getParameter("annual").toLowerCase();
			String scale=request.getParameter("scale").toLowerCase();


 %>
<%	Connection con=null;
	PreparedStatement sst=null;
	Statement st=null;
	ResultSet rs=null;
	try{
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		con=DriverManager.getConnection("jdbc:odbc:apsfc","apsfc","apsfc");
		String cmd="INSERT INTO APSFC_USERS VALUES(?,?,?,?,?,?,?,?,?)";
		sst=con.prepareStatement(cmd);
	    sst.setString(1,userid);
		sst.setString(2,password);
		sst.setString(3,username);
		sst.setString(4,age);
		sst.setString(5,sex);
		sst.setString(6,address);
		sst.setString(7,anualincome);
		sst.setString(8,scale);
		sst.setString(9,"false");
		sst.executeUpdate();
		out.println("<link rel=stylesheet href='dyn.xsl'><body bgcolor=gray><h1>Your Transaction is Succeeded</h1><br><br><center>&nbsp;&nbsp;<a href=\"admin.htm\" target=\"_parent\">Home</a>");
		}catch(Exception e)	{
   		String msgs=" ";
		msgs=(e.getMessage().toLowerCase().indexOf("unique")!=-1)?"The User Name U Specified is Already Existed.<BR><BR>Please Choose Another Name":"UnKnown Exception Occured"+e;
		out.println("<link rel=stylesheet href='dyn.xsl'><body bgcolor=ivory><h1>Error Occured! While Processing Ur Transaction</font></h1><P>"+msgs+"</p><br><br><center><a href=\"javascript:history.back()\">Continue</a>&nbsp;&nbsp;<a href=\"admin.htm\" target=\"_parent\">Home</a>");

			}
%>