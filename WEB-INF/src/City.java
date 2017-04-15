package olx;
import java.sql.*;
import java.util.*;
public class City 
{
	public void addRecord(int city_id,String city_name,int state_id)
	{
		DConnection  db=new DConnection ();
		db.executeOther("insert into city values("+city_id+",'"+city_name+"',"+state_id+")");
		db.close();
	}
	public void deleteRecord(int city_id )
	{
		DConnection db=new DConnection ();
		db.executeOther("delete from city where city_id="+city_id);
		db.close();
	}
	public void updateRecord(int oldcity_id,String newcity_name,int state_id)
	{
		DConnection  db=new DConnection ();
		db.executeOther("update city set city_name='"+newcity_name+"' ,state_id="+state_id+"  where city_id="+oldcity_id);
		db.close();
	}
	public Vector showRecordAll()
	{
		Vector<String[]> v1=new Vector<>();
		DConnection  db=new DConnection ();
		try
		{	ResultSet rst=db.executeSelect("select * from city order by city_name");
			while(rst.next())
			{	String s[]=new String[3];
				for(int i=0;i<2;i++)
				{
					s[i]=rst.getString(i+1);
				}
				s[2]=getStateName(rst.getInt(3));
				v1.addElement(s);
			}
		}
		catch(SQLException e)
		{	e.printStackTrace();
		}
		db.close();
		return v1;
	}	
	public Vector showRecord(int city_id)
	{
		Vector<String[]> v1=new Vector<>();
		String s[]=new String[3];
			DConnection  db=new DConnection ();
		try
		{
			ResultSet rst=db.executeSelect("select * from city where city_id="+city_id);
			if(rst.next())
			{
				for(int i=0;i<3;i++)
					s[i]=rst.getString(i+1);
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		v1.addElement(s);
		db.close();
		return v1;
	}	
	public int maxcity_id()
	{
		DConnection  db=new DConnection ();
		ResultSet rst;
		int r=0;
		try
		{
			rst=db.executeSelect("select max(city_id) from city");
			rst.next();
			r=rst.getInt(1);
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return r;
	}
	public Vector<String []> showstateid()
	{
		Vector<String[]> v1=new Vector<String[]>();
		DConnection db=new DConnection();
		try
		{	
			ResultSet rst=db.executeSelect("select * from state");
			while(rst.next())
			{	String s[]=new String[2];
					for(int i=0;i<2;i++)
					{
						s[i]=rst.getString(i+1);
					}
					v1.addElement(s);
				}
			}
			catch(SQLException e)
			{	e.printStackTrace();
			}
			db.close();
			return v1;
		}
   			public Vector<String []> showsubstateid()
			{
		
			Vector<String[]> v1=new Vector<>();
			String s[]=new String[3];
			DConnection db=new DConnection();
			try
			{
				ResultSet rst=db.executeSelect("select * from city");
				while(rst.next())
				{
					for(int i=0;i<3;i++)
						s[i]=rst.getString(i+1);
				}
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
			v1.addElement(s);
			db.close();
			return v1;	


		}

	public String getStateName(int id)
	{
		DConnection db=new DConnection();
		String name="";
		try{
			ResultSet rst=db.executeSelect("select state_name from state where state_id="+id);
			rst.next();
			name=rst.getString(1);
			db.close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return name;
	}	
}
