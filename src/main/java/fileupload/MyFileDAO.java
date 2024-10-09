package fileupload;

import common.JDBConnect;

import java.util.ArrayList;
import java.util.List;

public class MyFileDAO extends JDBConnect {
    public MyFileDAO() {}
    public MyFileDAO(String str) {
        super(str);
    }
    public List<MyFileDTO> myFileList(){
        List<MyFileDTO> list = new ArrayList<MyFileDTO>();
        String sql = "select * from myfile";
        try{
            st=con.createStatement();
            rs=st.executeQuery(sql);
            while(rs.next()){
                MyFileDTO dto = new MyFileDTO();
                dto.setIdx(rs.getInt("idx"));
                dto.setTitle(rs.getString("title"));
                dto.setCate(rs.getString("cate"));
                dto.setOfile(rs.getString("ofile"));
                dto.setSfile(rs.getString("sfile"));
                dto.setPostdate(rs.getTimestamp("postdate"));
                list.add(dto);
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public int insertFile(MyFileDTO dto){
        int result=0;
        String sql="insert into myfile(title, cate, ofile, sfile) values(?,?,?,?)";
        try{
            pst=con.prepareStatement(sql);
            pst.setString(1, dto.getTitle());
            pst.setString(2, dto.getCate());
            pst.setString(3, dto.getOfile());
            pst.setString(4, dto.getSfile());
            result=pst.executeUpdate();
        }catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
}
