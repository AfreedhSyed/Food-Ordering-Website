package com.quickbite.daoimplementation;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.quickbite.dao.RestaurantDAO;
import com.quickbite.model.Restaurant;
import com.quickbite.utility.DBConnection;

public class RestaurantDAOImpl implements RestaurantDAO{
   
	private final String INSERT_RESTAURANT = "INSERT into `restaurant` (`name`, `address`, `phonenumber`, `cusinetype`, `deliverytime`, `admineuserid`, `rating`, `isactive`, `imagepath`) values (?, ?, ?, ? , ? , ? , ? , ? , ?)";
	private final String UPDATE_RESTAURANT = "UPDATE `restaurant` SET `name` = ?, `address` = ?, `phonenumber` = ?, `cusinetype` = ?, `deliverytime` = ?, `admineuserid` = ?, `rating` = ?, `isactive` = ?, `imagepath` = ? WHERE `restaurantid` =?";
	private final String GET_RESTAURANT_BY_ID = "SELECT * from `restaurant` WHERE `restaurantid` = ?";
	private final String GET_ALL_RESTAURANTS = "SELECT * from `restaurant`";
	private final String DELETE_RESTAURANT = "DELETE FROM `restaurant` WHERE `restaurantid` = ?";
	private final String SEARCH_RESTAURANTS = "SELECT * FROM `restaurant` WHERE LOWER(`name`) LIKE ? OR LOWER(`address`) LIKE ? OR LOWER(`cusinetype`) LIKE ?";
	
	@Override
	public void addRestaurant(Restaurant restaurant) {
		try{
			Connection connection = DBConnection.getConnection();
			PreparedStatement prepareStatement = connection.prepareStatement(INSERT_RESTAURANT);
			prepareStatement.setString(1, restaurant.getName());
			prepareStatement.setString(2, restaurant.getAddress());
			prepareStatement.setString(3, restaurant.getPhone());
			prepareStatement.setString(4, restaurant.getCusineType());
			prepareStatement.setString(5, restaurant.getEta());
			prepareStatement.setInt(6, restaurant.getAdminUserId());
			prepareStatement.setString(7, restaurant.getRating());
			prepareStatement.setString(8, restaurant.getActive());
			prepareStatement.setString(9, restaurant.getImagePath());
			int executeUpdate = prepareStatement.executeUpdate();
			
			System.out.println(executeUpdate);
			System.out.println("succesfully add the restaurant to the database.....");
		}
		catch(SQLException e){
			e.printStackTrace();
		}
	}

	@Override
	public void updateRestaurant(Restaurant restaurant) {
		
		try(Connection connection = DBConnection.getConnection();
				PreparedStatement prepareStatement = connection.prepareStatement(UPDATE_RESTAURANT);)
		{
			prepareStatement.setString(1, restaurant.getName());
			prepareStatement.setString(2, restaurant.getAddress());
			prepareStatement.setString(3, restaurant.getPhone());
			prepareStatement.setString(4, restaurant.getCusineType());
			prepareStatement.setString(5, restaurant.getEta());
			prepareStatement.setInt(6, restaurant.getAdminUserId());
			prepareStatement.setString(7, restaurant.getRating());
			prepareStatement.setString(8, restaurant.getActive());
			prepareStatement.setString(9, restaurant.getImagePath());
			prepareStatement.setInt(10, restaurant.getRestaurantId());
			
			int executeUpdate = prepareStatement.executeUpdate();
			
			System.out.println(executeUpdate);
			System.out.println("succesfully update the restaurant in the database.....");
		}
		catch(SQLException e){
			e.printStackTrace();
		}		
	}

	@Override
	public void deleteRestaurant(int restaurantid) {

		try(Connection connection = DBConnection.getConnection();
				PreparedStatement prepareStatement = connection.prepareStatement(DELETE_RESTAURANT);)
		{
			prepareStatement.setInt(1, restaurantid);
			
			int executeUpdate = prepareStatement.executeUpdate();
			
			System.out.println(executeUpdate);
			System.out.println("succesfully delete the restaurant data in the database.....");
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public Restaurant getRestaurantById(int restaurantid) {
		
		Restaurant restaurant = null;
		try(Connection connection = DBConnection.getConnection();
				PreparedStatement prepareStatement = connection.prepareStatement(GET_RESTAURANT_BY_ID);)
		{
			prepareStatement.setInt(1, restaurantid);
			
			ResultSet resultSet = prepareStatement.executeQuery();

			while(resultSet.next()) {
				int id = resultSet.getInt("restaurantid");
				String name = resultSet.getString("name");
				String address = resultSet.getString("address");
				String phonenumber = resultSet.getString("phonenumber");
				String cusinetype = resultSet.getString("cusinetype");
				String deliverytime = resultSet.getString("deliverytime");
				int admineuserid = resultSet.getInt("admineuserid");
				String rating = resultSet.getString("rating");
				String isactive = resultSet.getString("isactive");
				String imagepath = resultSet.getString("imagepath");
				
				restaurant = new Restaurant(id, name, address, phonenumber, cusinetype, deliverytime, isactive, rating, admineuserid, imagepath);
			}
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		
		return restaurant;
		
	}

	@Override
	public List<Restaurant> getAllRestaurants() {
		
		List<Restaurant> restaurants = new ArrayList<Restaurant>();
		try(Connection connection = DBConnection.getConnection();
				PreparedStatement prepareStatement = connection.prepareStatement(GET_ALL_RESTAURANTS);)
		{
			ResultSet resultSet = prepareStatement.executeQuery();

			while(resultSet.next()) {
				int id = resultSet.getInt("restaurantid");
				String name = resultSet.getString("name");
				String address = resultSet.getString("address");
				String phonenumber = resultSet.getString("phonenumber");
				String cusinetype = resultSet.getString("cusinetype");
				String deliverytime = resultSet.getString("deliverytime");
				int admineuserid = resultSet.getInt("admineuserid");
				String rating = resultSet.getString("rating");
				String isactive = resultSet.getString("isactive");
				String imagepath = resultSet.getString("imagepath");
				
				Restaurant restaurant= new Restaurant(id, name, address, phonenumber, cusinetype, deliverytime, isactive, rating, admineuserid, imagepath);
				restaurants.add(restaurant);
			}
			
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		return restaurants;
	}

	@Override
	public List<Restaurant> searchRestaurants(String query) {
		
		List<Restaurant> results = new ArrayList<>();
	    String searchTerm = "%" + query.toLowerCase() + "%";
	    
	    try (Connection connection = DBConnection.getConnection();
	         PreparedStatement prepareStatement = connection.prepareStatement(SEARCH_RESTAURANTS)) {
	        
	        prepareStatement.setString(1, searchTerm);
	        prepareStatement.setString(2, searchTerm);
	        prepareStatement.setString(3, searchTerm);
	        
	        ResultSet res = prepareStatement.executeQuery();

	        while(res.next()) {
	            int id = res.getInt("restaurantid");
	            String name = res.getString("name");
	            String address = res.getString("address");
	            String phonenumber = res.getString("phonenumber");
	            String cusinetype = res.getString("cusinetype");
	            String deliverytime = res.getString("deliverytime");
	            int admineuserid = res.getInt("admineuserid");
	            String rating = res.getString("rating");
	            String isactive = res.getString("isactive");
	            String imagepath = res.getString("imagepath");
	            
	            Restaurant r = new Restaurant(id, name, address, phonenumber, cusinetype, deliverytime, isactive, rating, admineuserid, imagepath);
	            results.add(r);
	        }
	    } catch(SQLException e) {
	        e.printStackTrace();
	    }
		return results;
	}
}