package com.bildit.spring.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Qualifier;
//import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import com.bildit.spring.dao.User;

@Component("userDao")
public class UserDao {
	
private NamedParameterJdbcTemplate jdbc;

//@Qualifier("dbDataSource")
//private DataSource dataSource;

@Autowired
private PasswordEncoder passwordEncoder;
	
	@Autowired
	public void setDataSource(DataSource jdbc) {
		this.jdbc = new NamedParameterJdbcTemplate(jdbc);
	}
	
	public List <User> getUsers() {
		
		return jdbc.query("select * from users", new RowMapper<User>() {

			public User mapRow(ResultSet rs, int rowNum) throws SQLException {
				
				User user = new User();
				
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setLastName(rs.getString("lastName"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setEmail(rs.getString("email"));
				
				return user;
			}
			
		});
		
	}
	/**
	public List<User> getUsers() {
		return jdbc.query("select * from users, authorities where users.username=authorities.username", BeanPropertyRowMapper.newInstance(User.class));
	} */
	
	public boolean delete(User user) {
		
		BeanPropertySqlParameterSource params = new BeanPropertySqlParameterSource(user);
		
		jdbc.update("delete from users where username=:username", params);
		
		return jdbc.update("delete from authorities where username=:username", params) == 1;
		
	}
	@Transactional
	public boolean addUser(User user) {
		
		MapSqlParameterSource params = new MapSqlParameterSource();
		
		params.addValue("name", user.getName());
		params.addValue("lastName", user.getLastName());
		params.addValue("username", user.getUsername());
		params.addValue("password", passwordEncoder.encode(user.getPassword()));
		params.addValue("email", user.getEmail());
		params.addValue("enabled", user.isEnabled());
		params.addValue("authority", user.getAuthority());
		
		
		//BeanPropertySqlParameterSource params = new BeanPropertySqlParameterSource(user);
		
		jdbc.update("insert into users (name, lastName, username, password, email, enabled) "
				+ "values(:name, :lastName, :username, :password, :email, :enabled)", params);
		
		return jdbc.update("insert into authorities (username, authority) values(:username, :authority)", params) == 1;

	}
	
	public boolean updateUser(User user) {
		
		BeanPropertySqlParameterSource params = new BeanPropertySqlParameterSource(user);
		
		return jdbc.update("update users set name=:name, lastName=:lastName, username=:username, password=:password,"
				+ "email=:email where username=:username", params) == 1;

	}

	public User getUser(String username) {
		
		MapSqlParameterSource params = new MapSqlParameterSource("username", username); 
		
		return jdbc.queryForObject("select * from users where username=:username", params, new RowMapper<User>() {

			public User mapRow(ResultSet rs, int rowNum) throws SQLException {
				
				User user = new User();
				
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setLastName(rs.getString("lastName"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setEmail(rs.getString("email"));
				
				return user;
			}
			
		});
		
	}
	
	public boolean isUserExists(String username) {
		return jdbc.queryForObject("select count(*) from users where username=:username", 
				new MapSqlParameterSource("username", username), Integer.class) > 0;
	}
	
}
