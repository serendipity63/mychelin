package com.my.board.dao;

import java.util.List;

import com.my.board.dto.Reply;

public interface ReplyDao {
	void insertReply(Reply reply) throws Exception;

//	List<Reply> selectReplyList(Integer row) throws Exception;
	List<Reply> selectReplyList(Integer num) throws Exception;

	Integer selectReplyCount() throws Exception;

	Reply selectReply(Integer renum) throws Exception;

	void deleteReply(Integer renum) throws Exception;
	
	void deleteFile(Integer num) throws Exception;

}
