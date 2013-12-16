package net.docm.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import net.docm.DB;
import net.docm.po.MyDoc;
import net.docm.po.MyFile;

public class Dao {

	private DB db=null;
	private Statement stmt=null;
	
	public Dao(){
		db=new DB();
		stmt=db.getStatement();
	}
	
	//----------------------t_docments--------------------
	/**
	 * 增加
	 * @param va
	 * @return
	 */
	public int save(MyDoc va) {
		int id=-1;
		va.setId(String.valueOf(new Date().getTime()));
		String sql="insert into t_documents (id,type,key,htmltext) values ('"+va.getId()+"','"
																			+va.getType()+"','"
																			+va.getKey()+"','"
																			+va.getHtmltext()
																			+ "')";
		try {
			id=stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return id;
	}
	/**
	 * 更新文档
	 * @param doc
	 * @return
	 */
	public int update(MyDoc doc){
		String id=doc.getId();
		if(id==null||id.trim()==""){
			save(doc);
		}
		String sql="update t_documents set (type,key,filepath) values('"
				+ doc.getType()+"','"
				+ doc.getKey()+"','"
				+ doc.getHtmltext()+"','"
				+ "')";
		
		try {
			return stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
	/**
	 * 删除文档
	 * @param doc
	 * @return
	 */
	public boolean deleteDoc(String id){
		String sql="delete from t_documents where id ='"+id+"'";
		try {
		  return stmt.execute(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean deleteAllDoc( ){
		String sql="delete from t_documents";
		try {
		  return stmt.execute(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	/**
	 * 根据id查询
	 * @param id
	 * @return
	 */
	public MyDoc find(String id){
		MyDoc doc=null;
		ResultSet rs;
		try {
			String sql="select * from t_documents where id='"+id+"'";
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				doc=new MyDoc();
				doc.setId(rs.getString("id"));
				doc.setKey(rs.getString("key"));
				doc.setType(rs.getString("type"));
				doc.setHtmltext(rs.getString("htmltext"));
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		return doc;
	}
	
	/**
	 * 查询所有文档
	 * @return
	 */
	public Iterable<MyDoc> findAllDoc() {
		List<MyDoc> docs=new ArrayList<MyDoc>();
		MyDoc doc=null;
		ResultSet rs;
		try {
			rs = stmt.executeQuery("select * from t_documents;");
			while (rs.next()) {
				doc=new MyDoc();
				doc.setId(rs.getString("id"));
				doc.setKey(rs.getString("key"));
				doc.setType(rs.getString("type"));
				doc.setHtmltext(rs.getString("htmltext"));
				docs.add(doc);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		return docs;
	}
	
	//------------------------------t_files----------------------
	/**
	 * 增加
	 * @param va
	 * @return
	 */
	public int save(MyFile va) {
		int id=-1;
		va.setId(String.valueOf(new Date().getTime()));
		String sql="insert into t_files (id,type,key,filepath) values ('"+va.getId()+"','"
												 +va.getType()+"','"
												 +va.getKey()+"','"
												 +va.getFilepath()
												 + "')";
		try {
			id=stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return id;
	}
	/**
	 * 更新文件
	 * @param f
	 * @return
	 */
	public int update(MyFile f){
		String id=f.getId();
		if(id==null||id.trim()==""){
			save(f);
		}
		String sql="update t_files set (type,key,filepath) values('"
				+ f.getType()+"','"
				+ f.getKey()+"','"
				+ f.getFilepath()+"','"
				+ "')";
		
		try {
			return stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return -1;
	}
	/**
	 * 删除文件
	 * @param f
	 * @return
	 */
	public boolean deleteFile(String id){
		String sql="delete from t_files where id="+id;
		try {
			return stmt.execute(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	/**
	 * 查询所有文件
	 * @return
	 */
	public Iterable<MyFile> findAllFile() {
		List<MyFile> files=new ArrayList<MyFile>();
		MyFile file=null;
		ResultSet rs;
		try {
			rs = stmt.executeQuery("select * from t_files;");
			while (rs.next()) {
				file=new MyFile();
				file.setId(rs.getString("id"));
				file.setKey(rs.getString("key"));
				file.setType(rs.getString("type"));
				file.setFilepath(rs.getString("filepath"));
				files.add(file);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		return files;
	}
	
	public static void main(String[] args){
		
		Dao dao=new Dao();
		MyDoc doc=new MyDoc();
		//doc.setId("1");
		doc.setKey("key");
		doc.setType("txt");
		doc.setHtmltext("<p>test</p>");
		dao.save(doc);
		MyFile f=new MyFile();
		//f.setId("1");
		f.setKey("key");
		f.setType("img");
		f.setFilepath("e:/11.png");
		dao.save(f);
		
		Iterable<MyDoc> docs=dao.findAllDoc();
		System.out.println(docs.toString());
		
		Iterable<MyFile> files=dao.findAllFile();
		System.out.println(files.toString());
		dao.deleteDoc(null);
		dao.deleteFile(null);
	}
}
