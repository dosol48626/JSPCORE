package model2;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.FileUtil;

import java.io.IOException;

@WebServlet("/mvcboard/download.do")
public class DownloadController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String directory="/Uploads";
        String ofile=req.getParameter("ofile");
        String sfile=req.getParameter("sfile");
        int idx=Integer.parseInt(req.getParameter("idx"));
        FileUtil.download(req, resp,directory,sfile, ofile);
        MVCBoardDAO dao=new MVCBoardDAO("mysql");
        dao.downCountPlus(idx);
        dao.close();
    }
}
