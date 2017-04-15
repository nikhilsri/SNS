package olx;
import java.sql.*;
import olx.DConnection;
public class CityCheck 
{

	public void addCity(String city)
	{
			DConnection db=new DConnection();
			db.executeOther("insert into city(city_name) values('"+city+"')");
			db.close();
	}
}