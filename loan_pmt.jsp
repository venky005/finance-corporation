<%@ page import="java.sql.*,java.sql.Date"%>
<%  
    String month=request.getParameter("month");
	String day=request.getParameter("day");
	String year=request.getParameter("year");
    int pmtid=1;
	int lnno =Integer.parseInt(request.getParameter("lnno"));
	int pmtamt =Integer.parseInt(request.getParameter("pmtamt"));
	int recvby =Integer.parseInt(request.getParameter("recvby"));
	String udate=day+"-"+month+"-"+year;
%>
<%	Connection con=null;
	PreparedStatement st=null;
	Statement sst=null;
	ResultSet rs=null;
	try {
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		con=DriverManager.getConnection("jdbc:odbc:apsfc","apsfc","apsfc");
		String cmd="SELECT MAX(PAYMENT_ID) FROM APSFC_PAYMENT";
		sst=con.createStatement();
		rs=sst.executeQuery(cmd);
		if(rs.next())
			pmtid=rs.getInt(1)+1;
		else
			pmtid=1;
		cmd="INSERT INTO APSFC_PAYMENT(PAYMENT_ID,LOAN_NO,PAYMENT_AMOUNT,PAYMENT_DATE ,RECEIVED_BY) VALUES(?,?,?,?,?)";
		st=con.prepareStatement(cmd);
	    st.setInt(1,pmtid);
		st.setInt(2,lnno);
		st.setInt(3,pmtamt);
		st.setString(4,udate);
		st.setInt(5,recvby);
		st.execute();
		sst=con.createStatement();
		rs=	sst.executeQuery("Select * from apsfc_payment");
        out.println("<link rel=stylesheet href='dyn.xsl'><body bgcolor=gray><h1>Your Transaction is Succeeded</h1><br><h1>The PAYMENT ID is " + pmtid + "</h1><br><br><center><a href=\"javascript:history.back()\">Continue</a>&nbsp;&nbsp;<a href=\"index.htm\" target=\"_parent\">Home</a>");
	    }catch(Exception e)	{
			String msgs=" ";
			msgs=(e.getMessage().toLowerCase().indexOf("unique")!=-1)?"The Payment-Id u specifed is Already Existed.<BR><BR> Please Choose Another Number":"UnKnown Exception Occured";
			out.println("<link rel=stylesheet href='dyn.xsl'><body bgcolor=ivory><h1>Error Occured! While Processing Ur Transaction</font></h1><P>"+msgs+"</p><br><br><center><a href=\"javascript:history.back()\">Continue</a>&nbsp;&nbsp;<a href=\"index.htm\" target=\"_parent\">Home</a>");
			}
%>