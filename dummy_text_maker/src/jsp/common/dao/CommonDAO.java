package jsp.common.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import jsp.common.util.DBConnection;
import jsp.common.vo.CommonVO;

public class CommonDAO {
	private static CommonDAO instance;
    
    // 싱글톤 패턴
    private CommonDAO(){}
    public static CommonDAO getInstance(){
        if(instance==null)
            instance=new CommonDAO();
        return instance;
    }
    
    public ArrayList<CommonVO> getText(String purpose) {
    	
    	Connection conn = null;
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	ArrayList<CommonVO> content = new ArrayList<CommonVO>();
    	try {
			conn = DBConnection.getConnection();
			StringBuffer query = new StringBuffer();
			query.append("select CONTENT FROM TEXT_DB WHERE PURPOSE = ?");
			
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, purpose);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CommonVO cVo = new CommonVO();
				cVo.setPurpose(purpose);
				cVo.setContent(rs.getString("CONTENT"));
				content.add(cVo);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
            try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( conn != null ){ conn.close(); conn=null;    }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
        }
    	return content;
		
	}
}
