<%@ page import="java.sql.*;"%>
<%  String gname=request.getParameter("ngroup");
	int intcode =Integer.parseInt(request.getParameter("intcode"));
	int intrate=Integer.parseInt(request.getParameter("intrate"));
 %>
<%	Connection con=null;
	PreparedStatement st=null;
	Statement sst=null;
	ResultSet rs=null;

	try{
				
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		con=DriverManager.getConnection("jdbc:odbc:apsfc","apsfc","apsfc");
		String cmd="INSERT INTO APSFC_INT VALUES(?,?,?)";
		st=con.prepareStatement(cmd);
	    st.setString(1,gname);
		st.setInt(2,intcode);
		st.setInt(3,intrate);
		st.execute();
		sst=con.createStatement();
		rs=	sst.executeQuery("Select * from APSFC_INT");
			out.println("<link rel=stylesheet href='dyn.xsl'><body bgcolor=gray><h1>Your Transaction is Succeeded</h1><br><br><center><a href=\"javascript:history.back()\">Continue</a>&nbsp;&nbsp;<a href=\"index.htm\" target=\"_parent\">Home</a>");
	    }catch(Exception e)	{
		String msgs=" ";
    	msgs=(e.getMessage().toLowerCase().indexOf("unique")!=-1)?"The Intrest Code U Specified is Already Existed.<BR><BR> Please Choose Another Number":"UnKnown Exception Occured";
		out.println("<link rel=stylesheet href='dyn.xsl'><body bgcolor=ivory><h1>Error Occured! While Processing Ur Transaction</font></h1><P>"+msgs+"</p><br><br><center><a href=\"javascript:history.back()\">Continue</a>&nbsp;&nbsp;<a href=\"index.htm\" target=\"_parent\">Home</a>");

		}
%>