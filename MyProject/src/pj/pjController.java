package pj;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.Constants;
import pj.dao.pjDAO;
import pj.dto.pjDTO;

@WebServlet("/pjController_servlet/*")
public class pjController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url=request.getRequestURL().toString();
		String uri=request.getRequestURI();
		String context=request.getContextPath();
		String contextPath=request.getContextPath();
		pjDAO dao=new pjDAO();
		
		if(uri.indexOf("login.do") != -1) {
			String userid=request.getParameter("userid");
			String passwd=request.getParameter("passwd");
			System.out.println("아이디:"+userid);
			System.out.println("패스워드:"+passwd);
			pjDTO dto=new pjDTO();
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			String result=dao.loginCheck(dto);
			System.out.println(result);
			request.setAttribute("result", result);
			request.setAttribute("userid", userid);
			String page="/Project/pjloginafter.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("insert.do") != -1) {
			String userid=request.getParameter("userid");
			String passwd=request.getParameter("passwd");
			String name=request.getParameter("name");
			String email=request.getParameter("email");
			String phone=request.getParameter("phone");
			System.out.println(userid);
			System.out.println(passwd);
			pjDTO dto=new pjDTO();
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			dto.setName(name);
			dto.setEmail(email);
			dto.setPhone(phone);
			dao.insert(dto);
			String page="/pjController_servlet/main.do";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("main.do") != -1) {
			response.sendRedirect(contextPath + "/Project/pjmain.jsp");
		}else if(url.indexOf("list.do") != -1) {
			int count=dao.count();
			int curPage=1;
			if(request.getParameter("curPage") != null) {curPage=Integer.parseInt(request.getParameter("curPage"));}
			Pager pager=new Pager(count, curPage);//import page.Pager
			int start=pager.getPageBegin();
			int end=pager.getPageEnd();
			List<pjDTO> list=dao.list(start,end);
			request.setAttribute("list", list);
			request.setAttribute("page", pager);
			String page="/Project/pjlist.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("insertpage.do") != -1) {
			File uploadDir=new File(Constants.UPLOAD_PATH);
			if(!uploadDir.exists()) {uploadDir.mkdir();
		}
		MultipartRequest multi=new MultipartRequest(request, Constants.UPLOAD_PATH, Constants.MAX_UPLOAD, "utf-8", new DefaultFileRenamePolicy());
		String writer=multi.getParameter("writer");
		String subject=multi.getParameter("subject");
		String content=multi.getParameter("content");
		String pawd=multi.getParameter("pawd");
		String ip=request.getRemoteAddr();
		String filename=" ";
		int filesize=0;
		try {
			Enumeration files=multi.getFileNames();
			while(files.hasMoreElements()) {
				String file1=(String)files.nextElement();
				filename=multi.getFilesystemName(file1);
				File f1=multi.getFile(file1);
				if(f1 != null) {
					filesize=(int)f1.length();}
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		pjDTO dto=new pjDTO();
		dto.setWriter(writer);
		dto.setSubject(subject);
		dto.setContent(content);
		dto.setPawd(pawd);
		dto.setIp(ip);
		if(filename == null || filename.trim().equals("")) {
			filename="-";
		}		
		dto.setFilename(filename);
		dto.setFilesize(filesize);
		dao.insert2(dto);
		String page="/pjController_servlet/list.do";
		response.sendRedirect(contextPath+page);
		}else if(url.indexOf("download.do") != -1) {
			int num=Integer.parseInt(request.getParameter("num"));
			String filename=dao.getFileName(num);
			System.out.println("첨부파일 이름:"+filename);
			String path=Constants.UPLOAD_PATH+filename;
			byte b[]=new byte[4096];
			FileInputStream fis=new FileInputStream(path);
			String mimeType=getServletContext().getMimeType(path);
			if(mimeType==null) {mimeType="application/octet-stream;charset=utf-8";
			}
			filename = new String(filename.getBytes("utf-8"), "8859_1");
			response.setHeader("Content-Disposition","attachment;filename="+filename);
			ServletOutputStream out=response.getOutputStream();
			int numRead;
			while(true) {
				numRead = fis.read(b,0,b.length);
				if(numRead == -1) break;
				out.write(b, 0, numRead);
			}
			out.flush();
			out.close();
			fis.close();
			dao.plusDown(num);
		}else if(url.indexOf("view.do") != -1) {
			int num=Integer.parseInt(request.getParameter("num"));
			HttpSession session=request.getSession();
			dao.plusReadCount(num, session);
			pjDTO dto=dao.viewReplace(num);
			request.setAttribute("dto", dto);
			String page="/Project/pjview.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response); 
		}else if(url.indexOf("commentList.do") != -1) {
			int num=Integer.parseInt(request.getParameter("num"));
			System.out.println("댓글을 위한 게시물번호:"+num);
			List<pjDTO> list=dao.commentList(num);
			request.setAttribute("list", list);
			String page="/Project/pjcomment_list.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("comment_add.do") != -1) {
			pjDTO dto=new pjDTO();
			int board_num=Integer.parseInt(request.getParameter("board_num"));
			String writer2=request.getParameter("writer2");
			String content2=request.getParameter("content2");
			dto.setBoard_num(board_num);
			dto.setWriter2(writer2);
			dto.setContent2(content2);
			dao.commentAdd(dto);
		}else if(url.indexOf("reply.do") != -1) {
			int num=Integer.parseInt(request.getParameter("num"));
			pjDTO dto=dao.view(num);
			dto.setContent("===작성내용===\n"+dto.getContent()+"\n\n===답변내용===");
			request.setAttribute("dto", dto);
			String page="/Project/pjreply.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("insertReply.do") != -1) {
			int num=Integer.parseInt(request.getParameter("num"));
			pjDTO dto=dao.view(num);
			int ref=dto.getRef();
			int re_step=dto.getRe_step()+1;
			int re_level=dto.getRe_level()+1;
			String writer=request.getParameter("writer");
			String subject=request.getParameter("subject");
			String content=request.getParameter("content");
			String pawd=request.getParameter("pawd");
			dto.setWriter(writer);
			dto.setSubject(subject);
			dto.setContent(content);
			dto.setPawd(pawd);
			dto.setRef(ref);
			dto.setRe_level(re_level);
			dto.setRe_step(re_step);
			dto.setFilename("-");
			dto.setFilesize(0);
			dto.setDown(0); 
			dao.updateStep(ref, re_step);
			dao.reply(dto);
			String page="/pjController_servlet/list.do";
			response.sendRedirect(contextPath + page);
		}else if(url.indexOf("pass_check.do") != -1) {
			int num=Integer.parseInt(request.getParameter("num"));
			String pawd=request.getParameter("pawd");
			String result=dao.passwdCheck(num, pawd);
			String page="";
			if(result != null) {
				page="/Project/pjedit.jsp";
				request.setAttribute("dto", dao.view(num));
				RequestDispatcher rd=request.getRequestDispatcher(page);
				rd.forward(request, response);
			}else {
				page=contextPath+"/pjController_servlet/view.do?num="+num+"&message=error";
				response.sendRedirect(page);
			}
		}else if(url.indexOf("update.do") != -1) {
			File uploadDir=new File(Constants.UPLOAD_PATH);
			if(!uploadDir.exists()) {
				uploadDir.mkdir();
			}
			MultipartRequest multi=new MultipartRequest(request, Constants.UPLOAD_PATH, Constants.MAX_UPLOAD, "utf-8", new DefaultFileRenamePolicy());
			int num=Integer.parseInt(multi.getParameter("num"));
			String writer=multi.getParameter("writer");
			String subject=multi.getParameter("subject");
			String content=multi.getParameter("content");
			String pawd=multi.getParameter("pawd");
			String ip=request.getRemoteAddr();
			String filename=" ";
			int filesize=0;
			try {
				Enumeration files=multi.getFileNames();
				while(files.hasMoreElements()) {
					String file1=(String)files.nextElement();
					filename=multi.getFilesystemName(file1);
					File f1=multi.getFile(file1);
					if(f1 != null) {
						filesize=(int)f1.length();
					}
				}
			} catch (Exception e) {
			e.printStackTrace();
			}		
			pjDTO dto=new pjDTO();
			dto.setNum(num);
			dto.setWriter(writer);
			dto.setSubject(subject);
			dto.setContent(content);
			dto.setPawd(pawd);
			dto.setIp(ip);
			if(filename == null || filename.trim().equals("")) {
				pjDTO dto2=dao.view(num);
				String fName=dto2.getFilename();
				int fSize=dto2.getFilesize();
				int fDown=dto2.getDown();
				dto.setFilename(fName);
				dto.setFilesize(fSize);
				dto.setDown(fDown);
			}else {
				dto.setFilename(filename);
				dto.setFilesize(filesize);
			}
			String fileDel=multi.getParameter("fileDel");
			if(fileDel != null && fileDel.equals("on")) {
				String fileName=dao.getFileName(num);
				File f=new File(Constants.UPLOAD_PATH+fileName);
				f.delete();
				dto.setFilename("-");
				dto.setFilesize(0);
				dto.setDown(0);
			}
			dao.update(dto);
			String page="/pjController_servlet/list.do";
			response.sendRedirect(contextPath+page);
		}else if(url.indexOf("delete.do") != -1) {
			MultipartRequest multi=new MultipartRequest(request, Constants.UPLOAD_PATH, Constants.MAX_UPLOAD, "utf-8", new DefaultFileRenamePolicy());
			int num=Integer.parseInt(multi.getParameter("num"));
			dao.delete(num);
			String page="/pjController_servlet/list.do";
			response.sendRedirect(contextPath+page);
		}else if(url.indexOf("search.do") != -1) {
			String search_option=request.getParameter("search_option");
			String keyword=request.getParameter("keyword");
			List<pjDTO> list=dao.searchList(search_option, keyword);
			request.setAttribute("list", list);
			request.setAttribute("search_option", search_option);
			request.setAttribute("keyword", keyword);
			String page="/Project/pjsearch.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}