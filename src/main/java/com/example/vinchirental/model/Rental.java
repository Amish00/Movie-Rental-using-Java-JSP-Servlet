package com.example.vinchirental.model;

public class Rental extends Movie{
private int rentalid;
private int movieid;
private int customerid;
private Double price;
private String BorrowDate;
private String ReturnDate;

    public Rental() {
    }

    public Rental(int rentalid, int movieid, int customerid, Double price, String borrowDate, String returnDate) {
        this.rentalid = rentalid;
        this.movieid = movieid;
        this.customerid = customerid;
        this.price = price;
        BorrowDate = borrowDate;
        ReturnDate = returnDate;
    }

    public Rental(int id, String name, String category, Double price, String image, int rentalid, int movieid, int customerid, Double price1, String borrowDate, String returnDate) {
        super(id, name, category, price, image);
        this.rentalid = rentalid;
        this.movieid = movieid;
        this.customerid = customerid;
        this.price = price1;
        BorrowDate = borrowDate;
        ReturnDate = returnDate;
    }

    public int getRentalid() {
        return rentalid;
    }

    public void setRentalid(int rentalid) {
        this.rentalid = rentalid;
    }

    public int getMovieid() {
        return movieid;
    }

    public void setMovieid(int movieid) {
        this.movieid = movieid;
    }

    public int getCustomerid() {
        return customerid;
    }

    public void setCustomerid(int customerid) {
        this.customerid = customerid;
    }

    @Override
    public Double getPrice() {
        return price != null ? price : 0.0;
    }

    @Override
    public void setPrice(Double price) {
        this.price = price;
    }

    public String getBorrowDate() {
        return BorrowDate;
    }

    public void setBorrowDate(String borrowDate) {
        BorrowDate = borrowDate;
    }

    public String getReturnDate() {
        return ReturnDate;
    }

    public void setReturnDate(String returnDate) {
        ReturnDate = returnDate;
    }

    @Override
    public String toString() {
        return "Rental{" +
                "rentalid=" + rentalid +
                ", movieid=" + movieid +
                ", customerid=" + customerid +
                ", price=" + price +
                ", BorrowDate='" + BorrowDate + '\'' +
                ", ReturnDate='" + ReturnDate + '\'' +
                '}';
    }
}
