package com.foodiehub.model;

import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;

public class Cart {

    private Map<Integer, CartItem> items;

    public Cart() {
        items = new LinkedHashMap<>();
    }

    // Add Item
    public void addItem(CartItem item) {

        if (items.containsKey(item.getMenuId())) {

            CartItem existingItem = items.get(item.getMenuId());

            existingItem.setQuantity(existingItem.getQuantity() + 1);

        } else {

            items.put(item.getMenuId(), item);
        }
    }

    // Update Quantity
    public void updateItem(int menuId, int quantity) {

        if (items.containsKey(menuId)) {

            if (quantity <= 0) {

                items.remove(menuId);

            } else {

                items.get(menuId).setQuantity(quantity);
            }
        }
    }

    // Remove Item
    public void removeItem(int menuId) {

        items.remove(menuId);
    }

    // Get All Items
    public Collection<CartItem> getItems() {

        return items.values();
    }

    // Get Total Price
    public double getTotalPrice() {

        double total = 0;

        for (CartItem item : items.values()) {

            total += item.getTotalPrice();
        }

        return total;
    }

    // Get Total Items
    public int getTotalItems() {

        int count = 0;

        for (CartItem item : items.values()) {

            count += item.getQuantity();
        }

        return count;
    }

    // Clear Cart
    public void clearCart() {

        items.clear();
    }

    // Check Empty
    public boolean isEmpty() {

        return items.isEmpty();
    }
}