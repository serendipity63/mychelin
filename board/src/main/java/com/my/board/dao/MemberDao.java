package com.my.board.dao;

import com.my.board.dto.Member;

public interface MemberDao {
	Member selectMember(String id) throws Exception;

	void insertMember(Member member) throws Exception;

}