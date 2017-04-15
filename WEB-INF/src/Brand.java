package olx;
import java.sql.*;
import java.util.*;
public class Brand {

		public void addRecord(int brand_id,String brand_name)
		{
			DConnection db=new DConnection();
			db.executeOther("insert into brand values("+brand_id+",'"+brand_name+"')");
			db.close();
		}
		public void deleteRecord(int brand_id)
		{
	                            DConnection db=new DConnection();
			db.executeOther("delete from brand where brand_id="+brand_id);
			db.close();
		}
		public void updateRecord(int oldid,String newbrand_name)
		{
			DConnection db=new DConnection();
			db.executeOther("update brand set brand_name='"+newbrand_name+"' where brand_id="+oldid);
			db.close();
		}
		public Vector<String []> showRecordAll()
		{
			Vector<String[]> v1=new Vector<String[]>();
			DConnection db=new DConnection();
			try
			{	ResultSet rst=db.executeSelect("select * from brand order by brand_name");
				while(rst.next())
				{	String s[]=new String[2];
					for(int i=0;i<2;i++)
					{
						s[i]=rst.getString(i+1);
					}
					//s[2]=CommonMethods.getCategoryName(rst.getInt(3));
					//s[3]=CommonMethods.getSubCategoryName(rst.getInt(4));
					v1.addElement(s);
				}
			}
			catch(SQLException e)
			{	e.printStackTrace();
			}
			db.close();
			return v1;
		}	
		public Vector<String []> showRecord(int brand_id)
		{
			Vector<String[]> v1=new Vector<>();
			String s[]=new String[4];
			DConnection db=new DConnection();
			try
			{
				ResultSet rst=db.executeSelect("select * from brand where brand_id="+brand_id);
				if(rst.next())
				{
					for(int i=0;i<4;i++)
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
				rst=db.executeSelect("select max(brand_id) from brand");
				rst.next();
				r=rst.getInt(1);
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
			return r;
		}
        	}
