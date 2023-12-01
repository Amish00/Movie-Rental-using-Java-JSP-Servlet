package com.example.vinchirental.Dao;

import com.example.vinchirental.model.Cart;
import com.example.vinchirental.model.Movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MovieDao {
    private Connection con;
    private String query;
    private PreparedStatement pst;
    private ResultSet rs;
    public MovieDao(Connection con){
        this.con = con;
    }
    public List<Movie> getAllMovies(){
        List<Movie> movies = new ArrayList<Movie>();
        try {
            String query = "select * from products order by name asc";
            pst = con.prepareStatement(query);
            rs = pst.executeQuery();
            while (rs.next()){
                Movie row = new Movie();
                row.setId(rs.getInt("id"));
                row.setName(rs.getString("name"));
                row.setCategory(rs.getString("category"));
                row.setPrice(rs.getDouble("price"));
                row.setImage(rs.getString("image"));

                movies.add(row);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return movies;
    }

    public List<Cart> getCartProducts(ArrayList<Cart> cartList) {
        List<Cart> movies = new ArrayList<>();
        try {
            if (cartList.size() > 0) {
                for (Cart item : cartList) {
                    query = "select * from products where id=?";
                    pst = this.con.prepareStatement(query);
                    pst.setInt(1, item.getId());
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        Cart row = new Cart();
                        row.setId(rs.getInt("id"));
                        row.setName(rs.getString("name"));
                        row.setCategory(rs.getString("category"));
                        row.setPrice(rs.getDouble("price"));
                        movies.add(row);
                    }

                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return movies;
    }

    public double getTotalCartPrice(ArrayList<Cart> cartList){
        double sum = 0;
        try{
            if (cartList.size()>0){
                for(Cart item:cartList){
                    query = "select price from products where id=?";
                    pst = this.con.prepareStatement(query);
                    pst.setInt(1,item.getId());
                    rs = pst.executeQuery();
                    while(rs.next()){
                        sum+= rs.getDouble("price");
                    }
                }

            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return sum;
    }

}
