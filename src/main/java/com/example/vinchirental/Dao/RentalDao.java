package com.example.vinchirental.Dao;


import com.example.vinchirental.model.Rental;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class RentalDao {
        private Connection con;
        private String query;
        private PreparedStatement pst;
        private ResultSet rs;

    public RentalDao(Connection con) {
        this.con = con;
    }

    public boolean insertRental(Rental model){
        boolean result = false;

        try{
            query = "insert into rentals (movie_id, user_id, price, borrowDate) values (?,?,?,?)";
            pst = this.con.prepareStatement(query);
            pst.setInt(1,model.getId());
            pst.setInt(2,model.getCustomerid());
            pst.setDouble(3,model.getPrice());
            pst.setString(4,model.getBorrowDate());
            pst.executeUpdate();
            result = true;

        }catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }
}
