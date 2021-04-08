package com.laptrinhjavaweb.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.laptrinhjavaweb.dto.NewDTO;
import com.laptrinhjavaweb.entity.CategoryEntity;
import com.laptrinhjavaweb.service.ICategoryService;
import com.laptrinhjavaweb.service.INewService;
import com.laptrinhjavaweb.util.MessageUtil;

@Controller(value = "NewControllerOfAdmin")
public class NewController {

	@Autowired
	private INewService newService;
	
	@Autowired
	private ICategoryService categoryService;

	@RequestMapping(value = "/quan-tri/bai-viet/danh-sach", method = RequestMethod.GET)
	public ModelAndView showPage(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("admin/new/list");
		NewDTO model = new NewDTO();
		model.setListResult(newService.findAll());
		mav.addObject("model", model);
		if(request.getParameter("message")!=null) {
			mav.addObject("message",MessageUtil.getMessage(request.getParameter("message")));
		}
		return mav;
	}

	@RequestMapping(value = "/quan-tri/bai-viet/chinh-sua", method = RequestMethod.GET)
	public ModelAndView updatePage(@RequestParam("id") Long id) {
		ModelAndView mav = new ModelAndView("admin/new/edit");
		NewDTO model = new NewDTO();
		try {
			List<CategoryEntity> categories = categoryService.findAll();
			mav.addObject("categories", categories);
			model = newService.findOneById(id);
		} catch (Exception e) {

		}
		
		mav.addObject("model", model);
		return mav;
	}

}
