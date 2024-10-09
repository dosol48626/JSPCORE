package model2;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/mvcboard/list.do")
public class ListController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        MVCBoardDAO dao = new MVCBoardDAO("mysql");
        Map<String, Object> map = new HashMap<String, Object>();
        String searchField = req.getParameter("searchField");
        String searchWord = req.getParameter("searchWord");
        // 검색어에 대한 처리
        if(searchWord!=null){
            map.put("searchField", searchField);
            map.put("searchWord", searchWord);
        }
        int totalCount=dao.selectCount(map);
        //페이지 처리
        ServletContext application = getServletContext();
        int pageSize=Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
        int blockPage=Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
        //현재 페이지 설정
        int pageNum=1;
        String pageTemp=req.getParameter("pageNum");
        if(pageTemp!=null && !pageTemp.equals("")){
            pageNum=Integer.parseInt(pageTemp);
        }
        //목록에 출력할 게시물 범위 계산
        int start=(pageNum-1)*pageSize;
        //int end=pageNum*pageSize;
        map.put("start", start);
        map.put("end", pageSize);
        List<MVCBoardDTO> boardList=dao.selectListPage(map);
        dao.close();
        String pagingImg=BoardPage.pagingStr(totalCount, pageSize, blockPage,
                pageNum,"/mvcboard/list.do");

        map.put("pagingImg", pagingImg);
        map.put("totalCount", totalCount);
        map.put("pageSize", pageSize);
        map.put("pageNum", pageNum);
        req.setAttribute("boardList", boardList);
        req.setAttribute("map", map);
        req.getRequestDispatcher("/ch14/list.jsp").forward(req, resp);
    }
}
