package olx;
import java.sql.*;
import java.util.*;

import javax.servlet.RequestDispatcher;

import olx.DConnection;
public class User {
	ResultSet rst;
	private int user_id;
	public int getUser_id() {
		return user_id;
	}
	private int state_id;
	private int city_id;
		
	public void updateContactDetails(int user_id,String name,int city_id,int state_id,String location,String contact,String mail_id)
	{
		DConnection db=new DConnection();
		db.executeOther("update users set name='"+name+"', city_id="+city_id+", state_id="+state_id+",location='"+location+"',contact='"+contact+"',mail_id='"+mail_id+"' where user_id="+user_id);
		db.close();
	}
	public void deleteAccount(int user_id)
	{
		DConnection db=new DConnection();
		db.executeOther("delete from users where user_id="+user_id);
		db.close();
	}
	
	public int getState_id(String state_name)
	{
		DConnection db=new DConnection();
		int i=0;
		try{
			ResultSet rst=db.executeSelect("select state_id from state where state_name='"+state_name.trim()+"'");
			rst.next();
			i=rst.getInt(1);
			db.close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return i;
		
	}
	public String getState_name(int state_id)
	{
		DConnection db=new DConnection();
		String sa="";
		try{
			ResultSet rst=db.executeSelect("select state_name from state where state_id="+state_id);
			rst.next();
			sa=rst.getString(1);
			db.close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return sa;
		
	}
		public String getCity_name(int city_id)
	{
		DConnection db=new DConnection();
		String sb="";
		try{
			ResultSet rst=db.executeSelect("select city_name from city where city_id="+city_id);
			rst.next();
			sb=rst.getString(1);
			db.close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return sb;
		
	}
	public int getCity_id(String city_name)
	{
		DConnection db=new DConnection();
		int i=0;
		try{
			ResultSet rst=db.executeSelect("select city_id from city where city_name='"+city_name.trim()+"'");
			rst.next();
			i=rst.getInt(1);
			db.close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return i;
		
	}
	
	public Vector showContactDetails(int user_id)
	{	DConnection db=new DConnection();
		Vector<String []> v1=new Vector<>();
		String s1[]=new String[8];
		try
		{	rst=db.executeSelect("select * from users where user_id="+user_id+"");
			if(rst.next())
			{
				for(int i=0;i<5;i++)
				{
				s1[i]=rst.getString(i+1);
				}
				int c=Integer.parseInt(rst.getString(6));
				
				int s=Integer.parseInt(rst.getString(7));
				s1[5]=getCity_name(c);
				s1[6]=getState_name(s);
				s1[7]=rst.getString(8);
				
			}
		}catch(SQLException e)
		{
		e.printStackTrace();
		}
		v1.addElement(s1);
		db.close();
		return v1;
		
	}
	public boolean checkpass(String oldpass,int user_id)
	{
		DConnection db=new DConnection();
		try{
		 rst=db.executeSelect("select * from users where password='"+oldpass+"' and user_id="+user_id);
		 if(rst.next())
			 return true;
		 else 
			 return false;
		}catch(SQLException e)
		{e.printStackTrace();}
		 db.close();
		 return false;
	}
	public void changePassword(String pass,int user_id)
	{ 
	DConnection db=new DConnection();
	db.executeOther("update users set password='"+pass+"' where user_id="+user_id);
	db.close();
	}
	public void updateViaMailId(String name,String pass,String Email_id)
	{
		DConnection db=new DConnection();
		db.executeOther("update users set name='"+name+"', password='"+pass+"' where mail_id= '"+Email_id+"' ");
		db.close();
	}
}
