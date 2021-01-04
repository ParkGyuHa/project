package pj.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import pj.dto.pjDTO;
import sqlmap.MybatisManager;

public class pjDAO {
	public String loginCheck(pjDTO dto) {
		String result = "";
		try (SqlSession session = MybatisManager.getInstance().openSession()){
		result = session.selectOne("pj.loginCheck", dto);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public void insert(pjDTO dto) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.insert("pj.insert", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}
	public List<pjDTO> list(int start, int end){
		List<pjDTO> list=null;
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			Map<String,Object> map=new HashMap<>();
			map.put("start", start);
			map.put("end", end);
			list=session.selectList("pj.list", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list;
	}
	public void insert2(pjDTO dto) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.insert("pj.pageinsert", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}
	public String getFileName(int num) {
		String result="";
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			result=session.selectOne("pj.getFileName", num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return result;
	}
	public void plusDown(int num) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.update("pj.plusDown", num);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}
	public pjDTO view(int num) {
		pjDTO dto=null;//ÃÊ±âÈ­
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			dto=session.selectOne("pj.view", num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return dto;
	}
	public void plusReadCount(int num, HttpSession count_session){
		SqlSession session=null;
		try {
			long read_time=0;
			if(count_session.getAttribute("read_time_"+num)!=null){
				read_time=(long)count_session.getAttribute("read_time_"+num);
			}
			long current_time=System.currentTimeMillis();
			session=MybatisManager.getInstance().openSession();
			if(current_time-read_time>5*1000){ 
				session.update("pj.plusReadCount", num);
				session.commit();
				count_session.setAttribute("read_time_"+num, current_time);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
	}
	public List<pjDTO> commentList(int num) {
		List<pjDTO> list=null;
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			list=session.selectList("pj.commentList", num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list;
	}
	public void commentAdd(pjDTO dto) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.insert("pj.commentAdd", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}
	public void updateStep(int ref, int re_step) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			pjDTO dto=new pjDTO();
			dto.setRef(ref);
			dto.setRe_step(re_step);
			session.update("pj.updateStep", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}
	public void reply(pjDTO dto) {
		SqlSession session=null;
		try {
			session = MybatisManager.getInstance().openSession();
			session.insert("pj.reply", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}
	public String passwdCheck(int num, String pawd) {
		String result=null;
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			Map<String,Object> map=new HashMap<>();
			map.put("num", num);
			map.put("pawd", pawd);
			result=session.selectOne("pj.pass_check", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return result;
	}
	public void update(pjDTO dto) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.update("pj.update", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}
	public pjDTO viewReplace(int num) {
		pjDTO dto=null;
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			dto=session.selectOne("pj.view", num);
			String content=dto.getContent();
			content=content.replace("\n", "<br>");
			dto.setContent(content);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return dto;
	}
	public void delete(int num) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.update("pj.delete", num);
            session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}
	public List<pjDTO> searchList(String search_option, String keyword) {
		List<pjDTO> list=null;
		try( SqlSession session=MybatisManager.getInstance().openSession()){
			Map<String,String> map=new HashMap<>();
			map.put("search_option", search_option);
			map.put("keyword", "%"+keyword+"%");
			list=session.selectList("pj.searchList", map);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public int count() {
		int result=0;
		try(SqlSession session=MybatisManager.getInstance().openSession()){
			result = session.selectOne("pj.count");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}