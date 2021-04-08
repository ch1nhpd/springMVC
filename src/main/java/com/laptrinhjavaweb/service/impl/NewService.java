package com.laptrinhjavaweb.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.laptrinhjavaweb.converter.NewConverter;
import com.laptrinhjavaweb.dto.NewDTO;
import com.laptrinhjavaweb.entity.CategoryEntity;
import com.laptrinhjavaweb.entity.NewEntity;
import com.laptrinhjavaweb.repository.CategoryRepository;
import com.laptrinhjavaweb.repository.NewRepository;
import com.laptrinhjavaweb.service.INewService;

@Service
public class NewService implements INewService{

	@Autowired
	private NewRepository newRepository;
	
	@Autowired
	private CategoryRepository categoryRepository;
	
	@Override
	public List<NewDTO> findAll() {
		List<NewDTO> models= new ArrayList<>();
		List<NewEntity> news = newRepository.findAll();
		for (NewEntity newEntity : news) {
			NewDTO model= NewConverter.toDTO(newEntity);
			models.add(model);
		}
		return models;
	}

	@Override
	public NewDTO findOneById(Long id) {
		NewEntity newEntity=newRepository.findOne(id);
		NewDTO model =NewConverter.toDTO(newEntity);
		return model;
	}

	@Override
	@Transactional
	public NewDTO save(NewDTO news) {
		NewEntity newEntity = new NewEntity();
		CategoryEntity categoryEntity = categoryRepository.findOne(news.getCategoryId());
		if(news.getId()!=null) {
			NewEntity oldNews = newRepository.findOne(news.getId());
			oldNews.setCategory(categoryEntity);
			newEntity = NewConverter.toEntity(oldNews,news);
		}else {
			newEntity=NewConverter.toEntity(news);
			newEntity.setCategory(categoryEntity);
		}
		return NewConverter.toDTO(newRepository.save(newEntity));
	}

	@Override
	@Transactional
	public void delete(Long[] ids) {
		for (Long id : ids) {
			newRepository.delete(id);
		}
	}

	@Override
	@Transactional
	public void deleteOne(Long id) {
		newRepository.delete(id);
	}
	
	
	
}
