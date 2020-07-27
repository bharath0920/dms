package com.dms.documentstore.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import com.dms.documentstore.model.DMSDocument;

@Service
public class DocumentService {

	public void saveDocument(DMSDocument dmsDocument) {
		//FileNet code to save document

	}

	public List<DMSDocument> listDocuments() {
		// As of now code hard-coded, we need to write filenet code to read list of documents
		DMSDocument dmsDocument = null;
		List<DMSDocument> dmsDocumentList=new ArrayList<DMSDocument>();
		for(int i=0;i<=10;i++) {
			dmsDocument=new DMSDocument();
			dmsDocument.setAttId("Att"+i);
			dmsDocument.setTid("Tid"+i);
			dmsDocument.setDocumentTitle("Title"+i);
			dmsDocument.setCreatedBy("Creator"+i);
			dmsDocument.setCreatedDate(new Date());
			dmsDocumentList.add(dmsDocument);

		}
		return dmsDocumentList;
	}

	public DMSDocument getDocument(String attid) {
		// TODO Auto-generated method stub
		return null;
	}

	public void deleteBook(String attid) {
		// TODO Auto-generated method stub

	}

	public List<DMSDocument> listUpadtedDocuments() {
		// As of now code hard-coded, we need to write filenet code to read list of documents
		DMSDocument dmsDocument = null;
		List<DMSDocument> dmsDocumentList=new ArrayList<DMSDocument>();
		for(int i=0;i<=10;i++) {
			dmsDocument=new DMSDocument();
			dmsDocument.setAttId("Bharath"+i);
			dmsDocument.setTid("Shaji"+i);
			dmsDocument.setDocumentTitle("Khader"+i);
			dmsDocument.setCreatedBy("Satish"+i);
			dmsDocument.setCreatedDate(new Date());
			dmsDocumentList.add(dmsDocument);
		}
		return dmsDocumentList;
	}

}
