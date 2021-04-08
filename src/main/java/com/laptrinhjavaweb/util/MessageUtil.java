package com.laptrinhjavaweb.util;

import java.util.HashMap;
import java.util.Map;

public class MessageUtil {
	public static Map<String, String> getMessage (String message){
		Map<String , String> result = new HashMap<>();
		if(message.equals("add_success")) {
			result.put("message", "Thêm bài viết thành công");
			result.put("alert", "success");
		}else if(message.equals("update_success")) {
			result.put("message", "Cập nhật bài viết thành công");
			result.put("alert", "success");
		}else if(message.equals("delete_success")) {
			result.put("message", "Xóa bài viết thành công");
			result.put("alert", "success");
		}else if(message.equals("system_error")) {
			result.put("message", "Lỗi hệ thống!");
			result.put("alert", "danger");
		}
		return result;
	}
}
