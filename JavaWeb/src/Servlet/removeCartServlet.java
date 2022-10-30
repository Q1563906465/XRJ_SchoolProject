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

@WebServlet(name = "removeCartServlet", value = "/removeCartServlet")
public class removeCartServlet extends HttpServlet {
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
                request.setAttribute("message","商品从购物车删除成功");

//            request.setAttribute("username",username);
            } else {
                request.setAttribute("message","商品从购物车删除失败");
            }
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("cart");
            if(cart == null)
                cart = new Cart();

            Figure figure = new Figure(rs.getInt("id"),rs.getString("fname"),rs.getString("price"),rs.getString("img"));
            //在购物车中寻找商品，如果有返回购物车中的商品，没有则返回传过去的figure对象
            figure = cart.search(figure);

            cart.remove(figure);

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
