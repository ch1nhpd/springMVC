package com.laptrinhjavaweb.service;

import java.util.List;

import com.laptrinhjavaweb.dto.NewDTO;

public interface INewService {
	List<NewDTO> findAll();
	NewDTO findOneById(Long id);
	NewDTO save(NewDTO news);
	void delete(Long[] ids);
	void deleteOne(Long id);
}
