package dao;

import java.util.ArrayList;

public class ProductRepository {
    private ArrayList<Product> listOfProduct = new ArrayList<Product>();
    private static ProductRepository instance = new ProductRepository();

    public static ProductRepository getInstance() {
        return instance;
    }

    public void addProduct(Product product){
        listOfProduct.add(product);
    }

    public ProductRepository() {
        Product phone = new Product("P1234","SM-G996N", 1159010);
        phone.setProductDescription("CPU 속도 : " + "2.9 GHz");
        phone.setProductCategory("Smart-phone");
        phone.setProductManufacturer("samsung");
        phone.setProductInStuck(100);
        phone.setProductCondition("new");
        phone.setFileName("p1234.jpg");

        Product notebook = new Product("P1235","아이뮤즈 2020 스톰북 14.1", 239000);
        notebook.setProductDescription("CPU 속도 : " + "2.9 GHz" );
        notebook.setProductCategory("notebook");
        notebook.setProductManufacturer("아이뮤즈");
        notebook.setProductInStuck(10);
        notebook.setProductCondition("new");
        notebook.setFileName("p1235.jpg");

        Product tablet = new Product("P1236","갤럭시탭 A7 ", 209000);
        tablet.setProductDescription("CPU 속도 : " + "2.9 GHz" );
        tablet.setProductCategory("tablet");
        tablet.setProductManufacturer("samsung");
        tablet.setProductInStuck(18);
        tablet.setProductCondition("new");
        tablet.setFileName("p1236.jpg");

        listOfProduct.add(tablet);
        listOfProduct.add(phone);
        listOfProduct.add(notebook);


    }

    public Product getProductById(String productId){
        Product productbyId = null;

        for(int i =0; i < listOfProduct.size(); i++){
            Product product = listOfProduct.get(i);
            if((product.getProductId() != null) && (product.getProductId().equals(productId))&& product != null) {
                productbyId = product;
                break;
            }
        }

        return productbyId;
    }



    public ArrayList<Product> getListOfProduct() {
        return listOfProduct;
    }
}
