package Dao;

import java.sql.*;
import java.io.*;
import java.util.*;

public class ConnDB {
    public static Connection conn = null;
    public static Statement stmt = null;
    public static PreparedStatement ps = null;
    public static ResultSet rs = null;

    /*"com.mysql.jdbc.Driver"*/
    private static String dbDriver = "com.mysql.cj.jdbc.Driver";
    private static String dbUrl = "jdbc:mysql://localhost:3306/xrj?useUnicode=true&characterEncoding=utf8";
    private static String dbUser = "root";
    private static String dbPwd = "root";

    //打开数据库连接
    public static Connection getConnection(){
        Connection conn = null;
        try{
            Class.forName(dbDriver);
            conn = DriverManager.getConnection(dbUrl,dbUser,dbPwd);
        }catch (Exception e){
            e.printStackTrace();
        }
        if(null == conn){
            System.err.println("警告：数据库连接失败！");
        }
        return conn;
    }

    //创建语句
    public static PreparedStatement prepareStatement(String sql){
        try{
            conn = ConnDB.getConnection();
            ps = conn.prepareStatement(sql);
        }catch (SQLException e){
            e.printStackTrace();
        }
        return ps;
    }
    //查询数据
    public ResultSet doQuery(String sql){
        try{
            conn = ConnDB.getConnection();
            stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
            rs = stmt.executeQuery(sql);

        }catch (SQLException e){
            e.printStackTrace();
        }
        return rs;
    }

    //更新数据
    public int doUpdata(String sql){
        int result = 0;
        try{
            conn = ConnDB.getConnection();
            stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
            result = stmt.executeUpdate(sql);
        }catch (SQLException e){
            result = 0;
        }
        return result;
    }

    //关闭数据库连接
    public static void close(){
        try{
            if(rs != null){
                rs.close();
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        try{
            if(ps != null){
                ps.close();
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        try{
            if(stmt != null){
                stmt.close();
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        try{
            if(conn != null){
                conn.close();
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }


}
