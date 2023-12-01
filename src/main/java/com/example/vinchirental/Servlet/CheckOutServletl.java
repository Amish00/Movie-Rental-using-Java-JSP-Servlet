package com.example.vinchirental.Servlet;




import com.example.vinchirental.Dao.RentalDao;
import com.example.vinchirental.connection.DbCon;
import com.example.vinchirental.model.Cart;
import com.example.vinchirental.model.Rental;
import com.example.vinchirental.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

@WebServlet(name = "CheckOutServletl", value = "/CheckOut")
public class CheckOutServletl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {

            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date date = new Date();



            ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
            User auth = (User) request.getSession().getAttribute("auth");

            if (cart_list != null && auth != null) {
                for (Cart c : cart_list) {
                    Rental rental = new Rental();
                    rental.setId(c.getId());
                    rental.setCustomerid(auth.getId());
                    rental.setPrice(c.getPrice() != null ? c.getPrice() : 500.0);
                    rental.setBorrowDate(formatter.format(date));

                    RentalDao rDao = new RentalDao(DbCon.getConnection());
                    boolean result = rDao.insertRental(rental);
                    if (!result) break;
                }
                cart_list.clear();
                response.sendRedirect("Payment.jsp");
            } else {
                if (auth == null) response.sendRedirect("movies.jsp");
                response.sendRedirect("cart.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}