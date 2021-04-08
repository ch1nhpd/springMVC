package com.laptrinhjavaweb.converter;

import com.laptrinhjavaweb.dto.NewDTO;
import com.laptrinhjavaweb.entity.NewEntity;

public class NewConverter {
	public static NewEntity toEntity(NewDTO newDTO) {
		NewEntity news = new NewEntity();
		news.setTitle(newDTO.getTitle());
		news.setContent(newDTO.getContent());
		news.setShortDescription(newDTO.getShortDescription());
		news.setThumbnail(newDTO.getThumbnail());
		return news;
	}
	
	
	public static NewEntity toEntity(NewEntity oldnew,NewDTO newDTO) {
		oldnew.setTitle(newDTO.getTitle());
		oldnew.setContent(newDTO.getContent());
		oldnew.setShortDescription(newDTO.getShortDescription());
		oldnew.setThumbnail(newDTO.getThumbnail());
		return oldnew;
	}
	

	public static NewDTO toDTO(NewEntity newEntity) {
		NewDTO news = new NewDTO();
		news.setId(newEntity.getId());
		news.setTitle(newEntity.getTitle());
		news.setContent(newEntity.getContent());
		news.setShortDescription(newEntity.getShortDescription());
		try {
			news.setModifiedDate(newEntity.getModifiedDate());
			news.setCategoryCode(newEntity.getCategory().getCode());
			news.setCategoryId(newEntity.getCategory().getId());
		} catch (Exception e) {
		}
		return news;
	}
}