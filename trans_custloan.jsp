<%@ page import="java.sql.*,java.sql.Date"%>
<%  
    String month=request.getParameter("month");
	String day=request.getParameter("day");
	String year=request.getParameter("year");
	int lnno=Integer.parseInt(request.getParameter("lnno"));
	int custno =Integer.parseInt(request.getParameter("custcode"));
	int lncode =Integer.parseInt(request.getParameter("lncode"));
	int intcode =Integer.parseInt(request.getParameter("intcode"));
	int lnamt = Integer.parseInt(request.getParameter("lnamt"));
	int nomon = Integer.parseInt(request.getParameter("nomon"));
	int monpmt = Integer.parseInt(request.getParameter("monpmt"));
	int totamt = Integer.parseInt(request.getParameter("totamt"));
	String udate=day+"-"+month+"-"+year;
 %>
<%	Connection con=null;
	PreparedStatement st=null;
	Statement sst=null;
	ResultSet rs=null;
	try {
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		con=DriverManager.getConnection("jdbc:odbc:apsfc","apsfc","apsfc");
		String totest="Select interest_code from apsfc_int where interest_code="+intcode;
		sst=con.createStatement();
		rs=sst.executeQuery(totest);
		if(rs.next()) {
		String cmd="INSERT INTO APSFC_CUST_LOAN VALUES(?,?,?,?,?,?,?,?,?)";
		st=con.prepareStatement(cmd);
	    st.setInt(1,lnno);
		st.setInt(2,custno);
		st.setInt(3,lncode);
		st.setInt(4,intcode);
		st.setInt(5,lnamt);
		st.setInt(6,nomon);
		st.setInt(7,monpmt);
		st.setString(8,udate);
		st.setInt(9,totamt);
		st.execute();
		sst=con.createStatement();
		rs=	sst.executeQuery("Select * from apsfc_cust_loan");
    	out.println("<link rel=stylesheet href='dyn.xsl'><body bgcolor=gray><h1>Your Transaction is Succeeded</h1><br><br><center><a href=\"javascript:history.back()\">Continue</a>&nbsp;&nbsp;<a href=\"index.htm\" target=\"_parent\">Home</a>");
		} else { out.println("<link rel=stylesheet href='dyn.xsl'><body bgcolor=gray><h1>Your Transaction is Failed.<BR><BR>Please Check the Intrest Code Once Again.Such Intrest code not exist in the database.</h1><br><br><center><a href=\"javascript:history.back()\">Continue</a>&nbsp;&nbsp;<a href=\"index.htm\" target=\"_parent\">Home</a>");}
   } catch(Exception e)	{
			String msgs=" ";
			msgs=(e.getMessage().toLowerCase().indexOf("unique")!=-1)?"Loan Number u Specified is Already Existed.<br><BR> Please Choose Another Number":"UnKnown Exception Occured";
			out.println("<link rel=stylesheet href='dyn.xsl'><body bgcolor=ivory><h1>Error Occured! While Processing Ur Transaction</font></h1><P>"+msgs+"</p><br><br><center><a href=\"javascript:history.back()\">Continue</a>&nbsp;&nbsp;<a href=\"index.htm\" target=\"_parent\">Home</a>");

     			}
%>