package Servlet;


import Entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


@WebServlet(name = "UserExitServlet", value = "/UserExitServlet")
public class UserExitServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = new User("用户已退出登录，请重新登录","","");
        session.setAttribute("user",user);


        request.getRequestDispatcher("/user.jsp").forward(request,response);
    }
}