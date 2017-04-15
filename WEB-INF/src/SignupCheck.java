package olx;
import java.sql.*;
public class SignupCheck 
{

	private DConnection db=new DConnection();
	public void addUser(String name,String password,String mail_id,String contact,String location,int state_id,int city_id)
	{	
		db.executeOther("insert into users(mail_id, password, name, contact, city_id, state_id, location) values('"+mail_id+"','"+password+"','"+name+"','"+contact+"','"+city_id+"','"+state_id+"','"+location+"')");
		db.close();
	}
	
}
