package net.docm;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

/**
 * 
 * @author   qianj
 * @version  1.0.0
 * @2011-4-21 下午09:34:15
 */
public class HelloSqlite {
		public static void main(String[] args) {
			// 加载驱动
			try {
				Class.forName("org.sqlite.JDBC");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				// e.printStackTrace();
				System.out.println("数据库驱动未找到!");
			}
			// 得到连接 会在你所填写的目录建一个你命名的文件数据库
			Connection conn;
			try {
				conn = DriverManager.getConnection("jdbc:sqlite:db/docm.db",null,null);
				Statement stmt = conn.createStatement();
				//判断表是否存在
				ResultSet rsTables = conn.getMetaData().getTables(null, null, "student", null);
				if(rsTables.next()){
					System.out.println("表存已在。");
					conn.close();
				} else {
					System.out.println("表存不在，创建表。");
					stmt.executeUpdate("create table student (id,name);");
					System.out.println("创建表完毕。");
					conn.close();
				}
				
				
				conn = DriverManager.getConnection("jdbc:sqlite:db/docm.db",null,null);
				// 设置自动提交为false
				conn.setAutoCommit(true);
				stmt = conn.createStatement();
				String id=String.valueOf(new Date().getTime());
				String sql="insert into student values ("+id+",'hehe')";
				System.out.println(sql);
				stmt.execute(sql);
				
				//stmt.executeUpdate("insert into student values (5,'xixi');");
				//stmt.executeUpdate("insert into student values (6,'haha');");
				// 提交
				//conn.commit();
				// 得到结果集
				ResultSet rs = stmt.executeQuery("select * from student;");
				while (rs.next()) {
					System.out.println("id = " + rs.getString("id"));
					System.out.println("name = " + rs.getString("name"));
				}
				rs.close();
				conn.close();
			} catch (SQLException e) {
				 e.printStackTrace();
				System.out.println("SQL异常!");
			}finally{
				
			}
		}

	}