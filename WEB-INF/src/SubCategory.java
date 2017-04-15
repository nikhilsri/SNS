package olx;
import java.sql.*;
import java.util.*;
public class SubCategory {

		public void addRecord(int subcat_id,String subcat_name,int cat_id, String subcat_pic)
		{
			DConnection db=new DConnection();
			db.executeOther("insert into subcategory values("+subcat_id+",'"+subcat_name+"',"+cat_id+",'"+subcat_pic+"')");
			db.close();
		}
		public void deleteRecord(int subcat_id)
		{
	                            DConnection db=new DConnection();
			db.executeOther("delete from subcategory where subcat_id="+subcat_id);
			db.close();
		}
		public int updateRecord(int oldid,String newsubcat_name,int cat_id, String subcat_pic)
		{
			DConnection db=new DConnection();
			int cnt=db.executeOther("update subcategory set subcat_name='"+newsubcat_name+"' , cat_id="+cat_id+", subcat_pic='"+subcat_pic+"' where subcat_id="+oldid);
			db.close();
			return cnt;
		}
		public Vector<String []> showRecordAll()
		{
			Vector<String[]> v1=new Vector<String[]>();
			DConnection db=new DConnection();
			try
			{	ResultSet rst=db.executeSelect("select * from subcategory order by subcat_name");
				while(rst.next())
				{	String s[]=new String[4];
					for(int i=0;i<2;i++)
					{
						s[i]=rst.getString(i+1);
					}
					s[2]=getCategoryName(rst.getInt(3));
					s[3]=rst.getString(4);
					v1.addElement(s);
				}
			}
			catch(SQLException e)
			{	e.printStackTrace();
			}
			db.close();
			return v1;
		}	
		public Vector<String []> showRecord(int subcat_id)
		{
			Vector<String[]> v1=new Vector<>();
			String s[]=new String[3];
			DConnection db=new DConnection();
			try
			{
				ResultSet rst=db.executeSelect("select * from subcategory where subcat_id="+subcat_id);
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
		public int maxId()
		{
			DConnection db=new DConnection();
			ResultSet rst;
			int r=0;
			try
			{
				rst=db.executeSelect("select max(subcat_id) from subcategory");
				rst.next();
				r=rst.getInt(1);
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
			return r;
		}
		public Vector<String []> showcatid()
		{
			Vector<String[]> v1=new Vector<String[]>();
			DConnection db=new DConnection();
			try
			{	ResultSet rst=db.executeSelect("select * from category");
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
	public String getCategoryName(int id)
	{
		DConnection db=new DConnection();
		String name="";
		try{
			ResultSet rst=db.executeSelect("select cat_name from category where cat_id="+id);
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

	public int deletecheck(int subcat_id)
	{
		DConnection db=new DConnection();
		int i=0;
		try{
			ResultSet rst=db.executeSelect("select * from product where subcat_id="+subcat_id);
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
	public String getImageName(int subcat_id)
	{
		DConnection db=new DConnection();
		ResultSet rst;
		String name="";
		try
		{
			rst=db.executeSelect("select subcat_pic from subcategory where subcat_id="+subcat_id);
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
