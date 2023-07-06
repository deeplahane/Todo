package com.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class ToDo {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String title;
	private String todo;
	private String status;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTodo() {
		return todo;
	}

	public void setTodo(String todo) {
		this.todo = todo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public ToDo() {
		super();
	}

	public ToDo(int id, String title, String todo, String status) {
		super();
		this.id = id;
		this.title = title;
		this.todo = todo;
		this.status = status;

	}

	public ToDo(String title, String todo, String status) {
		super();
		this.title = title;
		this.todo = todo;
		this.status = status;
	}

}
