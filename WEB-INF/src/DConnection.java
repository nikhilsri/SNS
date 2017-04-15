package olx;
import java.sql.*;
public class DConnection 
{
	Connection conn;
	Statement stmt;
	ResultSet rst;
	public DConnection()
	{
		executeOther("create table if not exists admin(admin_id varchar(255) primary key, password varchar(255), admin_name varchar(255))");
		close();
		int cnt=0;
		try
		{
			rst=executeSelect("select count(*) from admin");
			rst.next();
			cnt=rst.getInt(1);
			close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}	
		if(cnt==0)
		{
			executeOther("insert into admin values('admin','admin','admin')");
			close();
		}
		executeOther("create table if not exists category(cat_id int auto_increment primary key, cat_name varchar(255),cat_pic varchar(255))");
		close();
		executeOther("create table if not exists subcategory(subcat_id int auto_increment primary key, subcat_name varchar(255),cat_id int,subcat_pic varchar(255))");
		close();
		executeOther("create table if not exists brand(brand_id int auto_increment primary key, brand_name varchar(255))");
		close();
		executeOther("create table if not exists product(product_id int auto_increment primary key, product_name varchar(255),brand_id int,cat_id int,subcat_id int,pic varchar(255),price int,description varchar(255),post_date date,expiry_date date,user_id int)");
		close();
		executeOther("create table if not exists users(user_id int auto_increment primary key, mail_id varchar(255),password varchar(255),name varchar(255),contact varchar(255),city_id int,state_id int,location varchar(255))");
		close();
		executeOther("create table if not exists state(state_id int auto_increment primary key, state_name varchar(255))");
		close();
		executeOther("create table if not exists city(city_id int auto_increment primary key, city_name varchar(255),state_id int)");
		close();
	}
	public int executeOther(String qry)//insert,delete,update
	{
		int cnt=0;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection
			("jdbc:mysql://localhost:3306/olx","root","");
			stmt=conn.createStatement();
			cnt=stmt.executeUpdate(qry);
		}
		catch(ClassNotFoundException e)
		{
			e.printStackTrace();	
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return cnt;
	}
	public ResultSet executeSelect(String qry)//select
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection
			("jdbc:mysql://localhost:3306/olx","root","");
			stmt=conn.createStatement();
			rst=stmt.executeQuery(qry);
		}
		catch(ClassNotFoundException e)
		{
			e.printStackTrace();	
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}		
		return rst;
	}
	
	public void close()
	{
		try
		{
			stmt.close();
			conn.close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();			
		}
	}
}
