<%@ page import="dao.ProductRepository" %>
<%@ page import="dao.Product" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.Enumeration" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@include file="dbConnection.jsp"%>
<%
    request.setCharacterEncoding("UTF-8");
    String fileName = "";
    MultipartRequest multipartRequest = new MultipartRequest(request, "C:\\Users\\Hyunbin\\Hyunebin_webMarket\\web\\resources\\productImage", 5 * 1024 *1024, "utf-8", new DefaultFileRenamePolicy());
    Enumeration files = multipartRequest.getFileNames();
    String Fname =(String) files.nextElement();
    fileName = multipartRequest.getFilesystemName(Fname);

     String productId = multipartRequest.getParameter("productId"); // 제품 코드
     String productName = multipartRequest.getParameter("productName"); // 제품 이름
     String productDescription = multipartRequest.getParameter("productDescription");// 제품 설명
     String productManufacturer = multipartRequest.getParameter("productManufacturer"); // 제품 제조사
     String productCategory = multipartRequest.getParameter("productCategory"); // 제품 카테고리
     String productCondition = multipartRequest.getParameter("productCondition");// 제품 상태(중고, 신상)
     String productPrice = multipartRequest.getParameter("productPrice"); // 제품 가격
     String productInStuck = multipartRequest.getParameter("productInStuck");// 제품 제고

    Integer price;
    long stuck;

    if(productPrice.isEmpty()){
        price = 0;
    }else{
        price = Integer.parseInt(productPrice);
    }

    if(productInStuck.isEmpty()){
        stuck =0;
    }else{
        stuck = Long.valueOf(productInStuck);
    }

   PreparedStatement preparedStatement = null;
    String sql = "insert into product values(?,?,?,?,?,?,?,?,?)";
    preparedStatement = connection.prepareStatement(sql);

    preparedStatement.setString(1,productId);
    preparedStatement.setString(2,productName);
    preparedStatement.setInt(3,price);
    preparedStatement.setString(4,productDescription);
    preparedStatement.setString(5,productCategory);
    preparedStatement.setString(6,productManufacturer);
    preparedStatement.setLong(7,stuck);
    preparedStatement.setString(8,productCondition);
    preparedStatement.setString(9,fileName);
    preparedStatement.executeUpdate();

    if(preparedStatement != null){
        preparedStatement.close();
    }

    if(connection != null){
        connection.close();
    }

    response.sendRedirect("products.jsp");

%>
