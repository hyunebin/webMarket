package dao;

import java.io.Serializable;

public class Product implements Serializable {
    private static final long serialUid = -4274700572038677000L;
    private String productId; // 제품 코드
    private String productName; // 제품 이름
    private String productDescription;// 제품 설명
    private String productManufacturer; // 제품 제조사
    private String productCategory; // 제품 카테고리
    private String productCondition;// 제품 상태(중고, 신상)
    private Integer productPrice; // 제품 가격
    private long productInStuck;// 제품 제고
    private String fileName; //상품 이미지
    private int quantity; // 장바구니에 담은 갯수



    public Product(){

    }

    public Product(String productId, String productName, Integer productPrice) {
        this.productId = productId;
        this.productName = productName;
        this.productPrice = productPrice;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public String getProductManufacturer() {
        return productManufacturer;
    }

    public void setProductManufacturer(String productManufacturer) {
        this.productManufacturer = productManufacturer;
    }

    public String getProductCategory() {
        return productCategory;
    }

    public void setProductCategory(String productCategory) {
        this.productCategory = productCategory;
    }

    public String getProductCondition() {
        return productCondition;
    }

    public void setProductCondition(String productCondition) {
        this.productCondition = productCondition;
    }

    public Integer getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(Integer productPrice) {
        this.productPrice = productPrice;
    }

    public long getProductInStuck() {
        return productInStuck;
    }

    public void setProductInStuck(long productInStuck) {
        this.productInStuck = productInStuck;
    }

    public String getFileName() { return fileName; }

    public void setFileName(String fileName) { this.fileName = fileName; }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
