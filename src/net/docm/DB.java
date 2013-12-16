package net.docm;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class DB {

	private Connection conn=null;
	private Statement stmt=null;// = conn.createStatement();
	/** 数据库文件*/
	private String dbfile="db/docm.db";
	
	public boolean updataTable=true;
	
	public DB(){
		try {
			Class.forName("org.sqlite.JDBC");
		} catch (ClassNotFoundException e) {
			System.out.println("数据库驱动未找到!");
			e.printStackTrace();
		}
		if(updataTable){
			validateTables();	
		}
		init();
	}
	
	/**
	 * 验证表格
	 */
	private void validateTables(){
		try {
			Connection _conn = DriverManager.getConnection("jdbc:sqlite:"+dbfile,null,null);
			Statement _stmt = _conn.createStatement();
		
			ResultSet rsTables = _conn.getMetaData().getTables(null, null, "t_documents", null);
			if(rsTables.next()){
				System.out.println("数据表已存在。");
				_conn.close();
			} else {
				System.out.println("数据表不已存在，开始创建。");
				_stmt.executeUpdate("create table t_documents (id ,type,key,htmltext);");
				_stmt.executeUpdate("create table t_files (id,type,key,filepath);");
				System.out.println("数据表创建完毕。");
				_conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	private void init(){
		try {
			conn = DriverManager.getConnection("jdbc:sqlite:"+dbfile,null,null);
			conn.setAutoCommit(true);
			stmt = conn.createStatement();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public Statement getStatement(){
		return stmt;
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
