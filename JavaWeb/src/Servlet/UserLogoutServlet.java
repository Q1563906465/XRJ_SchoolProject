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

@WebServlet(name = "UserLogoutServlet", value = "/UserLogoutServlet")
public class UserLogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        String username = user.getUsername();
        String sql = "delete from user where username = ?;";

        PreparedStatement ps = ConnDB.prepareStatement(sql);
        int result = 0;
        try {
            ps.setString(1,username);
            result = ps.executeUpdate();
            if(result != 0){
                request.setAttribute("message","用户注销成功");
                User userNull = new User("此用户已注销，请先注册","","");
                session.setAttribute("user",userNull);
            } else {
                request.setAttribute("message","用户注销失败");
            }




            request.getRequestDispatcher("/user.jsp").forward(request,response);
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnDB.close();
        }

    }
}