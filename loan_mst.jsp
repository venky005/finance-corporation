<%@ page import="java.sql.*;"%>
<%
	int lncode = Integer.parseInt(request.getParameter("lncode"));
	String lndesc=request.getParameter("lndesc");
 %>
<%	Connection con=null;
	PreparedStatement st=null;
	Statement sst=null;
	ResultSet rs=null;

	try{
				
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		con=DriverManager.getConnection("jdbc:odbc:apsfc","apsfc","apsfc");
		String cmd="INSERT INTO APSFC_LOAN_MSTR VALUES(?,?)";
		st=con.prepareStatement(cmd);
	    st.setInt(1,lncode);
		st.setString(2,lndesc);
		st.execute();
		sst=con.createStatement();
		rs=	sst.executeQuery("Select * from apsfc_loan_mstr");
		out.println("<link rel=stylesheet href='dyn.xsl'><body bgcolor=gray><h1>Your Transaction is Succeeded</h1><br><br><center><a href=\"javascript:history.back()\">Continue</a>&nbsp;&nbsp;<a href=\"index.htm\" target=\"_parent\">Home</a>");
		}catch(Exception e)	{
   		String msgs=" ";
		msgs=(e.getMessage().toLowerCase().indexOf("unique")!=-1)?"The Loan Code U Specified is Already Existed.<BR><BR>Please Choose Another Number":"UnKnown Exception Occured";
		out.println("<link rel=stylesheet href='dyn.xsl'><body bgcolor=ivory><h1>Error Occured! While Processing Ur Transaction</font></h1><P>"+msgs+"</p><br><br><center><a href=\"javascript:history.back()\">Continue</a>&nbsp;&nbsp;<a href=\"index.htm\" target=\"_parent\">Home</a>");

			}
%>