package olx;
import java.sql.*;
import olx.DConnection;
public class StateCheck 
{

	public void addState(String state)
	{
			DConnection db=new DConnection();
			db.executeOther("insert into state(state_name) values('"+state+"')");
			db.close();
	}
}