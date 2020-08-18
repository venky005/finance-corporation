<%@ page import="java.sql.*"%>
<link href="dyn.xsl" rel="stylesheet">
<style>
td {padding-left:12px}
th {color:aliceblue}
</style>
<script>
function setPayment(obj) {
samp=obj.value
obj=obj.options[obj.selectedIndex].myvalue
document.forms[0].pmtamt.value=obj
}
</script>
<TITLE> Customer Payment Information </TITLE>
<script src="validate.js"></script>
<body style="border:0" bgcolor=ivory scroll=no>
<center><h3>Andhra Pradesh State Finance Corporation</h3><span> <br>
<span id=heading>CUSTOMER PAYMENT INFORMATION</span>
</center>
<table border=0 cellspacing=0 cellpadding=0 width='700'><tr>
<td><img src="IMAGES/apmap.gif" border=0 width=150>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<fieldset>
<legend style="font-size:15px;color:maroon">Customer Payment Information</legend><BR>
<div style="width:500px;height:200px;overflow-x:hidden;overflow-y:scroll;border:1 solid gray">
<TABLE><form action="./cust_loanpmt.jsp" method=GET onsubmit="return validate(this)">  
<%
	Connection con=null;
	Statement sst=null;
	ResultSet rs=null;

	try {
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		con=DriverManager.getConnection("jdbc:odbc:apsfc","apsfc","apsfc");
%>
<TR>
	<TD>Loan No</TD>
	<TD colspan=3><select name="lnno" onchange="setPayment(this)" >
	<option>select</option>
<% 
    String cmd2="select loan_number, monthly_payment from apsfc_cust_loan";
    sst=con.createStatement();
    rs=sst.executeQuery(cmd2);	
    while(rs.next()) {
	String vall=rs.getString(1);
	out.println("<option myvalue="+rs.getInt(2)+ " value='"+vall+"'>"+vall+"</option>");
	}
}catch(Exception e){e.printStackTrace();}
%>
</select></TD></tr>

<TR><TD>Payment Amount</TD>
<TD  colspan=3><INPUT TYPE="text" NAME="pmtamt"  maxlength=6 readonly onkeypress="return blockkey(this)" >

</TD></TR>
<TD>Payment Date</TD>
       <Td><input name=day maxlength=2 size=3  onkeypress="return blockkey(this)"></td>
<TD><select name=month></select></td><TD>
<select name=year></select></td></TR>

<TR><TD>DD No</TD>
<TD  colspan=3><INPUT TYPE="text" NAME="ddno"  maxlength=6 onkeypress="return blockkey(this)" >

</TD></TR>


<TR>
<TD colspan=3 align=center><BR><button TYPE="Submit" accesskey="S"><u>S</u>ave It</button>&nbsp;&nbsp;
<button TYPE="Reset" accesskey="R"><u>R</u>efresh</button></TD>
<tr>
</TABLE></center></form>

</div>
</fieldset>
</td></tr></table><BR><BR>
<div align=center><button accesskey="H" onclick="location='custindex.htm'"><u>H</u>ome</button>&nbsp;&nbsp;
<button type=reset onclick="javascript:self.close()" accesskey="X">E<u>x</u>it</button></td></tr>
</div>
<script>
trows=document.all.tags("TR");
for(i=0;i<trows.length;i++) {
if(trows[i].className=="enabled") {
trows[i].style.cssText="cursor:pointer";
trows[i].onmouseover=function() {this.style.background="mistyrose"}
trows[i].onmouseout=function() {this.style.background="whitesmoke"}
     }
   }
</script>
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
