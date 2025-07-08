package com.quickbite.daoimplementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.quickbite.dao.MenuDAO;
import com.quickbite.model.Menu;
import com.quickbite.utility.DBConnection;

public class MenuDAOImpl implements MenuDAO{

	// Ensure the column order here matches the order in which you set values in addMenu/updateMenu
	// It's also good practice for 'ratings' to be before 'imagepath' as per constructor
	private final String INSERT = "INSERT into `menu` (`restaurantid`, `itemname`, `description`, `price`, `isavailable`, `ratings`, `imagepath`) values (?, ?, ?, ?, ?, ?, ?)";
	private final String UPDATE = "UPDATE `menu` SET `restaurantid` = ?, `itemname` = ?, `description` = ?, `price` = ?, `isavailable` = ?, `ratings` = ?, `imagepath` = ? WHERE `menuid` = ?";
	private final String DELETE = "DELETE FROM `menu` WHERE `menuid` = ?";
	private final String GET_MENU_BY_MENU_ID = "SELECT * from `menu` WHERE `menuid` = ?";
	private final String GET_MENU_BY_RESTAURANT_ID = "SELECT * from `menu` WHERE `restaurantid` = ?";
	private final String GET_ALL_MENU = "SELECT * from `menu`";


	@Override
	public void addMenu(Menu menu) {

		try(Connection connection = DBConnection.getConnection();
				PreparedStatement prepareStatement = connection.prepareStatement(INSERT);)
		{
			prepareStatement.setInt(1, menu.getRestaurantId());
			prepareStatement.setString(2, menu.getItemName());
			prepareStatement.setString(3, menu.getDescription());
			prepareStatement.setFloat(4, menu.getPrice()); // Use setFloat
			prepareStatement.setString(5, menu.getAvailable()); // Matches INSERT SQL order for isavailable
			prepareStatement.setFloat(6, menu.getRatings());   // Matches INSERT SQL order for ratings
			prepareStatement.setString(7, menu.getImagePath());

			int i = prepareStatement.executeUpdate();

			System.out.println("Added menu item count: " + i); // More descriptive message
		}
		catch(SQLException e){
			e.printStackTrace();
		}
	}

	@Override
	public void updateMenu(Menu menu) {

		try(Connection connection = DBConnection.getConnection();
				PreparedStatement prepareStatement = connection.prepareStatement(UPDATE);)
		{
			prepareStatement.setInt(1, menu.getRestaurantId());
			prepareStatement.setString(2, menu.getItemName());
			prepareStatement.setString(3, menu.getDescription());
			prepareStatement.setFloat(4, menu.getPrice()); // Use setFloat
			prepareStatement.setString(5, menu.getAvailable());
			prepareStatement.setFloat(6, menu.getRatings()); // Use setFloat
			prepareStatement.setString(7, menu.getImagePath());
			prepareStatement.setInt(8, menu.getMenuId());
			int i = prepareStatement.executeUpdate();

			System.out.println("Updated menu item count: " + i); // More descriptive message
		}
		catch(SQLException e){
			e.printStackTrace();
		}
	}

	@Override
	public void deleteMenu(int menuid) {

		try(Connection connection = DBConnection.getConnection();
				PreparedStatement prepareStatement = connection.prepareStatement(DELETE);)
		{
			prepareStatement.setInt(1, menuid);

			int i = prepareStatement.executeUpdate();

			System.out.println("Deleted menu item count: " + i); // More descriptive message
		}
		catch(SQLException e){
			e.printStackTrace();
		}
	}

	@Override
	public List<Menu> getMenuByRestaurantId(int restaurantid) {

		List<Menu> menu = new ArrayList<Menu>();
		try(Connection connection = DBConnection.getConnection();
				PreparedStatement prepareStatement = connection.prepareStatement(GET_MENU_BY_RESTAURANT_ID);)
		{
			prepareStatement.setInt(1, restaurantid);

			ResultSet res = prepareStatement.executeQuery();

			while(res.next()) {
				int menuid = res.getInt("menuid");
				int id = res.getInt("restaurantid");
				String itemname = res.getString("itemname");
				String description = res.getString("description");
				float price = res.getFloat("price"); // *** CORRECTED: Use getFloat() ***
				String isavailable = res.getString("isavailable");
				float ratings = res.getFloat("ratings");
				String imagepath = res.getString("imagepath");

				Menu m = new Menu(menuid, id, itemname, description, price, ratings, isavailable, imagepath);
				menu.add(m);
			}
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		return menu;
	}

	@Override
	public Menu getMenuById(int menuid) {

		Menu menu = null;
		try(Connection connection = DBConnection.getConnection();
				PreparedStatement prepareStatement = connection.prepareStatement(GET_MENU_BY_MENU_ID);)
		{
			prepareStatement.setInt(1, menuid);

			ResultSet res = prepareStatement.executeQuery();

			while(res.next()) {
				int id = res.getInt("menuid");
				int restaurantid = res.getInt("restaurantid");
				String itemname = res.getString("itemname");
				String description = res.getString("description");
				float price = res.getFloat("price"); // *** CORRECTED: Use getFloat() ***
				String isavailable = res.getString("isavailable");
				float ratings = res.getFloat("ratings");
				String imagepath = res.getString("imagepath");

				menu = new Menu(id, restaurantid, itemname, description, price, ratings, isavailable, imagepath);
			}
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		return menu;
	}

	@Override
	public List<Menu> getAllMenu() {

		List<Menu> menu = new ArrayList<Menu>();
		try(Connection connection = DBConnection.getConnection();
				PreparedStatement prepareStatement = connection.prepareStatement(GET_ALL_MENU);)
		{
			ResultSet res = prepareStatement.executeQuery();

			while(res.next()) {
				int menuid = res.getInt("menuid");
				int restaurantid = res.getInt("restaurantid");
				String itemname = res.getString("itemname");
				String description = res.getString("description");
				float price = res.getFloat("price"); // *** CORRECTED: Use getFloat() ***
				String isavailable = res.getString("isavailable");
				float ratings = res.getFloat("ratings");
				String imagepath = res.getString("imagepath");

				Menu m = new Menu(menuid, restaurantid, itemname,description, price, ratings,isavailable, imagepath);
				menu.add(m);
			}
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		return menu;
	}
}