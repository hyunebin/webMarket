<%@ page import="dao.ProductRepository" %>
<%@ page import="dao.Product" %>
<%@ page import="java.util.ArrayList" %><%
    String id = request.getParameter("id");

    if(id == null || id.trim().equals("")){
        response.sendRedirect("products.jsp");
        return;
    }

    ProductRepository dao = ProductRepository.getInstance();

    Product product = dao.getProductById(id);

    if(product == null){
        response.sendRedirect("exceptionNoProductid.jsp");
    }

    ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartlist");
    Product goodQnt = new Product();

    for (int i =0; i< cartList.size(); i++){
        goodQnt = cartList.get(i);
        if(goodQnt.getProductId().equals(id)){
            cartList.remove(goodQnt);
        }
    }

    response.sendRedirect("cart.jsp");
%>