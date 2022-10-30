package Servlet;

import Dao.ConnDB;
import Entity.User;

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

@WebServlet(name = "UserLoginServlet", value = "/UserLoginServlet")
public class UserLoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String sql = "select * from user where username=? and password=?";

        PreparedStatement ps = ConnDB.prepareStatement(sql);
        ResultSet rs = null;
        try {
            ps.setString(1,username);
            ps.setString(2,password);
            rs = ps.executeQuery();
            if(rs.next()){
                request.setAttribute("message","用户登录成功");
//            request.setAttribute("username",username);
            } else {
                request.setAttribute("message","用户登录失败");
                request.getRequestDispatcher("/info.jsp").forward(request,response);
            }

            HttpSession session = request.getSession();
            User user = new User(rs.getString("username"),rs.getString("password"),rs.getString("phone"));
            session.setAttribute("user",user);

            request.getRequestDispatcher("/user.jsp").forward(request,response);
            rs.close();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnDB.close();
        }

    }
}