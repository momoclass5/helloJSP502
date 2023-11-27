package com.momo.dto;

public class FileDto {
	private int file_no;
	private String name;
	private String title;
	private String cate;
	private String ofile;
	private String sfile;
	private String postdate;
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "file_no : " +file_no
				+ "\nname : " + name
				+ "\ntitle : " + title
				+ "\ncate : " + cate
				+ "\nofile : " + ofile
				+ "\nsfile : " + sfile
				+ "\npostdate : " + postdate;
	}
	
	public FileDto(int file_no, String name, String title, String cate, String ofile, String sfile, String postdate) {
		super();
		this.file_no = file_no;
		this.name = name;
		this.title = title;
		this.cate = cate;
		this.ofile = ofile;
		this.sfile = sfile;
		this.postdate = postdate;
	}
	
	public int getFile_no() {
		return file_no;
	}
	public void setFile_no(int file_no) {
		this.file_no = file_no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCate() {
		return cate;
	}
	public void setCate(String cate) {
		this.cate = cate;
	}
	public String getOfile() {
		return ofile;
	}
	public void setOfile(String ofile) {
		this.ofile = ofile;
	}
	public String getSfile() {
		return sfile;
	}
	public void setSfile(String sfile) {
		this.sfile = sfile;
	}
	public String getPostdate() {
		return postdate;
	}
	public void setPostdate(String postdate) {
		this.postdate = postdate;
	}
	
	
}
