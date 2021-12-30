<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.Product" %>
<%@ page import="java.sql.*" %>
<%@ page import="dao.ProductRepository" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id = "productDAO" class="dao.ProductRepository" scope="application"/>

<html>
<head>
    <link rel="stylesheet"
          href="./resources/css/bootstrap.min.css">
    <title>상품 목록</title>
</head>
<body>
    <jsp:include page="menu.jsp"/>
    <div class="jumbotron">
        <div class="container">
            <h1 class="display-3">상품목록</h1>
        </div>
    </div>

    <div class="container">
        <div class="row" align="center">
            <%@ include file="dbConnection.jsp"%>
            <%
                PreparedStatement preparedStatement = null;
                ResultSet rs = null;
                String sql = "select * from product";
                preparedStatement = connection.prepareStatement(sql);
                rs = preparedStatement.executeQuery();
                while (rs.next()){
            %>

            <div class="col-md-4 ">
                <img src="resources/productImage/<%=rs.getString("p_fileName")%>" style="width: 70%">
                <h3><%=rs.getString("p_name")%></h3>
                <p><%=rs.getString("p_description")%></p>
                <p><%=rs.getString("p_unitPrice")%>원</p>
                <p><a href="productDetail.jsp?id=<%=rs.getString("p_id")%>" class="btn btn-secondary" role="button">상세 정보 &raquo</a></p>
            </div>

            <%
                }

                if (rs != null)
                rs.close();
                if (preparedStatement != null)
                    preparedStatement.close();
                if (connection != null)
                    connection.close();
            %>

        </div>
        </hr>

    </div>

    <jsp:include page="footer.jsp"/>
</body>


</html>
