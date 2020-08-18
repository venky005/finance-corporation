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
<% 
	int lnno=Integer.parseInt(request.getParameter("loanno"));
	String todb=null;
	Connection con=null;
	Statement st=null;
	ResultSet rs=null;
	int custcode=0;
	String custname=null;
	try {
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		con=DriverManager.getConnection("jdbc:odbc:apsfc","apsfc","apsfc");
		String cmd="Select * from apsfc_cust_loan where loan_number="+lnno;
		st=con.createStatement();
		rs=st.executeQuery(cmd);
			if(rs.next())	
			{
				out.println("<TABLE>");
				custcode=rs.getInt(2);
				String cmd1="Select customer_name from apsfc_customer where customer_code="+custcode;
				Statement st1=con.createStatement();
				ResultSet rs1=st1.executeQuery(cmd1);
				if(rs1.next()){	custname=rs1.getString(1);	}
		        out.println("<link href='dyn.xsl' rel=stylesheet><body><fieldset><legend>Transaction Results</legend><BR><BR>");
		        out.println("<table width=500 align=center rules=rows cellspacing=0 cellpadding=5 border=0>");
				out.println("<tr bgcolor=gray><th style='color:aliceblue' colspan=2>Loan Information</th></tr>");
				out.println("<tr bgcolor='whitesmoke'><td width='50%' nowrap align=right>Customer Code&nbsp;:&nbsp;</td><td width='50%'>"+custcode+"</td></tr>");
				out.println("<tr bgcolor='whitesmoke'><td width='50%' nowrap align=right>Customer Name&nbsp;:&nbsp;</td><td width='50%'>"+custname+"</td></tr>");
				out.println("<tr bgcolor='whitesmoke'><td width='50%' nowrap align=right>Loan Code&nbsp;:&nbsp;</td><td width='50%'>"+rs.getInt(3)+"</td></tr>");
				out.println("<tr bgcolor='whitesmoke'><td width='50%' nowrap align=right>Interest Code&nbsp;:&nbsp;</td><td width='50%'>"+rs.getInt(4)+"</td></tr>");
				out.println("<tr bgcolor='whitesmoke'><td nowrap width='50%' align=right>Loan Amount&nbsp;:&nbsp;</td><td width='50%'>"+rs.getLong(5)+"</td></tr>");
				out.println("<tr bgcolor='whitesmoke'><td nowrap width='50%' align=right>No of Months&nbsp;:&nbsp;</td><td width='50%'>"+rs.getInt(6)+"</td></tr>");
				out.println("<tr bgcolor='whitesmoke'><td nowrap width='50%' align=right>Monthly Payment&nbsp;:&nbsp;</td><td width='50%'>"+rs.getLong(7)+"</td></tr>");		
				out.println("<tr bgcolor='whitesmoke'><td nowrap width='50%' align=right>Loan Date&nbsp;:&nbsp;</td><td width='50%'>"+rs.getDate(8)+"</td></tr>");
				out.println("<tr bgcolor='whitesmoke'><td nowrap width='50%' align=right>Total Amount&nbsp;:&nbsp;</td><td width='50%'>"+rs.getLong(9)+"</td></tr>");
				out.println("</TABLE>");
			}
			else
				out.println("<link rel=stylesheet href='dyn.xsl'><body><h2>The Loan ID Doesn't Exists</h2><center><a href=\"javascript:history.back()\">Continue</a>&nbsp;&nbsp;<a href=\"custindex.htm\" target=\"_parent\">Home</a>");

		}catch(Exception e){	out.println("Error Occured"+e);	}
%>
</center>
</form>
</BODY>
</HTML>
