<%@ page import="java.sql.*"%>
<HTML>
<HEAD>
<TITLE> Customer Information </TITLE>
<LINK href="dyn.xsl" rel="stylesheet">
<script src="validate.js"></script>
<script>
function setTotamt() {
	icode=document.forms[0].intcode;
	lamt=document.forms[0].lnamt.value;
	nom =document.forms[0].nomon.value;
	intrate=icode.options[icode.selectedIndex].myvalue;
	if(lamt >0 && nom>0 && intrate>0)
	{
		totamt=eval(lamt)+eval((intrate*lamt)/100);
		mamt=totamt/nom;
		document.forms[0].monpmt.value=Math.round(mamt);
		document.forms[0].totamt.value=totamt;
	}
}
</script>
</HEAD>
<BODY BGCOLOR="#FFFFFF">
<form action="./trans_custloan.jsp" method=GET onsubmit="return validate(this)">
<center>
<span id=heading>CUSTOMER LOAN INFORMATION</span>
<BR>
<BR><fieldset><legend>Customer Loan Information</legend><BR>
<TABLE>
<TR><form action="./trans_custloan.jsp" method=GET onsubmit="return blockkey(this)">
<TD>Loan No:</td><td colspan=3><input type=text name="lnno" maxlength=5 onkeypress="return blockkey(this)"></td></tr>
<TR>
	<TD>Customer No</TD>
<TD  colspan=3><select NAME="custcode">
	<option>Select Any One</option>
	<%
	Connection con=null;
	PreparedStatement st=null;
	Statement sst=null;
	ResultSet rs=null;
	try {
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		con=DriverManager.getConnection("jdbc:odbc:apsfc","apsfc","apsfc");
		String totest="Select customer_code from apsfc_customer";
		sst=con.createStatement();
		rs=sst.executeQuery(totest); 
		while(rs.next()) {
		out.println("<option>"+rs.getInt(1)+"</option>");
		}
	} catch(Exception e) { out.println("<option value='0000'"+e+"</option>");}
	%></select>

	</TD>
</tr>
<tr><TD>Loan Code	</TD>
<TD  colspan=3><select NAME="lncode">
	<option>Select Any One</option>
	<%
	sst=null;
	rs=null;
	try {
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		con=DriverManager.getConnection("jdbc:odbc:apsfc","apsfc","apsfc");
		String totest="Select * from apsfc_loan_mstr";
		sst=con.createStatement();
		rs=sst.executeQuery(totest); 
		while(rs.next()) {
		out.println("<option>"+rs.getInt(1)+"</option>");
		}
	} catch(Exception e) { out.println("<option value='0000'"+e+"</option>");}
	%></select>

	</TD>

</TR><TR>
	<TD>Loan Amount</TD>
	<TD  colspan=3><INPUT TYPE="text" NAME="lnamt"  maxlength=9 onkeypress="return blockkey(this)" onchange="setTotamt()"></TD>
</TR><TR>
	<TD>No.of Months</TD>
	<TD  colspan=3><INPUT TYPE="text" NAME="nomon"  maxlength=3 onkeypress="return blockkey(this)" onchange="setTotamt()"></TD>
</TR><TR>
	<TD>Interest Code</TD>
	<TD  colspan=3><select NAME="intcode" onchange="setTotamt()">
	<option>Select Any One</option>
	<%
	try {
		sst=null;
		rs=null;
		String totest="Select interest_code, interest_rate from apsfc_int";
		sst=con.createStatement();
		rs=sst.executeQuery(totest); 
		while(rs.next()) {
		int vall=rs.getInt(1);
		out.println("<option myvalue="+rs.getInt(2)+ " value='"+vall+"'>"+vall+"</option>");
		}
	} catch(Exception e) { out.println("<option value='0000'"+e+"</option>");}
	%></select>

	</TD>
</TR>
<TR>
	<TD>Monthly Payment</TD>
	<TD  colspan=3><INPUT TYPE="text" NAME="monpmt"  maxlength=6 readonly onkeypress="return blockkey(this)"></TD>
</TR><TR>
       <TD>Loan Date</TD>
	   <Td><input name=day maxlength=2 size=3></td>
<TD><select name=month></select>
</td><TD>
<select name=year></select></td>
<TR><TD>Total Amount</TD>
<TD  colspan=3><INPUT TYPE="text" NAME="totamt"  maxlength=9 readonly onkeypress="return blockkey(this)"></TD></TR>
<TR><TD colspan=3 align=center><BR><button TYPE="Submit" accesskey="S"><u>S</u>ave It</button>&nbsp;&nbsp;
<button TYPE="Reset" accesskey="R"><u>R</u>efresh</button></TD>
<tr>
</TABLE></center></form>
</BODY></form>
<SCRIPT>
  var mths=["Jan","Feb","Mar","Apr","May","June","Jul","Aug","Sep","Oct","Nov","Dec"];
  var vals=[31,28,31,30,31,30,31,31,30,31,30,31];
  function  getMonths() {
  madd=document.forms[0].month;
  for(k=0;k<12;k++)
  madd.options[madd.options.length]=new Option(mths[k],mths[k]);
  }
  function getYears() {
  lt=new Date().getYear();
  yadd=document.forms[0].year;
  for(i=1900;i<lt+1;i++)
  yadd.options[yadd.options.length]=new Option(i,i);
  }
  getMonths();getYears();
  function checkDate(frm) {
  var dy=frm.day.value;
  var mth=frm.month.options[frm.month.selectedIndex].value.toLowerCase();
  var yr=frm.year.options[frm.year.selectedIndex].value;
  if(mth.indexOf('feb')!=-1&&yr%4==0&&dy>29) {
  alert("Leap Year Enter Valid Day");
  frm.day.focus();
  return false;
  } else if(mth.indexOf('feb')!=-1 && yr%4 != 0 && dy>28) {
  alert("Enter Valid Day");
  frm.day.focus();return false;
 } else {
          for(i=0;i<vals.length;i++) {
           if(mth==mths[i].toLowerCase() && mth!="feb") {
                  	   if(dy>vals[i]) {alert("Proper date");return false;}
                                        }  
                                   }
        }
 }
 </script>
</HTML>
