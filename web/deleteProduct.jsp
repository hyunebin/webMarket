<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<%@ include file="dbConnection.jsp"%>
<%
  String productId = request.getParameter("id");
  PreparedStatement preparedStatement = null;
  ResultSet rs = null;

  String sql = "select * from product";
  preparedStatement = connection.prepareStatement(sql);
  rs = preparedStatement.executeQuery();

  if (rs.next()) {
    sql = "delete from product where p_id = ?";
    preparedStatement = connection.prepareStatement(sql);
    preparedStatement.setString(1, productId);
    preparedStatement.executeUpdate();
  } else
    out.println("일치하는 상품이 없습니다");

  if (rs != null)
    rs.close();
  if (preparedStatement != null)
    preparedStatement.close();
  if (connection != null)
    connection.close();

  response.sendRedirect("editProduct.jsp?edit=delete");
%>
