<%--
  Created by IntelliJ IDEA.
  User: Hyunbin
  Date: 2021-09-04
  Time: 오후 9:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <link rel="stylesheet"
          href="./resources/css/bootstrap.min.css">
    <script type="text/javascript" src="./resources/js/validation.js"></script>
    <title>상품 등록</title>
</head>
<body>
    <jsp:include page="menu.jsp"/>
    <div class="jumbotron">
        <div class="container">
            <h1 class="display-3">상품 등록</h1>
        </div>
    </div>

    <div class="container">
        <div class="text-right">
            <a href="logout.jsp" class="btn btn-sm btn-success pull-right">logout</a>
        </div>
        <form name="newProduct" action ="./processAddProduct.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
            <div class="form-group row">
                <label class="col-sm-2">상품 코드</label>
                <div class="col-sm-3">
                    <input type = "text" id="productId" name="productId" class="form-control">
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2">상품명</label>
                <div class="col-sm-3">
                    <input type = "text" id="productName" name="productName" class="form-control">
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2">가격</label>
                <div class="col-sm-3">
                    <input type = "text" id="productPrice" name="productPrice" class="form-control">
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2">상세 정보</label>
                <div class="col-sm-5">
                    <textarea name="productDescription" cols="50" rows="2" class="form-control"></textarea>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2">제조사</label>
                <div class="col-sm-3">
                    <input type = "text" name="productManufacturer" class="form-control">
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2">분류</label>
                <div class="col-sm-3">
                    <input type = "text" name="productCategory" class="form-control">
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2">재고 수</label>
                <div class="col-sm-3">
                    <input type = "text" id="productInStuck" name="productInStuck" class="form-control">
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2">상태</label>
                <div class="col-sm-5">
                    <input type = "radio" name="productCondition" value="New">신규 제품
                    <input type = "radio" name="productCondition" value="Old">중고 제품
                    <input type = "radio" name="productCondition" value="Recycle">재활용 제품
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2">이미지</label>
                <div class="col-sm-5">
                    <input type = "file" name="productImage" class="form-control">
                </div>
            </div>

            <div class="form-group row">
                <div class="col-sm-offset-2 col-sm-10">
                    <input type="submit" class="btn btn-primary" value="등록" onclick="CheckAddProduction()">
                </div>
            </div>
        </form>
    </div>


</body>
</html>
