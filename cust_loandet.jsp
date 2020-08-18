<%@ page import="java.sql.*"%>
<HTML>
<HEAD>
<TITLE> New Document </TITLE>
<LINK href="dyn.xsl" rel="stylesheet">
</HEAD>
<BODY BGCOLOR="#FFFFFF">
<script src="validate.js"></script>
<form onsubmit="return validate(this);">  
<center>
<script>
function retrieve(obj) {
obj1=obj.options[obj.selectedIndex].myvalue
document.forms[0].lndesc.value=obj1
}
</script>
<span id=heading>LOAN DETAILS</span>
<BR>
<BR>
<fieldset><legend>Loan Master</legend><BR>
<TABLE>
<TR>
	<TD>Loan Code</TD>
	<TD colspan=3><select name="lncode" onchange=retrieve(this);>
	<option value="" myvalue="" >Select Loan Code</option>
<% 
	String todb=null;
	Connection con=null;
	Statement st=null;
	ResultSet rs=null;
	int val1=0;
	try {
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		con=DriverManager.getConnection("jdbc:odbc:apsfc","apsfc","apsfc");
		String cmd="select * from apsfc_loan_mstr";
		st=con.createStatement();
		rs=st.executeQuery(cmd);	
		while(rs.next()) {
		val1=rs.getInt(1);
		out.println("<option myvalue="+rs.getString(2)+ " value='"+val1+"'>"+val1+"</option>");
		}
		}catch(Exception e){	out.println("Error Occured"+e);	}
%>
</select></TD></tr>
<TR>
	<TD>Loan Description</TD>
	<TD><INPUT TYPE="text" NAME="lndesc" maxlength=30></TD>
</TR>
<tr>
</tr>
<TR>
<tr>
</TABLE>
</center>
</form>
</BODY>
</HTML>
