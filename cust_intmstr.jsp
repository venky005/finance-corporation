<%@ page import="java.sql.*" %>
<HTML>
<HEAD>
<TITLE> New Document </TITLE>
<LINK href="dyn.xsl" rel="stylesheet">
<Script src="validate.js"></script>
</HEAD>
<BODY BGCOLOR="#FFFFFF">
<form action="./int_mst.jsp" method=post onsubmit="return validate(this)">
<center>
<span id=heading>INTEREST DETAILS</span>
<BR><BR>
<fieldset><legend>Interest Master</legend><BR><BR>
<table width=550 cellspacing=1 cellpadding=1 align=centera>
<tr><td rowspan=4><center><span><font cace=arial color=maroon>Existing Groups</font></span></center><BR>
<div class=groups>
<%
    Connection con=null;
	Statement st=null;
	ResultSet rs=null;
try{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	con=DriverManager.getConnection("jdbc:odbc:apsfc","aspfc","apsfc");
    String cmd="select group_name from  APSFC_int";
	st=con.createStatement();
	rs=st.executeQuery(cmd);
	while(rs.next()) 
    out.println("<li>"+rs.getString(1)+"</li>");
}catch(Exception e) { }
%>
</div></td><td align=right>New Group&nbsp;:&nbsp;&nbsp;</td><td><input name=ngroup maxlength=20></tr>
<TR><TD align=right>Interest Code</TD><TD><INPUT TYPE="text" NAME="intcode" maxlength=5 onkeypress="return blockkey(this)"></TD></tr>
<TR><TD align=right>Interest Rate</TD><TD><INPUT TYPE="text" NAME="intrate" maxlength=2 onkeypress="return blockkey(this)"></TD></TR>
<TR><TD colspan=2><BR><button TYPE="Submit" accesskey="S"><u>S</u>ave It</button>&nbsp;&nbsp;<button TYPE="Reset" accesskey="R"><u>R</u>efresh</button></TD></tr></table><BR></fieldset>
</BODY>
</HTML>
