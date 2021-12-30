<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>

<%
    Connection connection = null;

    try{
        String url = "jdbc:mysql://localhost:3306/webmarketdb";
        String user = "root";
        String password = "1234";
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(url,user,password);

    }catch (SQLException ex){
        out.print("데이터 베이스 연결 실패");
        out.print(ex.getMessage());
    }
%>

