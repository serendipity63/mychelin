package com.my.board.dto;

public class Member {
	private String id;
	private String nickname;
	private String password;
	private String email;
	private String address;

	public Member() {

	}

	public Member(String id, String nickname, String password, String email, String address) {
		this.id = id;
		this.nickname = nickname;
		this.password = password;
		this.email = email;
		this.address = address;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getnickname() {
		return nickname;
	}

	public void setnickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
}