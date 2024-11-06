import java.sql.*;


public class jdbc {

	public static void main(String[] args){
		try{
		// TODO Auto-generated method stub
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sb","new_user","password"); 

Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from student");
while(rs.next())
{
	int Roll=rs.getInt("rollno");
	String Name=rs.getString("name");
	//String city=rs.getNString("City");
	System.out.print(Roll+ "  "+Name+ "  ");
	//st.close();
	//con.close();
}
}catch (Exception e){}
	}

}
