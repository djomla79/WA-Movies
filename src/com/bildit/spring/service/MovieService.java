package com.bildit.spring.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bildit.spring.dao.Movie;
import com.bildit.spring.dao.MovieDao;

@Service("movieService")
public class MovieService {
	
	private MovieDao movieDao;
	
	@Autowired
	public void setMovieDao(MovieDao movieDao) {
		this.movieDao = movieDao;
	}
	
	public List<Movie> getAllMovies() {
		return movieDao.getMovies();
	}
	
	public void addMovie(Movie movie) {
		movieDao.addMovie(movie);
	}
	
	public List<Movie> getListMovie(String name) {
		return movieDao.getListMovie(name);
	}
	
	public Movie getMovie(String name) {
		return movieDao.getMovie(name);
	}
	
	public void deleteMovie(Movie movie) {
		movieDao.delete(movie);
	}
	
	public void updateMovie(Movie movie) {
		movieDao.updateMovie(movie);
	}
	
	public boolean isMovieExists(String name) {
		return movieDao.isMovieExists(name);
	}
	
	/**
	@Secured({"ROLE_ADMIN", "ROLE_USER"})
	public List<Movie> getAllMovies() {
		return movieDao.getMovies();
	}
	
	@Secured("ROLE_ADMIN")
	public void addMovie(Movie movie) {
		movieDao.addMovie(movie);
	}
	
	@Secured({"ROLE_ADMIN", "ROLE_USER"})
	public Movie getMovie(String name) {
		return movieDao.getMovie(name);
	}
	
	@Secured("ROLE_ADMIN")
	public void deleteMovie(Movie movie) {
		movieDao.delete(movie);
	}
	
	@Secured("ROLE_ADMIN")
	public void updateMovie(Movie movie) {
		movieDao.updateMovie(movie);
	}
	*/
	
}
