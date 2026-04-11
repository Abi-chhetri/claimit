package com.claimit.model;

public class ItemImage {

    private int itemImageId;
    private int itemId;
    private String imagePath;

    //Noargs Constructors
    public ItemImage() {
    }

    //parameterized Constructor
    public ItemImage(int itemImageId, int itemId, String imagePath) {
        this.itemImageId = itemImageId;
        this.itemId = itemId;
        this.imagePath = imagePath;
    }

    // Getters and Setters

    public int getItemImageId() {
        return itemImageId;
    }

    public void setItemImageId(int itemImageId) {
        this.itemImageId = itemImageId;
    }

    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }
}