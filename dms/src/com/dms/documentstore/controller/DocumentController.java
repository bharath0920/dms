package com.dms.documentstore.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.dms.documentstore.model.DMSDocument;
import com.dms.documentstore.service.DocumentService;

@Controller
@RequestMapping("/document")
public class DocumentController {

	@Autowired
	private DocumentService documentService;

	@RequestMapping(value = { "/", "/listDocuments/" })
	public String listDocuments(Map<String, Object> map) {
		map.put("document", new DMSDocument());
		map.put("documentList", documentService.listDocuments());
		return "listDocuments";
	}

	/**
	 * Upload single file using Spring Controller
	 */
	@RequestMapping(value = "/addDocument", method = RequestMethod.POST)
	public String addDocument( Map<String, Object> map,
			@RequestParam("file") MultipartFile file) {
		System.out.println("Add Document Method Triggered");
		if (!file.isEmpty()) {
			try {
				System.out.println("File Created :: "+file.getOriginalFilename());
				map.put("document", new DMSDocument());
				map.put("documentList", documentService.listUpadtedDocuments());
				return "listDocuments";
				//return "redirect:listDocuments";
			} catch (Exception e) {
				return "You failed to upload ";
			}
		} else {
			return "You failed to upload because the file was empty.";
		}
	}

}
