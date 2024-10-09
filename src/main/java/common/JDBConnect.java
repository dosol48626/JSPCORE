package common;

import jakarta.servlet.Servlet;
import jakarta.servlet.ServletContext;

import java.sql.*;

public class JDBConnect {
    public Connection con;
    public Statement st;
    public ResultSet rs;
    public PreparedStatement pst;

    public JDBConnect() {
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            String url = "jdbc:oracle:thin:@localhost:1521:xe";
            String id = "dosol_jsp";
            String pwd = "1234";
            con = DriverManager.getConnection(url, id, pwd);
            System.out.println("oracle connection successful");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public JDBConnect(String str) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url="jdbc:mysql://localhost:3306/dosol";
            String id="dosol";
            String pwd="1234";
            con= DriverManager.getConnection(url,id,pwd);
            System.out.println("MySQL DB 연결 성공");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void close(){
        try{
            if(con != null) con.close();
            if(st != null) st.close();
            if(rs != null) rs.close();
            if(pst != null) pst.close();
            System.out.println("oracle connection closed");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public JDBConnect(String driver, String url, String id, String pwd) {
        try{
            Class.forName(driver);
            con = DriverManager.getConnection(url, id, pwd);
            System.out.println("DB Connection successful(인수 생성장 1)");
        }catch (Exception e) {
            e.printStackTrace();
        }
    }
    public JDBConnect(ServletContext application){
        try{
            String driver = application.getInitParameter("OracleDriver");
            Class.forName(driver);

            String url = application.getInitParameter("OracleURL");
            String id = application.getInitParameter("OracleId");
            String pwd = application.getInitParameter("OraclePwd");
            con = DriverManager.getConnection(url, id, pwd);

            System.out.println("DB Connection successful(인수 생성자 2)");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
