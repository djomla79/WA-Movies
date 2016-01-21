package com.bildit.spring.controllers;

import java.util.List;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.bildit.spring.dao.Movie;
import com.bildit.spring.service.MovieService;

@Controller
public class MovieController {
	
	private MovieService movieService;

	@Autowired
	public void setMovieService(MovieService movieService) {
		this.movieService = movieService;
	}
	
	@RequestMapping("/getmovies")
	public String getMovies(Model model) {
		
		List<Movie> movies = movieService.getAllMovies();
		
		model.addAttribute("movies", movies);
		
		return "getmovies";
	}
	
	@RequestMapping("/addmovie")
	public String addMovie(Model model) {
		
		model.addAttribute("movie", new Movie());
		
		return "addmovie";
	}
	
	@RequestMapping(value="/addingmovie", method=RequestMethod.POST)
	public String addingUser(Model model, @Valid Movie movie, BindingResult result) {
		
		if (result.hasErrors()) {
			return "addmovie";
		}
		
		if (movieService.isMovieExists(movie.getName())) {
			result.rejectValue("name", "DuplicateKey.movie.name");
			return "addmovie";
		}
		
		try {
			movieService.addMovie(movie);		
		} catch (DuplicateKeyException e) {
			result.rejectValue("name", "DuplicateKey.movie.name");
			return "addmovie";
		}
		model.addAttribute("messageOk", "Movie '"+ movie.getName() +"' is successfully added.");
		return "messages";
	}
	
	@RequestMapping("/deletemovie")
	public String deleteMovie(Model model, String name) {
		
		model.addAttribute("name", name);
		
		return "deletemovie";
	}
	
	@RequestMapping(value="/deletingmovie", method=RequestMethod.POST)
	public String deletingMovie(Model model, String name) {
		
			Movie movie = movieService.getMovie(name);
			movieService.deleteMovie(movie);
			model.addAttribute("messageOk", "Movie "+ name +" is successfully deleted.");
			return "messages";
	}
	
	@RequestMapping("/getmovie")
	public String showMovie(Model model, String name) {
		
		model.addAttribute("name", name);
		
		return "getmovie";
	}
	
	@RequestMapping(value="/gettingmovie", method=RequestMethod.POST)
	public String showAMovie(Model model, String name) {
		
		List <Movie> movie = movieService.getListMovie(name);
		model.addAttribute("movie", movie);
		
		return "listmovie";
	}
	
	@RequestMapping("/updatemovie1")
	public String updateMovie(Model model, String name) {
		
		model.addAttribute("name", name);
		
		return "updatemovie1";
	}
	
	@RequestMapping(value="/updatingmovie1", method=RequestMethod.POST)
	public String updatingMovie1(Model model, String name) {
		
		Movie movie = movieService.getMovie(name);
		model.addAttribute("movie", movie);
		return "updatemovie";
	}
	
	@RequestMapping(value="/updatingmovie", method=RequestMethod.POST)
	public String updatingMovie1(Model model, @Valid Movie movie, BindingResult result) {
		
		if (result.hasErrors()) {
			model.addAttribute("messageError", "Movie is not updated.");
			return "updatemovie";
		}
		
		movieService.updateMovie(movie);
		model.addAttribute("messageOk", "Movie "+ movie.getName() +" is successfully updated.");
		return "messages";
			
	}
	
	@ExceptionHandler(EmptyResultDataAccessException.class)
	public String handleDBException(EmptyResultDataAccessException ex) {
		return "moviexception";
	}
	
}
