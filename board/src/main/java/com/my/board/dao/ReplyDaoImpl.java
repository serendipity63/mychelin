package com.my.board.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.board.dto.Reply;

@Repository
public class ReplyDaoImpl implements ReplyDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public void insertReply(Reply reply) throws Exception {
		sqlSession.insert("mapper.reply.insertReply", reply);

	}

	@Override
	public List<Reply> selectReplyList(Map<String, Object> param) throws Exception {
		return sqlSession.selectList("mapper.reply.selectReplyList", param);
	}

	@Override
	public Reply selectReply(Integer renum) throws Exception {
		return sqlSession.selectOne("mapper.reply.selectReply", renum);
	}

	@Override
	public Integer selectReplyCount(Integer num) throws Exception {
		return sqlSession.selectOne("mapper.reply.selectReplyCount", num);
	}

	@Override
	public void deleteReply(Integer renum) throws Exception {
		sqlSession.delete("mapper.reply.deleteReply", renum);

	}

	@Override
	public void deleteFile(Integer num) throws Exception {
		sqlSession.delete("mapper.reply.deleteFile", num);

	}

}
