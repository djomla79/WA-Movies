package com.bildit.spring.dao;

import javax.validation.constraints.DecimalMax;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;

public class Movie {

	private int id;
	@NotBlank
	@Size(min=1, max=55, message="Must be min 1 and max 55 characters.")
	private String name;
	@DecimalMin(value="1913")
	@DecimalMax(value="2016")
	private int year;
	@NotBlank
	@Size(min=1, max=45, message="Must be min 3 and max 45 characters.")
	private String genre;
	@NotBlank
	@Size(min=3, max=45, message="Must be min 3 and max 45 characters.")
	private String director;
	@DecimalMin(value="60")
	@DecimalMax(value="300")
	private int runtime;
	
	public Movie() {
	}
	
	public Movie(String name, int year, String genre, String director, int runtime) {
		this.name = name;
		this.year = year;
		this.genre = genre;
		this.director = director;
		this.runtime = runtime;
	}
	
	public Movie(int id, String name, int year, String genre, String director, int runtime) {
		this.id = id;
		this.name = name;
		this.year = year;
		this.genre = genre;
		this.director = director;
		this.runtime = runtime;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public int getRuntime() {
		return runtime;
	}

	public void setRuntime(int runtime) {
		this.runtime = runtime;
	}

}
