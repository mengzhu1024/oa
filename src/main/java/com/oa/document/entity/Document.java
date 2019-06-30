package com.oa.document.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @author huwenlong
 */
@Data
public class Document implements Serializable {

	private static final long serialVersionUID = 1L;

	private String id;

	private String name;

	private String path;

	private String disk;

	private Date uploadTime;

	private Boolean locked;

	private String uploaderId;

	private String depId;

	private Date gmtCreate;

	private Date gmtModified;

    public Document() {
    	
	}

	public Document(String id, String name, String path, String disk, Date uploadTime, String uploaderId,
			String depId) {
		this.id = id;
		this.name = name;
		this.path = path;
		this.disk = disk;
		this.uploadTime = uploadTime;
		this.uploaderId = uploaderId;
		this.depId = depId;
	}
}