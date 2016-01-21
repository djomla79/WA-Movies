package com.bildit.spring.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component("movieDao")
public class MovieDao {
	
private NamedParameterJdbcTemplate jdbc;
	
	@Autowired
	public void setDataSource(DataSource jdbc) {
		this.jdbc = new NamedParameterJdbcTemplate(jdbc);
	}
	
	public List <Movie> getMovies() {
		
		return jdbc.query("select * from movies", new RowMapper<Movie>() {

			public Movie mapRow(ResultSet rs, int rowNum) throws SQLException {
				
				Movie movie = new Movie();
				
				movie.setId(rs.getInt("id"));
				movie.setName(rs.getString("name"));
				movie.setYear(rs.getInt("year"));
				movie.setGenre(rs.getString("genre"));
				movie.setDirector(rs.getString("director"));
				movie.setRuntime(rs.getInt("runtime"));
				
				return movie;
			}
			
		});
		
	}
	
	public boolean delete(Movie movie) {
		
		BeanPropertySqlParameterSource params = new BeanPropertySqlParameterSource(movie);
		
		return jdbc.update("delete from movies where name=:name", params) == 1;
		
	}
	
	@Transactional
	public boolean addMovie(Movie movie) {
		
		BeanPropertySqlParameterSource params = new BeanPropertySqlParameterSource(movie);
		
		return jdbc.update("insert into movies (name, year, genre, director, runtime) "
				+ "values(:name, :year, :genre, :director, :runtime)", params) == 1;

	}
	
	public boolean updateMovie(Movie movie) {
		
		BeanPropertySqlParameterSource params = new BeanPropertySqlParameterSource(movie);
		
		return jdbc.update("update movies set name=:name, year=:year, genre=:genre, director=:director,"
				+ "runtime=:runtime where name=:name", params) == 1;

	}

	public Movie getMovie(String name) {
		
		MapSqlParameterSource params = new MapSqlParameterSource("name","%" + name + "%"); 
		
		return jdbc.queryForObject("select * from movies where name LIKE :name", params, new RowMapper<Movie>() {

			public Movie mapRow(ResultSet rs, int rowNum) throws SQLException {
				
				Movie movie = new Movie();
				
				movie.setId(rs.getInt("id"));
				movie.setName(rs.getString("name"));
				movie.setYear(rs.getInt("year"));
				movie.setGenre(rs.getString("genre"));
				movie.setDirector(rs.getString("director"));
				movie.setRuntime(rs.getInt("runtime"));
				
				return movie;
			}
			
		});
		
	}
	
	public List<Movie> getListMovie(String name) {
		
		MapSqlParameterSource params = new MapSqlParameterSource("name","%" + name + "%"); 
		
		return jdbc.query("select * from movies where name LIKE :name", params, new RowMapper<Movie>() {

			public Movie mapRow(ResultSet rs, int rowNum) throws SQLException {
				
				Movie movie = new Movie();
				
				movie.setId(rs.getInt("id"));
				movie.setName(rs.getString("name"));
				movie.setYear(rs.getInt("year"));
				movie.setGenre(rs.getString("genre"));
				movie.setDirector(rs.getString("director"));
				movie.setRuntime(rs.getInt("runtime"));
				
				return movie;
			}
			
		});
		
	}
	
	public boolean isMovieExists(String name) {
		return jdbc.queryForObject("select count(*) from movies where name=:name", 
				new MapSqlParameterSource("name", name), Integer.class) > 0;
	}
	
}
