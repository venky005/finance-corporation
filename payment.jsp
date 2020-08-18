<%@ page import="java.sql.*,java.sql.Date"%>
<HTML>
<HEAD>
<TITLE> Customer Payment Information </TITLE>
<LINK href="dyn.xsl" rel="stylesheet">
</HEAD>
<BODY BGCOLOR="#FFFFFF">
<script>
function setPayment(obj) {
samp=obj.value
obj=obj.options[obj.selectedIndex].myvalue
document.forms[0].pmtamt.value=obj
}
</script>
<script src="validate.js"></script>
<center>
<span id=heading>CUSTOMER PAYMENT INFORMATION</span>
<BR>
<BR><fieldset><legend>Customer Payment Information</legend><br>
<TABLE><form action="./loan_pmt.jsp" method=GET onsubmit="return validate(this)">  
<TR>
	<TD>Loan No</TD>
	<TD colspan=3><select name=lnno onchange="setPayment(this)">
	<option>select</option>
<% 
	Connection con=null;
PreparedStatement st=null;
Statement sst=null;
ResultSet rs=null;
try {
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
    con=DriverManager.getConnection("jdbc:odbc:apsfc","apsfc","apsfc");
    String cmd="select loan_number, monthly_payment from apsfc_cust_loan";
    sst=con.createStatement();
    rs=sst.executeQuery(cmd);	
    while(rs.next()) {
	String vall=rs.getString(1);
	out.println("<option myvalue="+rs.getInt(2)+ " value='"+vall+"'>"+vall+"</option>");
	}

%>
</select></TD></tr>

<TR><TD>Payment Amount</TD>
<TD  colspan=3><INPUT TYPE="text" NAME="pmtamt"  maxlength=6 onkeypress="return blockkey(this)" >

</TD></TR>
<TD>Payment Date</TD>
       <Td><input name=day maxlength=2 size=3  onkeypress="return blockkey(this)"></td>
<TD><select name=month></select></td><TD>
<select name=year></select></td></TR>

<TR>
	<TD>Received By</TD>
	<TD colspan=3><select name=recvby>
<% 

    String cmd1="select employee_no from apsfc_emp";
    sst=con.createStatement();
    rs=sst.executeQuery(cmd1);	
    while(rs.next()) {
		String val=rs.getString(1);
		out.println("<option value='"+val+"'>"+val+"</option>");
	}
}catch(Exception e){e.printStackTrace();}
%>
</select></TD></tr>

<TR>
<TD colspan=3 align=center><BR><button TYPE="Submit" accesskey="S"><u>S</u>ave It</button>&nbsp;&nbsp;
<button TYPE="Reset" accesskey="R"><u>R</u>efresh</button></TD>
<tr>
</TABLE></center></form>
</BODY>
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
