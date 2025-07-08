package com.quickbite.model;

import java.util.HashMap;

public class Cart {
	private HashMap<Integer, CartItem> items; // map is key and value pair.
	
	public Cart() {
		this.items = new HashMap<>();
	}
	
	public HashMap<Integer, CartItem> getItems() {
		return items;
	}

	public void setItems(HashMap<Integer, CartItem> items) {
		this.items = items;
	}

    public double getGrandTotal() {
        double total = 0;
        for (CartItem item : items.values()) {
            total += item.getTotalprice();
        }
        return total;
    }
}
