<%@ page import="java.sql.*"%>
<link href="dyn.xsl" rel="stylesheet">
<style>
td {padding-left:12px}
th {color:aliceblue}
</style>
<script>
function getSubmit(tg) {
          tgs=tg.childNodes;
          urltopass="transaction.jsp?";
          urltopass+="lnno="+tgs[0].innerText+"&";
          urltopass+="custcode="+tgs[1].innerText+"&";
          urltopass+="intcode="+tgs[2].innerText;
          location=urltopass;   
}         
</script>
<title>Transaction Terminal</title>
<script src="validate.js"></script>
<body style="border:0" bgcolor=ivory scroll=no>
<center><h3>Andhra Pradesh State Finance Corporation</h3><span><a href="index.htm" style="font-size:15px">Jump to Home</a></sapn></center>
<table border=0 cellspacing=0 cellpadding=0 width='700'><tr>
<td><img src="IMAGES/apmap.gif" border=0 width=150>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<fieldset>
<legend style="font-size:15px;color:maroon">Transaction Terminal</legend><BR>
<div align=center style="background:papayawhip;color:maroon;font-siz:e12px;border:1 solid gray">Click On Any Row</font></div>
<div style="width:500px;height:200px;overflow-x:hidden;overflow-y:scroll;border:1 solid gray">
<table width='100%' cellspacing=0 cellpadding=0><Tr>
<TD width='100%' align=left>
<%
	Connection con=null;
	PreparedStatement st=null;
	Statement sst=null;
	ResultSet rs=null;
        String buf="";
	try {
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		con=DriverManager.getConnection("jdbc:odbc:apsfc","apsfc","apsfc");
		String totest="Select loan_number,customer_code,interest_code from apsfc_cust_loan";
		sst=con.createStatement();
		rs=sst.executeQuery(totest); 
                buf+="<table width='100%'  align=center bgcolor='steelblue' cellspacing=1 cellpadding=1>";
                buf+="";
                buf+="<tr bgcolor=gray><Th>Loan code</th><th>Customer Code</th><th>Imterest Code</th></tr>";
                while(rs.next())  buf+="<tr class=enabled bgcolor=whitesmoke onclick=getSubmit(this);><td>"+rs.getInt(1)+"<td>"+rs.getInt(2)+"<td>"+rs.getInt(3)+"</td></tr>";
                buf+="</table>";out.println(buf);
	} catch(Exception e) { out.println(e);}
	%></td></tr>
</table></div>
</fieldset>
</td></tr></table><BR><BR>
<div align=center><button accesskey="H" onclick="location='index.htm'"><u>H</u>ome</button>&nbsp;&nbsp;
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
