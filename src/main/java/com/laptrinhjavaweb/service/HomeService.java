package com.laptrinhjavaweb.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class HomeService implements IHomeService{

	public List<String> loadMenu() {
		List<String> menus = new ArrayList<String>();
		menus.add("thoi su");
		menus.add("the thao");
		menus.add("giai tri");
		menus.add("cong nghe");
		return menus;
	}
	
}
