package com.my.board.dto;

import java.sql.Date;

public class Reply {
	private Integer renum;
	private String content;
	private Integer num;
	private Date writedate;
	private String fileurl;
	private String writer;

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getWritedate() {
		return writedate;
	}

	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}

	public String getFileurl() {
		return fileurl;
	}

	public void setFileurl(String fileurl) {
		this.fileurl = fileurl;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Integer getRenum() {
		return renum;
	}

	public void setRenum(Integer renum) {
		this.renum = renum;
	}

}
