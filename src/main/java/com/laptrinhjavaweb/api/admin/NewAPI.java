package com.laptrinhjavaweb.api.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.laptrinhjavaweb.dto.NewDTO;
import com.laptrinhjavaweb.service.INewService;

@RestController(value="NewAPIOfAdmin")
public class NewAPI {
	
	@Autowired INewService newService;

	@PostMapping("/api/new")
	public NewDTO creatNew(@RequestBody NewDTO newDTO) {
		return newService.save(newDTO);
	}
	
	@PutMapping("/api/new")
	public NewDTO updateNew(@RequestBody NewDTO newDTO) {
		return newService.save(newDTO);
	}
	
//	@DeleteMapping("/api/new")
//	public void deleteNew(@RequestBody Long[] ids) {
//		newService.delete(ids);
//	}
	
	@DeleteMapping("/api/new")
	public void deleteNew(@RequestBody Long id) {
		newService.deleteOne(id);
	}
}
