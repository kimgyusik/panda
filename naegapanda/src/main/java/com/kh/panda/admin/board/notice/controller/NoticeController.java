package com.kh.panda.admin.board.notice.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.panda.admin.board.notice.model.service.NoticeService;
import com.kh.panda.admin.board.notice.model.vo.Notice;
import com.kh.panda.common.PageInfo;
import com.kh.panda.common.Pagination;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService nService;
	
	@RequestMapping("nlist.do")
	public ModelAndView selectList(ModelAndView mv, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
		
		// 공지사항 총 갯수
		int listCount = nService.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Notice> list = nService.selectList(pi);
		
		//System.out.println(list);
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("admin/board/noticeListView");
		
		return mv;
		
	}
	
	@RequestMapping("ninsertView.do")
	public String noticeInsertView() {
		return "admin/board/noticeInsertForm";
	}
	
	@RequestMapping("ninsert.do")
	public String inserNotice(Notice n, HttpServletRequest request, Model model,
						     @RequestParam(name="uploadFile", required=false) MultipartFile file) {
		
		System.out.println(n);
		System.out.println(file.getOriginalFilename());
		
		if(!file.getOriginalFilename().equals("")) { // 첨부파일이 넘어온 경우
			
			String nRenameFileName = saveFile(file, request);
			
			if(nRenameFileName != null) {
				n.setnOriginalFileName(file.getOriginalFilename());
				n.setnRenameFileName(nRenameFileName);
			}
		}
		
		int result = nService.insertNotice(n);
		
		if(result > 0) {
			return "redirect:nlist.do";
		}else {
			model.addAttribute("msg", "게시판 작성 실패!!");
			return "common/errorPage";
		}
	}
	
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		
		// 파일이 저장될 경로 설정
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath= root + "\\nupload";
		
		File folder = new File(savePath);	// 저장될 폴더
		
		if(!folder.exists()) {	// 폴더가 없다면
			folder.mkdirs();	// 폴더 생성해라
		}
		
		String nOriginalFileName = file.getOriginalFilename();	// 원본명 (확장자)
		
		// 파일명 수정작업 --> 년월일시분초.확장자
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		String nRenameFileName = sdf.format(new Date(System.currentTimeMillis()))	// 년월일시분초
								+ nOriginalFileName.substring(nOriginalFileName.lastIndexOf("."));
		
		// 실제 저장될 경로 savePath + 저장하고자 하는 파일명 nRenameFileName
		String renamePath = savePath + "\\" + nRenameFileName;	// resources\nupload\20120312451232.jpg
		
		try {
			file.transferTo(new File(renamePath));	// 이때 서버에 업로드 됨
			
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return nRenameFileName;	// 수정명 반환
		
	}
	
	
}
