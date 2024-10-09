package model1;

import common.JDBConnect;

import java.util.ArrayList;
import java.util.List;

public class BoardDAO extends JDBConnect {
    public BoardDAO() {}

    public BoardDAO(String str) {
        super(str);
    }
    public int selectCount() { //전체 게시물 갯수를 구하는 함수
        int totcount = 0; //근데 이거 totcount 맞나..? total 아닌가?
        String sql = "select count(*) from board";
        try{
            st=con.createStatement(); //?가 없는 쿼리이기 때문에 그냥 Statement 임
            rs=st.executeQuery(sql);
            rs.next();
            totcount = rs.getInt(1);
        }catch (Exception e) {
            System.out.println("게시물 게수를 구하는 중 오류");
            e.printStackTrace();
        }
        return totcount;
    }
    public List<BoardDTO> selectAll() { //모든 데이터 다 가지고 옴
        List<BoardDTO> list = new ArrayList<BoardDTO>(); // 값을 LIST에 다 넣어주는거구나.
        String sql = "select * from board";
        try{
            st=con.createStatement(); //여기도 ?가 없는 쿼리니까 Statement임
            rs=st.executeQuery(sql);
            while(rs.next()) {
                BoardDTO dto = new BoardDTO();
                dto.setNum(rs.getInt("num"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setId(rs.getString("id"));
                dto.setPostdate(rs.getTimestamp("postdate"));
                dto.setVisitcount(rs.getInt("visitcount"));
                list.add(dto); //졸리다....머리가 띵하다. DTO객체에 새로 값을 넣어주는거지. 그리고 그 값을 꺼냈다뺏다하는거고
                //안그러면 계속 디비 열었다 닫았다해야하잖아 ㅇㅇ
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public BoardDTO selectByNum(int num) {
        BoardDTO dto = new BoardDTO();
        String sql = "select * from board where num = ?";
        try{
            pst=con.prepareStatement(sql);
            pst.setInt(1, num);
            rs=pst.executeQuery();
            if(rs.next()) {
                dto.setNum(rs.getInt("num"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setId(rs.getString("id"));
                dto.setPostdate(rs.getDate("postdate"));
                dto.setVisitcount(rs.getInt("visitcount")); //이때 조회수가 증가 하겠구나
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return dto;
    }

    public void updateVisitCount(int num) {
        String sql = "update board set visitcount = visitcount + 1 where num = ?";
        try{
            pst=con.prepareStatement(sql);
            pst.setInt(1, num);
            pst.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int updateBoard(BoardDTO dto) {
        System.out.println(dto);
        int result = 0;
        String sql = "update board set title = ?, content = ? where num = ?";
        try{
            pst=con.prepareStatement(sql);
            pst.setString(1, dto.getTitle());
            pst.setString(2, dto.getContent());
            pst.setInt(3, dto.getNum());
            result = pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    public int deleteBoard(int num) {
        int result = 0;
        String sql = "delete from board where num = ?";
        try {
            pst=con.prepareStatement(sql);
            pst.setInt(1, num);
            result = pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public int insertWrite(BoardDTO dto) {
        int inResult = 0;
        try{
            String sql="insert into board(title, content, id) values(?,?,?)";
            //String sql="insert into board(num, title, content, id) values(SEQ_BOARD_NUM.nextval,?,?,?)"; //오라클로 넣을때
            pst=con.prepareStatement(sql); //여기는 ?가 있기때문에 PrePareStatement임
            pst.setString(1, dto.getTitle());
            pst.setString(2, dto.getContent());
            pst.setString(3, dto.getId());
            inResult=pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return inResult;
    }
}
