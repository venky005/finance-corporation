<%@ page import="java.sql.*" %>
<HTML>
<HEAD>
<TITLE> New Document </TITLE>
<LINK href="dyn.xsl" rel="stylesheet">
<Script src="validate.js"></script>
</HEAD>
<BODY BGCOLOR="#FFFFFF">
<form>
<center>
<script>
function retrieve(obj) {
obj1=obj.options[obj.selectedIndex].myvalue
obj2=obj.options[obj.selectedIndex].myvalue1
document.forms[0].intrate.value=obj1
document.forms[0].ngroup.value=obj2
}
</script>
<span id=heading>INTEREST DETAILS</span>
<BR><BR>
<fieldset><legend>Interest Master</legend><BR><BR>
<table width=550 cellspacing=1 cellpadding=1 align=center>
<TR>
	<TD>Interest Code</TD>
	<TD colspan=3><select name="intcode" onchange=retrieve(this);>
	<option value="" myvalue="" myvalue1="">Select Interest Code</option>
<% 
	String ngroup=null;
	Connection con=null;
	Statement st=null;
	ResultSet rs=null;
	int val=0;
	double val1=0.0;
	try {
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		con=DriverManager.getConnection("jdbc:odbc:apsfc","apsfc","apsfc");
		String cmd="select * from apsfc_int";
		st=con.createStatement();
		rs=st.executeQuery(cmd);	
		while(rs.next()) {
			ngroup=rs.getString(1);
			val=rs.getInt(2);
			val1=rs.getDouble(3);
			out.println("<option myvalue="+val1+ " myvalue1="+ngroup+ " value='"+val+"'>"+val+"</option>");
		}
		}catch(Exception e){	out.println("Error Occured"+e);	}
%>
</select></TD></tr>
<TR>
	<TD>Interest Rate</TD>
	<TD><INPUT TYPE="text" NAME="intrate" maxlength=30></TD>
</TR>
<TR>
	<TD>Group Name</TD>
	<TD><INPUT TYPE="text" NAME="ngroup" maxlength=30></TD>
</TR>
</table><BR></fieldset>
</BODY>
</HTML>
