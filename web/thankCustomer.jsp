<%@ page import="java.net.URLDecoder" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="resources/css/bootstrap.min.css">
    <title>주문완료</title>
</head>
<body>
    <%
        String Shipping_cartId="";
        String Shipping_name="";
        String Shipping_shippingDate="";
        String Shipping_country="";
        String Shipping_zipCode="";
        String Shipping_addressName="";

        Cookie[] cookies = request.getCookies();

        if(cookies !=null){
            for(int i = 0; i < cookies.length; i++){
                Cookie thisCookie = cookies[i];
                String n = thisCookie.getName();
                if(n.equals("Shipping_cartId")){
                    Shipping_cartId = URLDecoder.decode((thisCookie.getValue()), "utf-8");
                }
                if(n.equals("Shipping_name")){
                    Shipping_name = URLDecoder.decode((thisCookie.getValue()), "utf-8");
                }
            }
        }
    %>


    <jsp:include page="menu.jsp"/>
    <div class="jumbotron">
        <div class="container">
            <h1 class="display-3">주문 완료</h1>
        </div>
    </div>

    <div class="container">
        <h2 class="alert-info alert-danger">주문해주셔서 감사합니다.</h2>
        <p> 주문은 <%out.println(Shipping_shippingDate);%>에 배송될 예정입니다.
        <p>주문번호:<%out.println(Shipping_cartId);%></p>
    </div>

    <div class="container">
        <p><a href="./products.jsp" class="btn btn-secondary"> &laquo; 상품목록</a></p>
    </div>
</body>
</html>

<%
    session.invalidate();


        for(int i=0; i < cookies.length; i++){
            Cookie thisCookie = cookies[i];
            String n = thisCookie.getName();
            if(n.equals("Shipping_cartId")){
                thisCookie.setMaxAge(0);
            }
            if(n.equals("Shipping_name")){
                thisCookie.setMaxAge(0);
            }
            if(n.equals("Shipping_shippingDate")){
                thisCookie.setMaxAge(0);
            }
            if(n.equals("Shipping_country")){
                thisCookie.setMaxAge(0);
            }
            if(n.equals("Shipping_zipCode")){
                thisCookie.setMaxAge(0);
            }
            if(n.equals("Shipping_addressName")){
                thisCookie.setMaxAge(0);
            }
            response.addCookie(thisCookie);
        }



%>
