package Dao;

import java.sql.*;

public class DButils {
    public static String dbDriver = "com.mysql.cj.jdbc.Driver";
    public static String dbUrl = "jdbc:mysql://localhost:3306/xrj?useUnicode=true&characterEncoding=utf8";
    public static String dbUser = "root";
    public static String dbPwd = "root";
    private DButils(){}
    static{
        try {
            Class.forName(dbDriver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(dbUrl, dbUser, dbPwd);
    }
    public static void close(Connection conn, Statement stmt, ResultSet rs){
        if (rs == null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (stmt == null) {
            try {
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (conn == null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
