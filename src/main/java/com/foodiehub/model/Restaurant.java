package com.foodiehub.model;

public class Restaurant {

    private int restaurantId;
    private String restaurantName;
    private String cuisineType;
    private String address;
    private double rating;
    private int deliveryTime;
    private String imageUrl;
    private boolean active;
    private String phoneNumber;
    private String openingTime;
    private String closingTime;

    // Default Constructor
    public Restaurant() {

    }

    // Parameterized Constructor
    public Restaurant(int restaurantId, String restaurantName, String cuisineType,
                      String address, double rating, int deliveryTime,
                      String imageUrl, boolean active, String phoneNumber,
                      String openingTime, String closingTime) {

        this.restaurantId = restaurantId;
        this.restaurantName = restaurantName;
        this.cuisineType = cuisineType;
        this.address = address;
        this.rating = rating;
        this.deliveryTime = deliveryTime;
        this.imageUrl = imageUrl;
        this.active = active;
        this.phoneNumber = phoneNumber;
        this.openingTime = openingTime;
        this.closingTime = closingTime;
    }

    // Getters and Setters

    public int getRestaurantId() {
        return restaurantId;
    }

    public void setRestaurantId(int restaurantId) {
        this.restaurantId = restaurantId;
    }

    public String getRestaurantName() {
        return restaurantName;
    }

    public void setRestaurantName(String restaurantName) {
        this.restaurantName = restaurantName;
    }

    public String getCuisineType() {
        return cuisineType;
    }

    public void setCuisineType(String cuisineType) {
        this.cuisineType = cuisineType;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public int getDeliveryTime() {
        return deliveryTime;
    }

    public void setDeliveryTime(int deliveryTime) {
        this.deliveryTime = deliveryTime;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getOpeningTime() {
        return openingTime;
    }

    public void setOpeningTime(String openingTime) {
        this.openingTime = openingTime;
    }

    public String getClosingTime() {
        return closingTime;
    }

    public void setClosingTime(String closingTime) {
        this.closingTime = closingTime;
    }

    @Override
    public String toString() {
        return "Restaurant [restaurantId=" + restaurantId +
                ", restaurantName=" + restaurantName +
                ", cuisineType=" + cuisineType +
                ", address=" + address +
                ", rating=" + rating +
                ", deliveryTime=" + deliveryTime +
                ", imageUrl=" + imageUrl +
                ", active=" + active +
                ", phoneNumber=" + phoneNumber +
                ", openingTime=" + openingTime +
                ", closingTime=" + closingTime + "]";
    }
}