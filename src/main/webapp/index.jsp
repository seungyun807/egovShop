<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <script>
    location='/homeview.do'
    </script>
    <body>
        <h1>Successfully Connected to the Database!</h1>
        <% Connection conn = null;
            String driverName = "org.mariadb.jdbc.Driver";
            Class.forName(driverName);
            String serverName = "DESKTOP-7E3O01G";
            String serverPort = "1521";
            String sid = "XE";
            String url = "jdbc:mariadb://localhost:3306/";
            String username = "root";
            String password = "1234";
            conn = DriverManager.getConnection(url, username, password);
            Statement st = conn.createStatement();
            st.executeQuery("use test;");
            ResultSet rs = st.executeQuery("select * from user;");
            while (rs.next()) {%>

        User ID : <%= rs.getString(1)%><br/>
        User Type : <%= rs.getString(2)%><br/>
        User Name : <%= rs.getString(3)%><br/>
        Password : <%= rs.getString(4)%><br/>
        Birth Date : <%= rs.getString(5)%><br/>
        Gender : <%= rs.getString(6)%><br/>
        Email : <%= rs.getString(7)%><br/>
        Contact : <%= rs.getString(8)%><br/>
        Address : <%= rs.getDate(9)%>

        <%  }
            rs.close();%>
        <button onclick="location='/loginview.do'">로그인</button>
    </body>
</html>