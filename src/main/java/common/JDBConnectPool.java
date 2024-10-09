package common;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class JDBConnectPool {
    public Connection con;
    public Statement st;
    public PreparedStatement pst;
    public ResultSet rs;

    public JDBConnectPool() {
        try{
            Context initContext = new InitialContext();
            Context envContext  = (Context)initContext.lookup("java:/comp/env");
            DataSource ds = (DataSource)envContext.lookup("jdbc_myoracle");
            con = ds.getConnection();
            System.out.println("ConnectPool 연결 성공");
        }catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void close(){
        try{
            if(rs!=null) rs.close();
            if(pst!=null) pst.close();
            if(st!=null) st.close();
            if(con!=null) con.close();
            System.out.println("DB 연결 해제");
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
