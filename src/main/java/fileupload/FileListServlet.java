package fileupload;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/fileupload/FileList.do")
public class FileListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        MyFileDAO dao = new MyFileDAO("MySQL");
        List<MyFileDTO> dtoList=dao.myFileList();
        dao.close();

        req.setAttribute("dtoList1", dtoList);
        req.getRequestDispatcher("/ch13/FileList.jsp").forward(req, resp);
    }
}
