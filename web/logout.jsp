<%--
  Created by IntelliJ IDEA.
  User: Hyunbin
  Date: 2021-09-25
  Time: 오후 2:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    session.invalidate();
    response.sendRedirect("addProduct.jsp");
%>
