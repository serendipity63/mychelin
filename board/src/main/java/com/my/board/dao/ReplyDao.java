package com.my.board.dao;

import java.util.List;
import java.util.Map;

import com.my.board.dto.Reply;

public interface ReplyDao {
	void insertReply(Reply reply) throws Exception;

	List<Reply> selectReplyList(Map<String, Object> param) throws Exception;
//	List<Reply> selectReplyList(Integer num) throws Exception;

	Integer selectReplyCount(Integer num) throws Exception;

	Reply selectReply(Integer renum) throws Exception;

	void deleteReply(Integer renum) throws Exception;
	
	void deleteFile(Integer num) throws Exception;

}
