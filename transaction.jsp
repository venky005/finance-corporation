<%@ page import="java.sql.*,java.text.*,java.lang.*"%>
<html><title>Transsaction Terminal</title>
<%  
	int lnno=Integer.parseInt(request.getParameter("lnno"));
	int custno =Integer.parseInt(request.getParameter("custcode"));
	int intcode=Integer.parseInt(request.getParameter("intcode"));
 %>
<%
Connection con=null;
PreparedStatement st=null;
Statement sst=null;
ResultSet rs=null;
try {
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	con=DriverManager.getConnection("jdbc:odbc:apsfc","apsfc","apsfc");
	String intr="Select interest_code,interest_rate from apsfc_int where interest_code="+intcode;
	sst=con.createStatement();
    rs=sst.executeQuery(intr);
	int r1=(rs.next())?rs.getInt(1):0;
	if(r1==0) out.println("<link rel=stylesheet href='dyn.xsl'><body bgcolor=ivory><h1>Error Occured! While Processing Ur Transaction</font></h1><P>No Such Records Matched. Please Check the Number Once Again</p><br><br><center><a href=\"javascript:history.back()\">Continue</a>&nbsp;&nbsp;<a href=\"index.htm\" target=\"_parent\">Home</a>");
	else {
	int r=rs.getInt(2);
	String cmd1="Select * from apsfc_cust_loan where loan_number='"+lnno+"' and customer_code='"+custno+"' and interest_code='"+intcode+"'";
	rs=sst.executeQuery(cmd1);
	if(rs.next())	
	{
		        out.println("<link href='dyn.xsl' rel=stylesheet><body><fieldset><legend>Transaction Results</legend><BR><BR>");
		        out.println("<table width=500 align=center rules=rows cellspacing=0 cellpadding=5 border=0>");
				out.println("<tr bgcolor=gray><th style='color:aliceblue' colspan=2>Loan Information</th></tr>");
				out.println("<tr bgcolor='whitesmoke'><td width='50%' nowrap align=right>Loan Code&nbsp;:&nbsp;</td><td width='50%'>"+rs.getInt(3)+"</td></tr>");
				out.println("<tr bgcolor='whitesmoke'><td nowrap width='50%' align=right>Loan Amount&nbsp;:&nbsp;</td><td width='50%'>"+rs.getInt(5)+"</td></tr>");
				out.println("<tr bgcolor='whitesmoke'><td nowrap width='50%' align=right>No of Months&nbsp;:&nbsp;</td><td width='50%'>"+rs.getInt(6)+"</td></tr>");
				out.println("<tr bgcolor='whitesmoke'><td nowrap width='50%' align=right>Monthly Payment&nbsp;:&nbsp;</td><td width='50%'>"+rs.getInt(7)+"</td></tr>");		
				SimpleDateFormat sdf=new SimpleDateFormat("dd-MMM-yyyy");
				out.println("<tr bgcolor='whitesmoke'><td nowrap width='50%' align=right>Loan Date&nbsp;:&nbsp;</td><td width='50%'>"+sdf.format(rs.getDate(8)).toString()+"</td></tr>"); 
				out.println("<tr bgcolor='gray'><td  style='color:aliceblue' nowrap align=right width='50%'>Total Amount&nbsp;:&nbsp;<TD width='50%' style='color:aliceblue'>"+rs.getInt(9)+"</td></tr></table>");
	}
	else{
              out.println("<link rel=stylesheet href='dyn.xsl'><body bgcolor=ivory><h1>Error Occured! While Processing Ur Transaction.<BR><BR> No Such Records Existed In the database.<BR><BR>Please Check The Fields Once What u Entered</font></h1><br><br><center><a href=\"javascript:history.back()\">Continue</a>&nbsp;&nbsp;<a href=\"index.htm\" target=\"_parent\">Home</a>");}
	}

   } catch(Exception e)	{
			String msgs=" ";
			msgs=(e.getMessage().toLowerCase().indexOf("unique")!=-1)?"The Number u Specified is Doesn't Existed.<br><BR> Please Check the  Number U Choosed":"UnKnown Exception Occured";
			out.println("<link rel=stylesheet href='dyn.xsl'><body bgcolor=ivory><h1>Error Occured! While Processing Ur Transaction</font></h1><P>"+msgs+"</p><br><br><center><a href=\"javascript:history.back()\">Continue</a>&nbsp;&nbsp;<a href=\"index.htm\" target=\"_parent\">Home</a>");
   }
   
%>
<br><BR><center><button style="width:300px;" onclick="window.print()" accesskey="P"><u>P</u>rint The Transaction Report</button><BR><br><br><center><a href="javascript:history.back()">Continue</a>&nbsp;&nbsp;<a href="index.htm" target="_parent">Home</a><BR><BR><BR></fieldset>