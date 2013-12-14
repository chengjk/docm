package net.docm;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class DBHelper {

	private Connection conn=null;
	private Statement stmt=null;// = conn.createStatement();
	
	
	public DBHelper(){
		try {
			Class.forName("org.sqlite.JDBC");
		} catch (ClassNotFoundException e) {
			System.out.println("数据库驱动未找到!");
			e.printStackTrace();
		}
		createTables();
		init();
	}
	
	/**
	 * 创建表
	 */
	private void createTables(){
		try {
			Connection _conn = DriverManager.getConnection("jdbc:sqlite:db/test.db",null,null);
			Statement _stmt = conn.createStatement();
			//判断表是否存在
			ResultSet rsTables = conn.getMetaData().getTables(null, null, "t_documents", null);
			if(rsTables.next()){
				System.out.println("表存已在。");
				_conn.close();
			} else {
				System.out.println("表存不在，创建表。");
				_stmt.executeUpdate("create table t_documents (id ,type,key,htmltext);");
				_stmt.executeUpdate("create table t_files (id，type,key,filepath);");
				System.out.println("创建表完毕。");
				_conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	private void init(){
		try {
			conn = DriverManager.getConnection("jdbc:sqlite:db/test.db",null,null);
			conn.setAutoCommit(true);
			stmt = conn.createStatement();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public Statement getStatement(){
		return stmt;
	}
	
	private void find(){
		ResultSet rs;
		try {
			rs = stmt.executeQuery("select * from student;");
			while (rs.next()) {
				System.out.println("id = " + rs.getString("id"));
				System.out.println("name = " + rs.getString("name"));
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public void destroy(){
		try {
			stmt.close();
			stmt=null;
			conn.close();
			conn=null;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	
	
}
