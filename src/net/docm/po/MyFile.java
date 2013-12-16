package net.docm.po;

public class MyFile {

	private String id;
	private String type;
	private String key;
	private String filepath;
	
	public String toString(){
		return "<tr>"
				+"<td>"+id+"</th>"
				+"<td>"+type+"</th>"
				+"<td>"+key+"</td>"
				+"<td>"+filepath+"</td>"
				+"<td>"
				+	"<a>查看</a>"
				+	"<a>编辑</a>"
				+	"<a>删除</a>"
				+"</td>"
			+"</tr>";
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
}
