<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.oreilly.servlet.*" %>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@include file="dbConnection.jsp" %>

<%
    String fileName = "";
    String folderPath = "C:\\Users\\Hyunbin\\Hyunebin_webMarket\\web\\resources\\productImage";
    String encType = "utf-8";
    int maxSize = 5 * 1024 * 1024;

    MultipartRequest multipartRequest = new MultipartRequest(request, folderPath, maxSize, encType, new DefaultFileRenamePolicy());



    String productId = multipartRequest.getParameter("productId"); // 제품 코드
    String productName = multipartRequest.getParameter("name"); // 제품 이름
    String productDescription = multipartRequest.getParameter("description");// 제품 설명
    String productManufacturer = multipartRequest.getParameter("manufacturer"); // 제품 제조사
    String productCategory = multipartRequest.getParameter("category"); // 제품 카테고리
    String productCondition = multipartRequest.getParameter("condition");// 제품 상태(중고, 신상)
    String productPrice = multipartRequest.getParameter("unitPrice"); // 제품 가격
    String productInStuck = multipartRequest.getParameter("unitsInStock");// 제품 제고
    Integer price;
    long stuck;

    Enumeration files = multipartRequest.getFileNames();
    String Fname =(String) files.nextElement();
    fileName = multipartRequest.getFilesystemName(Fname);

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
    ResultSet rs = null;

    String sql = "select * from product where p_id=?";
    preparedStatement = connection.prepareStatement(sql);
    preparedStatement.setString(1,productId);
    rs = preparedStatement.executeQuery();

    if(rs.next()){
        if(fileName != null){
            sql = "UPDATE product SET p_name=?, p_unitPrice=?, p_description=?, p_manufacturer=?, p_category=?, p_unitsInStock=?, p_condition=?, p_fileName=? WHERE p_id=?";

            preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1, productName);
            preparedStatement.setInt(2, price);
            preparedStatement.setString(3, productDescription);
            preparedStatement.setString(4, productCategory);
            preparedStatement.setString(5, productManufacturer);
            preparedStatement.setLong(6, stuck);
            preparedStatement.setString(7, productCondition);
            preparedStatement.setString(8, fileName);
            preparedStatement.setString(9, productId);
            preparedStatement.executeUpdate();

        }else{
            sql="UPDATE product SET p_name=?, p_unitPrice=?, p_description=?, p_manufacturer=?, p_category=?, p_unitsInStock=?, p_condition=? WHERE p_id=?";
            preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1, productName);
            preparedStatement.setInt(2, price);
            preparedStatement.setString(3, productDescription);
            preparedStatement.setString(4, productCategory);
            preparedStatement.setString(5, productManufacturer);
            preparedStatement.setLong(6, stuck);
            preparedStatement.setString(7, productCondition);
            preparedStatement.setString(8, productId);
            preparedStatement.executeUpdate();
        }
    }
    if (rs != null)
        rs.close();
    if (preparedStatement != null)
        preparedStatement.close();
    if (connection != null)

        response.sendRedirect("editProduct.jsp?edit=update");
%>