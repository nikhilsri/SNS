package olx;
import java.sql.*;
import java.util.*;
public class State {

		public void addRecord(int state_id,String state_name)
		{
			DConnection db=new DConnection();
			db.executeOther("insert into State values("+state_id+",'"+state_name+"')");
			db.close();
		}
		public void deleteRecord(int state_id)
		{
	                            DConnection db=new DConnection();
			db.executeOther("delete from State where state_id="+state_id);
			db.close();
		}
		public void updateRecord(int oldid,String newstate_name)
		{
		DConnection db=new DConnection();
			db.executeOther("update State set state_name='"+newstate_name+"'  where state_id="+oldid);
			db.close();
		}
	 	public Vector<String []> showRecordAll()
		{
			Vector<String[]> v1=new Vector<String[]>();
			DConnection db=new DConnection();
			try
			{	ResultSet rst=db.executeSelect("select * from state order by state_name");
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
		public Vector<String []> showRecord(int state_id)
		{
			Vector<String[]> v1=new Vector<>();
			String s[]=new String[2];
			DConnection db=new DConnection();
			try
			{
				ResultSet rst=db.executeSelect("select * from State where state_id="+state_id);
				if(rst.next())
				{
					for(int i=0;i<2;i++)
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
		public int maxId()
		{
			DConnection db=new DConnection();
			ResultSet rst;
			int r=0;
			try
			{
				rst=db.executeSelect("select max(state_id) from State");
				rst.next();
				r=rst.getInt(1);
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
			return r;
		}
		public int deletecheck(int state_id)
		{
			DConnection db=new DConnection();
			int i=0;
			try{
				ResultSet rst=db.executeSelect("select * from city where state_id="+state_id);
				while(rst.next())
				{
					i++;
				}
				db.close();
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
			return i;
		}
}
