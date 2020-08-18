<%@ page import="java.sql.*;"%>
<%
	int custcode = Integer.parseInt(request.getParameter("custcode"));
	String org=request.getParameter("orgname");
	String custname=request.getParameter("custname");
	String scale=request.getParameter("scale");
	int annsal=Integer.parseInt(request.getParameter("annsal"));
	String addr=request.getParameter("addr");
    String phno=request.getParameter("phno");
	int zip = Integer.parseInt(request.getParameter("zip"));
 %>
<%	Connection con=null;
	PreparedStatement st=null;
	Statement sst=null;
	ResultSet rs=null;

	try{
				
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		con=DriverManager.getConnection("jdbc:odbc:apsfc","apsfc","apsfc");
		String cmd="INSERT INTO APSFC_CUSTOMER VALUES(?,?,?,?,?,?,?,?)";
		st=con.prepareStatement(cmd);
	    st.setInt(1,custcode);
        st.setString(2,custname);
		st.setString(3,org);
		st.setString(4,scale);
		st.setInt(5,annsal);
		st.setString(6,addr);
    	st.setString(7,phno);
    	st.setInt(8,zip);
		st.execute();
		sst=con.createStatement();
		rs=	sst.executeQuery("Select * from apsfc_customer");
		out.println("<link rel=stylesheet href='dyn.xsl'><body bgcolor=gray><h1>Your Transaction is Succeeded</h1><br><br><center><a href=\"javascript:history.back()\">Continue</a>&nbsp;&nbsp;<a href=\"index.htm\" target=\"_parent\">Home</a>");
		 }catch(Exception e)	{
 			String msgs=" ";
			msgs=(e.getMessage().toLowerCase().indexOf("unique")!=-1)?"The Customer Code U Specified is Already Existed.<BR><BR> Please Choose Another Number":"UnKnown Exception Occured";
			out.println("<link rel=stylesheet href='dyn.xsl'><body bgcolor=ivory><h1>Error Occured! While Processing Ur Transaction</font></h1><P>"+msgs+"</p><br><br><center><a href=\"javascript:history.back()\">Continue</a>&nbsp;&nbsp;<a href=\"index.htm\" target=\"_parent\">Home</a>");
			}
		       
%>