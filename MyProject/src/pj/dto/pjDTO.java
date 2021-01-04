package pj.dto;

import java.sql.Date;

public class pjDTO {
	private String userid;
	private String passwd;
	private String name;
	private String email;
	private String phone;
	private int num; 
	private String writer;
	private String subject;
	private String pawd;
	private Date reg_date;
	private int readcount;
	private int ref;
	private int re_step;
	private int re_level;
	private String content;
	private String ip;
	private int comment_count;
	private String filename;
	private int filesize; 
	private int down;
	private String ext;
	private String show;
	int comment_num; 
	int board_num;
	String writer2;
	String content2;
	Date reg_date2;
		
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getPawd() {
		return pawd;
	}
	public void setPawd(String pawd) {
		this.pawd = pawd;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getRe_step() {
		return re_step;
	}
	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}
	public int getRe_level() {
		return re_level;
	}
	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public int getComment_count() {
		return comment_count;
	}
	public void setComment_count(int comment_count) {
		this.comment_count = comment_count;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getFilesize() {
		return filesize;
	}
	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}
	public int getDown() {
		return down;
	}
	public void setDown(int down) {
		this.down = down;
	}
	public String getExt() {
		return ext;
	}
	public void setExt(String ext) {
		this.ext = ext;
	}
	public String getShow() {
		return show;
	}
	public void setShow(String show) {
		this.show = show;
	}
	public int getComment_num() {
		return comment_num;
	}
	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getWriter2() {
		return writer2;
	}
	public void setWriter2(String writer2) {
		this.writer2 = writer2;
	}
	public String getContent2() {
		return content2;
	}
	public void setContent2(String content2) {
		this.content2 = content2;
	}
	public Date getReg_date2() {
		return reg_date2;
	}
	public void setReg_date2(Date reg_date2) {
		this.reg_date2 = reg_date2;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public pjDTO() {
		
	}
	@Override
	public String toString() {
		return "pjDTO [userid=" + userid + ", passwd=" + passwd + ", name=" + name + ", email=" + email + ", phone="
				+ phone + ", num=" + num + ", writer=" + writer + ", subject=" + subject + ", pawd=" + pawd
				+ ", reg_date=" + reg_date + ", readcount=" + readcount + ", ref=" + ref + ", re_step=" + re_step
				+ ", re_level=" + re_level + ", content=" + content + ", ip=" + ip + ", comment_count=" + comment_count
				+ ", filename=" + filename + ", filesize=" + filesize + ", down=" + down + ", ext=" + ext + ", show="
				+ show + ", comment_num=" + comment_num + ", board_num=" + board_num + ", writer2=" + writer2
				+ ", content2=" + content2 + ", reg_date2=" + reg_date2 + "]";
	}
}	