package net.docm;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class TestSQLite {
	public static void main(String[] args) {
		try {
			// ����SQLite��JDBC

			Class.forName("org.sqlite.JDBC");

			// ����һ�����ݿ���zieckey.db�����ӣ���������ھ��ڵ�ǰĿ¼�´���֮

			Connection conn = DriverManager
					.getConnection("jdbc:sqlite:zieckey.db");

			Statement stat = conn.createStatement();
			stat.executeUpdate("create table tbl1(name varchar(20), salary int);");// ����һ����������

			stat.executeUpdate("insert into tbl1 values('ZhangSan',8000);"); // ��������

			stat.executeUpdate("insert into tbl1 values('LiSi',7800);");
			stat.executeUpdate("insert into tbl1 values('WangWu',5800);");
			stat.executeUpdate("insert into tbl1 values('ZhaoLiu',9100);");

			ResultSet rs = stat.executeQuery("select * from tbl1;"); // ��ѯ����

			while (rs.next()) { // ����ѯ�������ݴ�ӡ����

				System.out.print("name = " + rs.getString("name") + " "); // ������һ

				System.out.println("salary = " + rs.getString("salary")); // �����Զ�

			}
			rs.close();
			conn.close(); // �������ݿ������

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}