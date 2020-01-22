<%@page import="java.sql.*"%>
<%@page import="java.util.Scanner"%>

<%
		
		String username=request.getParameter("lusername");

		
		String password=request.getParameter("lpassword");
		try{
		Class.forName("oracle.jdbc.driver.OracleDriver");//step1
		Connection c=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","jsp","jsp");//step2
		PreparedStatement st=c.prepareStatement("select username,password from adminlogin where username=? and password=?");//step3
		st.setString(1,username);
		st.setString(2,password);
		ResultSet rs=st.executeQuery();//step4
		if(rs.next())
			{
			out.println("Login Successful");
			
			response.sendRedirect("adminentry.jsp");
			}
	else
		
	{out.println("login Failed,Check Username or password");
		
	}
	c.close();
	}
	catch(Exception e)
	{
		out.println(e);
	}
	
	
%>
