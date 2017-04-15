package olx;
import java.sql.*;
import java.util.*;
public class Category {

		public void deleteRecord(int cat_id)
		{
	                            DConnection db=new DConnection();
			db.executeOther("delete from category where cat_id="+cat_id);
			db.close();
		}
		public int updateRecord(int oldid,String newcat_name, String cat_pic)
		{
		DConnection db=new DConnection();
			int cnt=db.executeOther("update category set cat_name='"+newcat_name+"', cat_pic='"+cat_pic+"'  where cat_id="+oldid);
			db.close();
			return cnt;
		}
	 	public Vector<String []> showRecordAll()
		{
			Vector<String[]> v1=new Vector<String[]>();
			DConnection db=new DConnection();
			try
			{	ResultSet rst=db.executeSelect("select * from category order by cat_name");
				while(rst.next())
				{	String s[]=new String[3];
					for(int i=0;i<3;i++)
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
		public Vector<String []> showRecord(int cat_id)
		{
			Vector<String[]> v1=new Vector<>();
			String s[]=new String[2];
			DConnection db=new DConnection();
			try
			{
				ResultSet rst=db.executeSelect("select * from category where cat_id="+cat_id);
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
				rst=db.executeSelect("select max(cat_id) from category");
				rst.next();
				r=rst.getInt(1);
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
			return r;
		}
		public void addRecord(int cat_id,String cat_name, String cat_pic)
		{
			DConnection db=new DConnection();
			db.executeOther("insert into category values("+cat_id+",'"+cat_name+"','"+cat_pic+"')");
			db.close();
		}
		public int deletecheck(int cat_id)
		{
			DConnection db=new DConnection();
			int i=0;
			try{
				ResultSet rst=db.executeSelect("select * from subcategory where cat_id="+cat_id);
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
		public String getImageName(int cat_id)
		{
			DConnection db=new DConnection();
			ResultSet rst;
			String name="";
			try
			{
				rst=db.executeSelect("select cat_pic from category where cat_id="+cat_id);
				rst.next();
				name=rst.getString(1);
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
			return name;
		}


}
