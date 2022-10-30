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

@WebServlet(name = "FigureDetailServlet", value = "/FigureDetailServlet")
public class FigureDetailServlet extends HttpServlet {
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
                Figure figure = new Figure(rs.getInt("id"),rs.getString("fname"),rs.getString("price"),rs.getString("img"),rs.getString("story"));
                request.setAttribute("detail",figure);
            } else {
                request.setAttribute("message","商品查看失败");
            }

            request.getRequestDispatcher("/detail.jsp").forward(request,response);
            rs.close();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnDB.close();
        }

    }
}