<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.Product" %><%--
  Created by IntelliJ IDEA.
  User: Hyunbin
  Date: 2021-10-03
  Time: 오후 3:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="./resources/css/bootstrap.min.css">
    <title>장바구니</title>

    <% String cartId = session.getId(); %>
</head>
<body>

    <jsp:include page="menu.jsp"/>
    <div class = "jumbotron">
        <div class="container">
            <h1 class="display-3">장바구니</h1>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <table width="100%">
                <tr>
                    <td align="left"><a href="./deleteCart.jsp?cartId<%=cartId%>" class="btn btn-danger">삭제하기</a></td>
                    <td align="right"><a href="./shippingInfo.jsp?cartId=<%=cartId%>" class="btn btn-success">주문하기</a></td>
                </tr>
            </table>
        </div>
        <div style="padding-top: 50px">
            <table class="table table-hover">
                <tr>
                    <th>상품</th>
                    <th>가격</th>
                    <th>수랑</th>
                    <th>소계</th>
                    <th>비고</th>
                </tr>
                <%
                    int sum = 0;
                    ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartlist");

                    if(cartList == null){
                        cartList = new ArrayList<Product>();
                    }

                    for (int i =0; i < cartList.size(); i++){
                        Product product = cartList.get(i);
                        int total = product.getProductPrice() * product.getQuantity();
                        sum = sum + total;

                %>

                <tr>
                    <td><%=product.getProductId()%> - <%=product.getProductName()%></td>
                    <td><%=product.getProductPrice()%></td>
                    <td><%=product.getQuantity()%></td>
                    <td><%=total%></td>
                    <td><a href="./removeCart.jsp?id=<%=product.getProductId()%>"class="btn btn-danger">삭제</a></td>
                </tr>
                <%
                    }
                %>
                <tr>
                    <th></th>
                    <th></th>
                    <th>총액</th>
                    <th><%=sum%></th>
                </tr>
            </table>
            <a href="./products.jsp" class="btn btn-secondary">&laquo; 홈으로</a>
        </div>
        <hr>
    </div>
    <jsp:include page="footer.jsp"/>

</body>
</html>
