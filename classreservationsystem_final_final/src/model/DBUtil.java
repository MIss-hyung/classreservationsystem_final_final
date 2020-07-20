package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletContext;

public class DBUtil {

	
	// 학생 로그인 
			public static Member findUser(ServletContext sc, String uid) {
				Connection conn = (Connection) sc.getAttribute("DBconnection");
				String sqlSt = "SELECT * FROM user WHERE id=?";
				PreparedStatement psmt;

				Member member = new Member();
				try {
					psmt = conn.prepareStatement(sqlSt);
					psmt.setString(1, uid);

					ResultSet rs = psmt.executeQuery();

					if (rs.next()) { // existing user
						//마이페이지 정보들 담아 놓기 위한 맴버 세팅 
						member.setPasswd(rs.getString("passwd"));
						member.setName(rs.getString("name"));
						member.setMajor(rs.getString("major"));
						member.setEmail(rs.getString("email"));
						member.setPhonenum(rs.getString("phonenum"));
						member.setLoginPermission(rs.getInt(1));
						member.setCount(rs.getString("count"));
						member.setCountdate(rs.getString("countdate"));
						
					
						
						rs.close();
					} else { // invalid user
						member.setLoginPermission(9);

					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
				return member;
			}
	// 관리자 로그인
	public static Member findAdmin(ServletContext sc, String uid) {
		Connection conn = (Connection) sc.getAttribute("DBconnection");
		String sqlSt = "SELECT * FROM administrator WHERE id=?";
		PreparedStatement psmt;

		Member member = new Member();
		try {

			psmt = conn.prepareStatement(sqlSt);
			psmt.setString(1, uid);

			ResultSet rs = psmt.executeQuery();

			if (rs.next()) { // existing user
				// member.setId(rs.getString("id"));
				member.setPasswd(rs.getString("passwd"));
				member.setPhonenum(rs.getString("phonenum"));
				// member.setName(rs.getString("name"));
				// member.setHost(rs.getInt("host"));

				rs.close();
			} else {

				member.setLoginPermission(8);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return member;
	}

	// 학생 회원가입
	public static Member joinUser(ServletContext sc, String id, String name, String major, String passwd, String email,
			String phonenum, String countdate, String count,int loginpermission) {
		Connection conn = (Connection) sc.getAttribute("DBconnection");
		String sql = "INSERT INTO user VALUES(?,?,?,?,?,?,?,?,?)";
		PreparedStatement psm;

		Member member = new Member();
		try {
			psm = conn.prepareStatement(sql);

			psm.setString(1, id);
			psm.setString(2, name);
			psm.setString(3, major);
			psm.setString(4, passwd);
			psm.setString(5, email);
			psm.setString(6, phonenum);
	        psm.setString(9, countdate);
	        psm.setString(8, count);
	        psm.setInt(7, 1);

			psm.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return member;
	}

	// 관리자 회원가입
	public static Member joinAdmin(ServletContext sc, String id, String passwd, String phonenum) {
		Connection conn = (Connection) sc.getAttribute("DBconnection");
		String sql = "INSERT INTO administrator VALUES(?,?,?)";
		PreparedStatement psm;

		Member member = new Member();
		try {
			psm = conn.prepareStatement(sql);

			psm.setString(1, id);
			psm.setString(2, passwd);
			psm.setString(3, phonenum);

			psm.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return member;
	}

	// 회원 탈퇴
	public static Member memberout(ServletContext sc, String id) {
		Connection conn = (Connection) sc.getAttribute("DBconnection");

		Member member = new Member();
		String sqlSt = "DELETE from user where id = ?";

		PreparedStatement psmt;
		try {
			psmt = conn.prepareStatement(sqlSt);
			psmt.setString(1, id);
			psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return member;
	}

	// 멤버 정보변경
	public static Member modifyMemberInfo(ServletContext sc, String id, String major, String email, String phonenum) {
		Connection conn = (Connection) sc.getAttribute("DBconnection");

		Member member = new Member();
		String sqlSt = "UPDATE user set major= ?, email= ?,  phonenum = ? where id = ?";

		// String sqlSt = "INSERT user set (major, email, phonenum) values (?,?,?) where
		// id = ?";

		PreparedStatement psmt;
		try {
			psmt = conn.prepareStatement(sqlSt);
			psmt.setString(4, id);
			psmt.setString(1, major);
			psmt.setString(2, email);
			psmt.setString(3, phonenum);

			// member.setId(id);
			psmt.executeUpdate();

			System.out.println("전 공 변경 " + major);
			System.out.println("이메일 변경 " + email);
			System.out.println("폰 번 변경 " + phonenum);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return member;
	}

	// 강의실 예약하기
	public static Reserve reservein(ServletContext sc, String date, String requestdate, String place, String classroom,
			String object, String num, String starttime, String stay, int permissionstate, String user_id,
			String rejectreason, String cancelstate) {
		Connection conn = (Connection) sc.getAttribute("DBconnection");

		String sql = "INSERT INTO reservation (date,requestdate,place,classroom,object,num,starttime,stay,permissionstate,user_id,rejectreason,cancelstate) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";

		PreparedStatement psm;

		Reserve Reserve = new Reserve();
		try {
			psm = conn.prepareStatement(sql);
			psm.setString(1, date);
			psm.setString(2, requestdate);
			psm.setString(3, place);
			psm.setString(4, classroom);
			psm.setString(5, object);
			psm.setString(6, num);
			psm.setString(7, starttime);
			psm.setString(8, stay);// 시작시간
			psm.setInt(9, permissionstate);// permisson
			psm.setString(10, user_id);
			psm.setString(11, rejectreason);
			psm.setString(12, cancelstate);
			psm.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return Reserve;
	}

	// 관리자 예약승인 permission update
	public static Reserve permissionupdate(ServletContext sc, String button, String id, int permissionstate,
			String rejectreason) {
		Connection conn = (Connection) sc.getAttribute("DBconnection");

		Reserve reserve = new Reserve();
		String sqlSt = "UPDATE reservation SET permissionstate = ?, rejectreason = ? WHERE id = ?";

		PreparedStatement psmt;
		try {
			psmt = conn.prepareStatement(sqlSt);
			if (button.equals("OK")) {
				psmt.setInt(1, 0);
			} else {
				psmt.setInt(1, 2);

			}

			psmt.setString(2, rejectreason);
			psmt.setString(3, id);

			System.out.println("DBUtil permissionstate" + permissionstate);
			System.out.println("DBUtil rejectreason" + rejectreason);
			System.out.println("DBUtil id" + id);

			psmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return reserve;
	}

	// 사용자가 예약을 취소 했을 때 취소테이블에 접근 하기
	public static Cancel CancelReserve(ServletContext sc, String canceldate, String availabledate, String user_id,
			String reservation_id) {
		Connection conn = (Connection) sc.getAttribute("DBconnection");
		PreparedStatement psm;
		String sql = "INSERT INTO cancel (canceldate,availabledate,user_id,reservation_id) VALUES (?,?,?,?)";

		Cancel Cancel = new Cancel();

		try {
			psm = conn.prepareStatement(sql);
			psm.setString(1, canceldate);
			psm.setString(2, availabledate);
			psm.setString(3, user_id);
			psm.setString(4, reservation_id);

			psm.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return Cancel;
	}

	// 사용자가 예약을 취소 했을 때 예약테이블에 접근해서 cancelstate업데이트 시켜주기
	public static Reserve CancelstateUpdate(ServletContext sc, String cancelstate, String id) {
		Connection conn = (Connection) sc.getAttribute("DBconnection");

		Reserve reserve = new Reserve();
		String sqlSt = "UPDATE reservation SET cancelstate = ? WHERE id = ?";

		PreparedStatement psmt;
		try {
			psmt = conn.prepareStatement(sqlSt);

			psmt.setString(1, cancelstate);
			psmt.setString(2, id);

			System.out.println("DBUtil cancelstate 취소 업뎃 상태 디비유틸  " + cancelstate);
			System.out.println("DBUtil id 취소 업뎃 아이디 디비유틸 " + id);

			psmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return reserve;
	}

	//날짜,장소조회
    public static ArrayList<Reserve> lookupdate(ServletContext sc, String date, String place){
       PreparedStatement pstmt;
       
       ArrayList<Reserve> list = new ArrayList<Reserve>();
       //System.out.println("parameter " + date);
       //System.out.println("parameter " + place);
        
          
          try{   
              Connection conn = (Connection) sc.getAttribute("DBconnection");
              StringBuffer sql = new StringBuffer();
              sql.append("SELECT date, place, classroom, starttime, stay, cancelstate From reservation ");
              sql.append("WHERE date ='"+date+"' AND place='"+place+"' AND permissionstate < 2 AND cancelstate = 0");
              sql.append(" UNION SELECT date, place, classroom, starttime, stay, cancelstate From administratormanage ");
              sql.append("WHERE date='"+date+"' AND place='"+place+"' AND cancelstate = 0");
              
              
              pstmt = conn.prepareStatement(sql.toString());
              ResultSet rs = pstmt.executeQuery();
              
             while(rs.next()){
                Reserve lists = new Reserve();
                lists.setDay(rs.getString("date"));
                lists.setPalce(rs.getString("place"));
                lists.setClassroom(rs.getString("classroom"));
                lists.setStarttime(rs.getString("starttime"));
                lists.setStay(rs.getString("stay"));
                
                list.add(lists);
                
                //System.out.println("DBUtil " + date);
                //System.out.println("DBUtil " + place);
             }
             sql.setLength(0);
       }   catch (SQLException e) {
          e.printStackTrace();
       }
          
          return list;

        
    }

	//관리자일정추가
    public static Reserve ad_reservein(ServletContext sc, String date, String place, String classroom, String starttime, String stay, String administrator_id, String cancelstate) {
         Connection conn = (Connection) sc.getAttribute("DBconnection");
         //String sql = "INSERT INTO reservation VALUES(?,?,?,?,?,?,?,?,?)";
         //String sql = "INSERT INTO reservation (date,requestdate,place,object,num,starttime,stay,permissionstate,user_id) VALUES (date,requestdate,place,object,num,starttime,stay,permissionstate,user_id)";
         String sql = "INSERT INTO administratormanage (date,place,classroom,starttime,stay,administrator_id,cancelstate) VALUES (?,?,?,?,?,?,?)";
         
         PreparedStatement psm;

         Reserve Reserve = new Reserve();
            try {
          psm = conn.prepareStatement(sql);
               psm.setString(1, date);
               psm.setString(2, place);
               psm.setString(3, classroom);
               psm.setString(4, starttime);
               psm.setString(5, stay);//시작시간
               psm.setString(6, administrator_id);
               psm.setString(7, cancelstate);
               psm.executeUpdate();
               
         
               
          
            } catch (SQLException e) {
                e.printStackTrace();
             }
             return Reserve;
         }

	// 패널티 - 한 달 횟수 제한
	public static Member countUpdate(ServletContext sc, String button, String id, String count) {
		Connection conn = (Connection) sc.getAttribute("DBconnection");

		Member member = new Member();
		String sqlSt = "UPDATE user SET count = ? WHERE id = ?";

		PreparedStatement psmt;
		try {
			psmt = conn.prepareStatement(sqlSt);
			int count1 = Integer.parseInt(count);
			count1 = count1 - 1;
			String count2 = Integer.toString(count1);
			if (button.equals("OK")) {
				psmt.setString(1, count2);

			}

			psmt.setString(2, id);

			System.out.println("DBUtil count" + count);
			System.out.println("DBUtil id" + id);

			psmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return member;
	}

	// 관리자가 일정 취소시 administratormanage 테이블 cancelstate 0에서 1로 업데이트
	public static Reserve AdCancelstateUpdate(ServletContext sc, String cancelstate, String id) {
		Connection conn = (Connection) sc.getAttribute("DBconnection");

		Reserve reserve = new Reserve();
		String sqlSt = "UPDATE administratormanage SET cancelstate = ? WHERE id = ?";

		PreparedStatement psmt;
		try {
			psmt = conn.prepareStatement(sqlSt);

			psmt.setString(1, cancelstate);
			psmt.setString(2, id);

			System.out.println("DBUtilㅇㅇㅇ cancelstate 취소 업뎃 상태 디비유틸  관리 " + cancelstate);
			System.out.println("DBUtil ㅇㅇㅇㅇㅇid 취소 업뎃 아이디 디비유틸 관리자  " + id);

			psmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return reserve;
	}

	//한달이 지나면 user 테이블에 있는 count 변수를 업데이트 시켜줌 
	public static Member MonthUserCountUpdate(ServletContext sc,  String id, String count, String countdate) {
	      Connection conn = (Connection) sc.getAttribute("DBconnection");

	      Member member = new Member();
	      String sqlSt = "UPDATE user SET count =?, countdate=? WHERE id = ?";

	      PreparedStatement psmt;
	      try {
	         psmt = conn.prepareStatement(sqlSt);

	      
	         psmt.setString(3, id);
	         psmt.setString(1, count);
	         psmt.setString(2, countdate);

	         

	         psmt.executeUpdate();

	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	      return member;
	   }
	}
