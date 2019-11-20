package dbpkg;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;



public class ShopDAO extends DBConnection{
	private static ShopDAO instance = new ShopDAO();
	public static ShopDAO getInstance() {
		return instance;
	}
//	private int custno;
//	private String custname;
//	private String phone;
//	private String address;
//	private Date joindate;
//	private String grade;
//	private String city;
	private ShopDAO() {}
	
	
	public int getCustno() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		String sql=null;
		int custno=0;
		try {
			conn = getConnection();
			sql="select NVL(max(custno), 100000)+1 from MEMBER_TBL_01";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				custno = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeDBResources(rs, pstmt, conn);
		}		
		return custno;
	}
	public int insertMember(MemberVO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		int rs = 0;
		try {
			conn = getConnection();
			sql = "insert into member_tbl_01 values(?,?,?,?,TO_DATE(?, 'YYYYMMDD'),?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getCustno());
			pstmt.setString(2, vo.getCustname());
			pstmt.setString(3, vo.getPhone());
			pstmt.setString(4, vo.getAddress());
			pstmt.setString(5, vo.getJoindate());
			pstmt.setString(6, vo.getGrade());
			pstmt.setString(7, vo.getCity());
			rs = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDBResources(pstmt, conn);
		}
		return rs;
	}
	public MemberVO getMem(int custno) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		MemberVO vo = null;
		try {
			conn = getConnection();
			sql="select custname,phone, address," + 
					" to_char(joindate,'yyyymmdd'), grade, city " +
					" from MEMBER_TBL_01" + 
					" where custno=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, custno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new MemberVO();
				vo.setCustno(custno);
				vo.setCustname(rs.getString("custname"));
				vo.setPhone(rs.getString(2));
				vo.setAddress(rs.getString(3));
				vo.setJoindate(rs.getString(4));
				vo.setGrade(rs.getString(5));
				vo.setCity(rs.getString(6));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeDBResources(rs, pstmt, conn);
		}		
		return vo;
	}
	

	public ArrayList<MemberVO> memList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		String sql=null;
		ArrayList<MemberVO> list = null;
		try {
			conn = getConnection();
			sql="select custno,address,city,custname, to_char(joindate,'yyyy-mm-dd'),grade, phone from MEMBER_TBL_01";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				list = new ArrayList<MemberVO>();
				do {
					MemberVO vo = new MemberVO();
					vo.setCustno(rs.getInt(1));
					vo.setAddress(rs.getString(2));
					vo.setCity(rs.getString(3));
					vo.setCustname(rs.getString(4));
					vo.setJoindate(rs.getString(5));
					if(rs.getString(6).equals("A"))
						vo.setGrade("VIP");
					else if(rs.getString(6).equals("B"))
						vo.setGrade("일반");
					else if(rs.getString(6).equals("C"))
						vo.setGrade("직원");					
					vo.setPhone(rs.getString(7));
					list.add(vo);
				}while(rs.next());
			}			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeDBResources(rs, pstmt, conn);
		}		
		return list;		
	}
	public ArrayList<PriceVO> priceList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		String sql=null;
		ArrayList<PriceVO> list = null;
		try {
			conn = getConnection();
			sql="select a.custno, a.custname, a.grade, sum(b.price) as totalprice " + 
					" from MEMBER_TBL_01 a JOIN MONEY_TBL_01 b " + 
					" ON (a.custno = b.custno) " + 
					" group by a.custno, a.custname, a.grade " + 
					" order by totalprice desc";
			pstmt = conn.prepareStatement(sql);
			System.out.println("aa");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				System.out.println("aa");
				list = new ArrayList<PriceVO>();
				do {
					System.out.println("bb");
					PriceVO vo = new PriceVO();
					vo.setCustno(rs.getInt(1));
					vo.setCustname(rs.getString(2));
//					vo.setGrade(rs.getString(3));
					if(rs.getString(3).equals("A"))
						vo.setGrade("VIP");
					else if(rs.getString(3).equals("B"))
						vo.setGrade("일반");
					else if(rs.getString(3).equals("C"))
						vo.setGrade("직원");	
					vo.setTotalprice(rs.getInt(4));
					list.add(vo);
				}while(rs.next());
			}		
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeDBResources(rs, pstmt, conn);
		}		
		return list;		
	}
	
	
	
	public int updateMem(MemberVO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rs=0;
		String sql=null;
		try {
			conn = getConnection();
			sql="update MEMBER_TBL_01 set "
					+ " custname=?, phone=?, address=?, joindate=to_date(?,'yyyymmdd'), grade=?, city=? "
					+ " where custno=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getCustname());
			pstmt.setString(2, vo.getPhone());
			pstmt.setString(3, vo.getAddress());
			pstmt.setString(4, vo.getJoindate()); 
			pstmt.setString(5, vo.getGrade());
			pstmt.setString(6, vo.getCity());
			pstmt.setInt(7, vo.getCustno());
			rs = pstmt.executeUpdate();			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeDBResources(pstmt, conn);
		}		
		return rs;		
	}
}
