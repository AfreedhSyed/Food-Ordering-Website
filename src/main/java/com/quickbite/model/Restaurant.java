package com.quickbite.model;



public class Restaurant {
	private int restaurantId;
	private String name;
	private String address;
	private String phone;
	private String rating;
	private String cusineType;
	private String isActive;
	private String eta;
	private int adminUserId;
	private String imagePath;
	
	public Restaurant() {
		
	}

	public Restaurant(int restaurantId, String name, String address, String phone, String cusineType,
			String eta, String isActive, String rating, int adminUserId, String imagePath) {
		super();
		this.restaurantId = restaurantId;
		this.name = name;
		this.address = address;
		this.phone = phone;
		this.cusineType = cusineType;
		this.eta = eta;
		this.isActive = isActive;
		this.rating = rating;
		this.adminUserId = adminUserId;
		this.imagePath = imagePath;
	}

	public int getRestaurantId() {
		return restaurantId;
	}

	public void setRestaurantId(int restaurantId) {
		this.restaurantId = restaurantId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getRating() {
		return rating;
	}

	public void setRating(String rating) {
		this.rating = rating;
	}

	public String getCusineType() {
		return cusineType;
	}

	public void setCusineType(String cusineType) {
		this.cusineType = cusineType;
	}

	public String getActive() {
		return isActive;
	}

	public void setActive(String isActive) {
		this.isActive = isActive;
	}

	public String getEta() {
		return eta;
	}

	public void setEta(String eta) {
		this.eta = eta;
	}

	public int getAdminUserId() {
		return adminUserId;
	}

	public void setAdminUserId(int adminUserId) {
		this.adminUserId = adminUserId;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	
	
	
}
