<%@page contentType="text/html; charset=utf-8" %>
<%
    String id = request.getParameter("cartId");

    if(id == null || id.trim().equals("")){
        response.sendRedirect("products.jsp");
        return;
    }

    session.invalidate();

    response.sendRedirect("cart.jsp");
%>