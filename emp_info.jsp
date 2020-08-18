<%@ page import="java.sql.*;"%>
<%
	int eno = Integer.parseInt(request.getParameter("eno"));
	String ename=request.getParameter("ename");
	String desig=request.getParameter("desig");
	int msal = Integer.parseInt(request.getParameter("msal"));
	String addr=request.getParameter("addr");
    String phno =request.getParameter("phno");
 %>
<%	Connection con=null;
	PreparedStatement st=null;
	Statement sst=null;
	ResultSet rs=null;

	try{
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		con=DriverManager.getConnection("jdbc:odbc:apsfc","apsfc","apsfc");
		String cmd="INSERT INTO APSFC_EMP VALUES(?,?,?,?,?,?)";
		st=con.prepareStatement(cmd);
	    st.setInt(1,eno);
		st.setString(2,ename);
		st.setString(3,desig);
		st.setInt(4,msal);
		st.setString(5,addr);
		st.setString(6,phno);
		st.execute();
		sst=con.createStatement();
		rs=	sst.executeQuery("Select * from apsfc_emp");
		out.println("<link rel=stylesheet href='dyn.xsl'><body bgcolor=gray><h1>Your Transaction is Succeeded</h1><br><br><center><a href=\"javascript:history.back()\">Continue</a>&nbsp;&nbsp;<a href=\"index.htm\" target=\"_parent\">Home</a>");
	    }catch(Exception e)	{
			String msgs=" ";
			msgs=(e.getMessage().toLowerCase().indexOf("unique")!=-1)?"Employee Number u specified Already Existed.<BR><BR> Please Choose Another Number":"UnKnown Exception Occured";
			out.println("<link rel=stylesheet href='dyn.xsl'><body bgcolor=ivory><h1>Error Occured! While Processing Ur Transaction</font></h1><P>"+msgs+"</p><br><br><center><a href=\"javascript:history.back()\">Continue</a>&nbsp;&nbsp;<a href=\"index.htm\" target=\"_parent\">Home</a>");
			}
%>