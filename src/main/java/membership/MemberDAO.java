package membership;

import common.JDBConnect;

import java.sql.SQLException;

public class MemberDAO extends JDBConnect {
    public MemberDAO() {}
    public MemberDAO(String str){
        super(str);
    }

    public MemberDTO getMember2(MemberDTO dto) {
        MemberDTO member = new MemberDTO();
        String sql = "select * from member where id=? and pass=?";
        try{
            pst = con.prepareStatement(sql);
            pst.setString(1, dto.getId());
            pst.setString(2, dto.getPass());
            rs = pst.executeQuery();
            if(rs.next()){
                member.setId(rs.getString("id"));
                member.setPass(rs.getString("pass"));
                member.setName(rs.getString("name"));
                member.setRegidate(rs.getDate("regidate"));
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return member;
    }

    public MemberDTO getMember(String id, String pass){
        MemberDTO member=null;
        String query="select * from member where id=? and pass=?";

        try{
            pst=con.prepareStatement(query);
            pst.setString(1, id);
            pst.setString(2, pass);
            rs=pst.executeQuery();
            if(rs.next()){
                member = new MemberDTO();
                member.setId(rs.getString("id"));
                member.setPass(rs.getString("pass"));
                member.setName(rs.getString("name"));
                member.setRegidate(rs.getDate("regidate"));
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return member;
    }
    public int insertMember(MemberDTO dto) {
        int inResult=0;
        String sql="insert into member(id,pass,name) values(?,?,?)";
        try{
            pst=con.prepareStatement(sql);
            pst.setString(1, dto.getId());
            pst.setString(2, dto.getPass());
            pst.setString(3, dto.getName());
            inResult=pst.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
        return inResult;
    }

}
