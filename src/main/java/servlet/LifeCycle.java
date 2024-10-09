package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/servlet/LifeCycle.do")
public class LifeCycle extends HttpServlet {
//    @PostConstruct
//    public void myPostConstruct(){
//        System.out.println("My Post Construct() 호출");
//    }

    public void init() throws ServletException {
        System.out.println("init() 호출");
    }

//    @Override
//    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        System.out.println("service() 호출");
//    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("doGet() 호출");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("doPost() 호출");
    }

    public void destroy(){
        System.out.println("destrory() 호출");
    }
//    @PreDestroy
//    public void myPreDestroy(){
//        System.out.println("myPreDestroy() 호출");
//    }
}
