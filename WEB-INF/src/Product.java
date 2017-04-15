package olx;
import java.sql.*;
import java.util.Date;
import java.util.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class Product 
{
	private int subCatId; 
	private int catId;
	private int brandId;
	private int productId;
	private String productName;
	private String postDate;
	private String expiryDate;
	private int userId;
	private double price;
	private String image;
	private DConnection db=new DConnection();
	
	public Product()
	{
		checkExpiry();
	}
	
	public int add(int catId,int subCatId ,String productName,int brandId, String postDate, String expiryDate, int userId, double price,String image,String description)
	{
		int cnt=0;
		try
		{
			ResultSet rst=db.executeSelect("select max(product_id) from product");
			if(rst.next())
				productId=rst.getInt(1);
			db.close();			
			productId++;
			cnt=db.executeOther("insert into product values("+productId+",'"+productName+"',"+brandId+","+catId+","+subCatId+",'"+image+"',"+price+",'"+description+"','"+postDate+"','"+expiryDate+"',"+userId+")");
			db.close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return cnt;
	}
	public int update(int productId, int newCategory, int newSubCategory, int newBrand, String newPic, String newProductName, double newPrice, String newDescription, String newPostDate, String newExpiryDate)
	{
			int cnt=db.executeOther("update product set product_name='"+newProductName+"', price="+newPrice+", description='"+newDescription+"', post_date='"+newPostDate+"', expiry_date='"+newExpiryDate+"', cat_id='"+newCategory+"', subcat_id='"+newSubCategory+"', brand_id='"+newBrand+"', pic='"+newPic+"' where product_id="+productId);
			db.close();
			return cnt;
	}
	public Vector<String[]> display(int id)
	{
			Vector<String []> v1=new Vector<String []>();
			
			try{
				ResultSet rst=db.executeSelect("select post_date, expiry_date, product_name, price, description, pic from product where user_id="+id);
				while(rst.next()){
					String s1[]=new String[6];
					for(int i=0;i<6;i++){
						s1[i]=rst.getString(i+1);
						System.out.println(s1[i]);
					}
					v1.addElement(s1);
				}
			}
			catch(SQLException e){
				e.printStackTrace();
			}			
			return v1;
	}
	
	public String[] displayProduct(int pid){
		
		String s[]=null;
		try{
			ResultSet rst=db.executeSelect("select post_date, expiry_date, product_name, price, description, pic from product where product_id="+pid);		
			
			if(rst.next())
			{
				s=new String[6];
				for(int i=0;i<6;i++)
					s[i]=rst.getString(i+1);
			}
			db.close();
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		return s;
	}

	public void delete(int productId)
	{
			db.executeOther("delete from product where product_id="+productId);
			db.close();
	}
	public String getProductName(int productId)
	{
		String s1="";
		try
		{
			ResultSet rst=db.executeSelect("select product_name from product where product_id="+productId);
			rst.next();
			s1=rst.getString(1);
			db.close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return s1;		
	}

	public int getProductId(String productName)
	{
		int id=0;
		try
		{
			ResultSet rst=db.executeSelect("select product_id from product where product_name='"+productName+"'");
			rst.next();
			id=rst.getInt(1);
			db.close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return id;		
	}

	public String getCatName(int catId)
	{
		String s1="";
		try
		{
			ResultSet rst=db.executeSelect("select cat_name from category where cat_id="+catId);
			rst.next();
			s1=rst.getString("cat_name");
			db.close();
		}
		catch(SQLException e)
		{
			
		}
		return s1;	
	}
	
	public String getBrandName(int brandId)
	{
		String s1="";
		try
		{
			ResultSet rst=db.executeSelect("select brand_name from brand where brand_id="+brandId);
			rst.next();
			s1=rst.getString("brand_name");
			db.close();
		}
		catch(SQLException e)
		{
			
		}
		return s1;	
	}
	
	public String getSubCatName(int subCatId)
	{
		String s1="";
		try
		{
			ResultSet rst=db.executeSelect("select subcat_name from subcategory where subcat_id="+subCatId);
			rst.next();
			s1=rst.getString(1);
			db.close();
		}
		catch(SQLException e)
		{
			
		}
		return s1;
	}
	
	public int[] getIds(int pid)
	{
		int id[]=new int[3];
		try
		{			
			ResultSet rst=db.executeSelect("select cat_id, subcat_id, brand_id from product where product_id="+pid);
			while(rst.next())
			{
				id[0]=rst.getInt(1);
				id[1]=rst.getInt(2);
				id[2]=rst.getInt(3);
			}
			db.close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return id;	
	}
	
	public int getNextPid()
	{
		int nid=0;
		ResultSet rst=db.executeSelect("select max(product_id) from product");
		try
		{
			while(rst.next()){
				nid=rst.getInt(1);
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return (nid+1);
	}
	
	public String getExpiry(Calendar post)
	{
		SimpleDateFormat sdf =  new SimpleDateFormat("yyyy-MM-dd");
		post.roll(Calendar.MONTH, true);
		System.out.println(sdf.format(post.getTime()));
		//String expiry=(sdf.format(post.getTime())).toString();
		//System.out.println("#expiry: "+expiry);
		return sdf.format(post.getTime());
	}
	
	public void checkExpiry()
	{
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd");
		Calendar d1=Calendar.getInstance();
		String aa=sdf.format(d1.getTime());
		System.out.println(aa);
		String a1[]=aa.split("/");
		Calendar cd1=Calendar.getInstance();
		cd1.set(Integer.parseInt(a1[0]),
		    Integer.parseInt(a1[1])-1,Integer.parseInt(a1[2]));
		System.out.println(sdf.format(cd1.getTime()));
		//System.out.println((a1[0])+","+(Integer.parseInt(a1[1])-1)+","+(a1[2]));
		System.out.println("to check updateExpiry 1 \n");
		//sdf.format(d1.getTime());
		Calendar expiry=null;
		ResultSet rst=db.executeSelect("select expiry_date from product");
		try
		{
			while(rst.next()){
				String expiry_date=rst.getString("expiry_date");
				String a[]=expiry_date.split("-");
				expiry=Calendar.getInstance();
				expiry.set(Integer.parseInt(a[0]),
				    Integer.parseInt(a[1])-1,Integer.parseInt(a[2]));
				System.out.println(sdf.format(expiry.getTime()));
				//sdf.format(expiry.getTime());
				if(cd1.after(expiry)){
					System.out.println(cd1.after(expiry));
					db.executeOther("delete from product where expiry_date='"+sdf.format(expiry.getTime())+"'");
				}
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
	}

	public String expiry(int pid) // to return expiry date of particular product
	{
		String edate=null;
		try
		{
			ResultSet rst=db.executeSelect("select expiry_date from product where product_id="+pid);
			while(rst.next())
			{
				edate=rst.getString(1);
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return edate;
	}

	public int updateExpiry(String newExpiry, int pid)
	{
		int cnt=0;
		cnt=db.executeOther("update product set expiry_date='"+newExpiry+"' where product_id="+pid);
		return cnt;
	}
	
	public int getBrandId(String brandName)
	{
		try
		{
			ResultSet rst=db.executeSelect("select brand_id from brand where brand_name='"+brandName+"'");
			if(rst.next())
			{
				brandId=rst.getInt(1);
			}
			db.close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return brandId;
	}

	public int getCatId(String catName)
	{
		try
		{
			ResultSet rst=db.executeSelect("select cat_id from category where cat_name='"+catName+"'");
			if(rst.next())
			{
				catId=rst.getInt(1);
			}
			db.close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return catId;
	}

	public int getSubCatId(String subCatName)
	{
		try
		{
			ResultSet rst=db.executeSelect("select subcat_id from subcategory where subcat_name='"+subCatName+"'");
			if(rst.next())
			{
				subCatId=rst.getInt(1);
			}
			db.close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return subCatId;
	}

	public Vector<String> allBrandNames()
	{
		Vector<String> v=new Vector<String>();
		ResultSet rst=db.executeSelect("Select brand_name from brand");
		try
		{
			while(rst.next()){
				v.addElement(rst.getString(1));
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return v;
	}

	public Vector<String> allCategoryNames()
	{
		Vector<String> v=new Vector<String>();
		ResultSet rst=db.executeSelect("Select cat_name from category");
		try
		{
			while(rst.next()){
				v.addElement(rst.getString(1));
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return v;
	}

	public Vector<String> allSubCategoryNames()
	{
		Vector<String> v=new Vector<String>();
		ResultSet rst=db.executeSelect("Select subcat_name from subcategory");
		try
		{
			while(rst.next()){
				v.addElement(rst.getString(1));
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return v;
	}
}
