package model2;

import common.JDBConnect;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class MVCBoardDAO extends JDBConnect {
    public MVCBoardDAO() {
        super();
    }
    public MVCBoardDAO(String str) {
        super(str);
    }
    public int selectCount(Map<String, Object> map) {
        int totalCount = 0;
        String sql = "select count(*) from mvcboard";
        if(map.get("searchWord") != null) {
            sql += " where "+map.get("searchField")
                    +" like '%" + map.get("searchWord") + "%'";
        }
        try{
            st=con.createStatement();
            rs=st.executeQuery(sql);
            rs.next();
            totalCount = rs.getInt(1);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return totalCount;
    }
    public List<MVCBoardDTO> selectListPage(Map<String,Object> map){
        List<MVCBoardDTO> list = new ArrayList<MVCBoardDTO>();
        String sql = "select * from mvcboard";
        if(map.get("searchWord") != null) {
            sql += " where "+map.get("searchField")
                    +" like '%" + map.get("searchWord") + "%'";
        }
        sql += " order by idx desc limit ?,?";

        try{
            pst=con.prepareStatement(sql);
            pst.setInt(1, (int)map.get("start"));
            pst.setInt(2, (int)map.get("end"));
            rs=pst.executeQuery();
            while(rs.next()) {
                MVCBoardDTO dto = new MVCBoardDTO();
                dto.setIdx(rs.getInt("idx"));
                dto.setName(rs.getString("name"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setOfile(rs.getString("ofile"));
                dto.setSfile(rs.getString("sfile"));
                dto.setPass(rs.getString("pass"));
                dto.setDowncount(rs.getInt("downcount"));
                dto.setVisitcount(rs.getInt("visitcount"));
                dto.setPostdate(rs.getDate("postdate"));
                list.add(dto);
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public void updateVisitCount(int idx){
        String sql = "update mvcboard set visitcount=visitcount+1 where idx=?";
        try{
            pst=con.prepareStatement(sql);
            pst.setInt(1, idx);
            pst.executeUpdate();
        }catch (Exception e) {
            e.printStackTrace();
        }
    }
    public MVCBoardDTO selectOne(int idx) {
        MVCBoardDTO dto = new MVCBoardDTO();
        String sql = "select * from mvcboard where idx=?";
        try{
            pst=con.prepareStatement(sql);
            pst.setInt(1, idx);
            rs=pst.executeQuery();
            if(rs.next()) {
                dto.setIdx(rs.getInt("idx"));
                dto.setName(rs.getString("name"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setOfile(rs.getString("ofile"));
                dto.setSfile(rs.getString("sfile"));
                dto.setPass(rs.getString("pass"));
                dto.setDowncount(rs.getInt("downcount"));
                dto.setVisitcount(rs.getInt("visitcount"));
                dto.setPostdate(rs.getDate("postdate"));
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return dto;
    }
    public int insertWrite(MVCBoardDTO dto){
        int result = 0;
        String sql = "insert into mvcboard(name,title,content,ofile,sfile, pass) values(?,?,?,?,?,?)";
        try{
            pst=con.prepareStatement(sql);
            pst.setString(1, dto.getName());
            pst.setString(2, dto.getTitle());
            pst.setString(3, dto.getContent());
            pst.setString(4, dto.getOfile());
            pst.setString(5, dto.getSfile());
            pst.setString(6, dto.getPass());
            result = pst.executeUpdate();
        }catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    public void downCountPlus(int idx){
        String sql = "update mvcboard set downcount=downcount+1 where idx=?";
        try{
            pst=con.prepareStatement(sql);
            pst.setInt(1, idx);
            pst.executeUpdate();
        }catch (Exception e) {
            e.printStackTrace();
        }
    }
    public boolean confirmPassword(String pass, int idx){
        boolean result = false;
        String sql="select * from mvcboard where idx=? and pass=?";
        try{
            pst=con.prepareStatement(sql);
            pst.setInt(1, idx);
            pst.setString(2, pass);
            rs=pst.executeQuery();
            if(rs.next()){
               result = true;
            }

        }catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    public int deletePost(int idx){
        int result = 0;
        String sql = "delete from mvcboard where idx=?";
        try{
            pst=con.prepareStatement(sql);
            pst.setInt(1, idx);
            result = pst.executeUpdate();
        }catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    public int updatePost(MVCBoardDTO dto){
        int result = 0;
        String sql="update mvcboard set name=?, title=?, content=?, ofile=?, sfile=?"
                +" where idx=? and pass=?";
        try{
            pst=con.prepareStatement(sql);
            pst.setString(1, dto.getName());
            pst.setString(2, dto.getTitle());
            pst.setString(3, dto.getContent());
            pst.setString(4, dto.getOfile());
            pst.setString(5, dto.getSfile());
            pst.setInt(6, dto.getIdx());
            pst.setString(7, dto.getPass());
            result = pst.executeUpdate();
        }catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
}
