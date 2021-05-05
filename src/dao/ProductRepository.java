package dao;

import java.util.ArrayList;

import cart.Goods;
import dto.Product;

public class ProductRepository {

	private ArrayList<Product> listOfProducts = new ArrayList<Product>();
	private static ProductRepository instance = new ProductRepository();

	public static ProductRepository getInstance(){
		return instance;
	} 
 

	public ProductRepository() {
		Product SeasonalEspresso = new Product("No.1", "시즈널 에스프레소", 15000);
		SeasonalEspresso.setNotice("ROASTED ON: 2021.06.11");
		SeasonalEspresso.setCoffee("Seasonal Espresso");
		SeasonalEspresso.setDescription("Fruity, Stone fruits, Caramel, Balance, Silky");
		SeasonalEspresso.setGram(200);
		SeasonalEspresso.setImage("images/item1.jpg");

		Product ClassicEspresso = new Product("No.2", "클래식 에스프레소", 13000);
		ClassicEspresso.setNotice("ROASTED ON: 2021.06.09");
		ClassicEspresso.setCoffee("ClassicEspresso");
		ClassicEspresso.setDescription("Chocolate, Almond, Round mouthfeel, Balance");
		ClassicEspresso.setGram(200);
		ClassicEspresso.setImage("images/item2.jpg");
		
		Product ClassicEspressoP = new Product("No.3", "클래식 에스프레소 플러스", 15000);
		ClassicEspressoP.setNotice("ROASTED ON: 2021.06.17");
		ClassicEspressoP.setCoffee("Classic Espresso+");
		ClassicEspressoP.setDescription("Dark chocolate, Cacao, Almond, Heavy body");
		ClassicEspressoP.setGram(200);
		ClassicEspressoP.setImage("images/item3.jpg");

		listOfProducts.add(SeasonalEspresso);
		listOfProducts.add(ClassicEspresso);
		listOfProducts.add(ClassicEspressoP);
	}

	public ArrayList<Product> getAllProducts() {
		return listOfProducts;
	}
	
	public ArrayList<Product> getProductsList(){
		ArrayList<Product> ProductsList = new ArrayList<Product>();
		ProductsList.add(new Product("No.1","시즈널 에스프레소",15000));
		ProductsList.add(new Product("No.2","클래식 에스프레소",13000));
		ProductsList.add(new Product("No.3","클래식 에스프레소 플러스",15000));
		return ProductsList;
	}
	
	
	
	
	public Product getProductById(String productId) {
		Product productById = null;

		for (int i = 0; i < listOfProducts.size(); i++) {
			Product product = listOfProducts.get(i);
			if (product != null && product.getProductId() != null && product.getProductId().equals(productId)) {
				productById = product;
				break;
			}
		}
		return productById;
	}
	
	public void addProduct(Product product) {
		listOfProducts.add(product);
	}
}
