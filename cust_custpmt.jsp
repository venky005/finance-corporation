<%@ page import="java.sql.*,java.io.*,java.lang.*"%>
<HTML>
<HEAD>
<TITLE> New Document </TITLE>
<LINK href="dyn.xsl" rel="stylesheet">
</HEAD>
<BODY BGCOLOR="#FFFFFF">
<script src="validate.js"></script>
<form onsubmit="return validate(this);">  
<center>
<TABLE>
<% 
	int lnno=Integer.parseInt(request.getParameter("loanno"));
	String todb=null;
	Connection con=null;
	Statement st=null;
	ResultSet rs=null;

	int custcode=0;
	String custname=null;
	int pmtid=0;
	int pmtamt=0;
	Date pmtdate;
	int recvby=0;
	try {
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		con=DriverManager.getConnection("jdbc:odbc:apsfc","apsfc","apsfc");%>
		
<%		String cmd="Select customer_code from apsfc_cust_loan where loan_number="+lnno;
		st=con.createStatement();
		rs=st.executeQuery(cmd);
		if(rs.next())
		{
			custcode=rs.getInt(1);

		String cmd1="Select customer_name from apsfc_customer where customer_code="+custcode;
		Statement st1=con.createStatement();
		ResultSet rs1=st1.executeQuery(cmd1);
		if(rs1.next())
			custname=rs1.getString(1);

		String cmdp="Select * from apsfc_payment where loan_no="+lnno;
		Statement stp=con.createStatement();
		ResultSet rsp=stp.executeQuery(cmdp);
%>
		<legend style="font-size:15px;color:maroon">Customer Payment Details</legend><BR>
			<table align=center cellspacing=0 cellpadding=5 border=1>
			<TR>
			<TH> Payment ID </TH>
			<TH> Customer Name</TH>
			<TH> Payment Amount</TH>
			<TH> Payment Date </TH>
			<TH> Received By </TH>			
			</TR>
<%				while(rsp.next()){		%>
				<TR>
				<TD align="Right"><%=rsp.getInt(1) %></TD>
				<TD><%=custname%></TD>
				<TD align="Right"><%=rsp.getInt(3)%></TD>
				<TD><%=rsp.getDate(4)%></TD>
				<TD align="Right"><%=rsp.getInt(5)%></TD>
<%			}}
		else
	        out.println("<link rel=stylesheet href='dyn.xsl'><body><h2>The Loan ID Doesn't Exists</h2><center><a href=\"javascript:history.back()\">Continue</a>&nbsp;&nbsp;<a href=\"custindex.htm\" target=\"_parent\">Home</a>");
		}catch(Exception e){	out.println("Error Occured"+e);	}
%>
</TABLE>
</center>
</form>
</BODY>
</HTML>
