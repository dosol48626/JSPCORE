package fileupload;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.FileUtil;

import java.io.IOException;

@WebServlet("/fileupload/Download.do")
public class DownloadServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String saveDirectory="/Uploads";
        String saveFileName=req.getParameter("sName");
        String originalFileName=req.getParameter("oName");
        FileUtil.download(req, resp, saveDirectory, saveFileName, originalFileName);
    }
}
