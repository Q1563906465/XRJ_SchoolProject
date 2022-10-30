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

@WebServlet(name = "addCartServlet", value = "/addCartServlet")
public class addCartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String sql = "select * from figure where id=?";

        PreparedStatement ps = ConnDB.prepareStatement(sql);
        ResultSet rs = null;
        try {
            ps.setInt(1,Integer.parseInt(id));
            rs = ps.executeQuery();
            if(rs.next()){
                request.setAttribute("message","商品加入购物车成功");

//            request.setAttribute("username",username);
            } else {
                request.setAttribute("message","商品加入购物车失败");
            }
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("cart");
            if(cart == null)
                cart = new Cart();

            Figure figure = new Figure(rs.getInt("id"),rs.getString("fname"),rs.getString("price"),rs.getString("img"));
            cart.add(figure);

            session.setAttribute("cart",cart);

            request.getRequestDispatcher("/cart.jsp").forward(request,response);
            rs.close();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnDB.close();
        }

    }
}