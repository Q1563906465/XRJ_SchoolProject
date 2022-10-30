package Servlet;

import Dao.ConnDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "UserSignServlet", value = "/UserSignServlet")
public class UserSignServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String sql = "insert into user (username, password,phone) values (?,?,?);";

        PreparedStatement ps = ConnDB.prepareStatement(sql);
        int result = 0;
        try {
            ps.setString(1,username);
            ps.setString(2,password);
            ps.setString(3,phone);
            result = ps.executeUpdate();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnDB.close();
        }
        if(result == 1){
            request.setAttribute("message","用户注册成功");
            /*request.setAttribute("username",username);
            request.setAttribute("password",password);*/
        } else {
            request.setAttribute("message","用户注册失败");
        }
        request.getRequestDispatcher("/info.jsp").forward(request,response);
    }
}