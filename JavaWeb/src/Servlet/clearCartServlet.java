package Servlet;

import Dao.ConnDB;
import Entity.Cart;
import Entity.Figure;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "clearCartServlet", value = "/clearCartServlet")
public class clearCartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("cart");
            if(cart == null)
                cart = new Cart();
            cart.clear();

            session.setAttribute("cart",cart);

            request.getRequestDispatcher("/cart.jsp").forward(request,response);

    }
}