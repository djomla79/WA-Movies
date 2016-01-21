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

import com.bildit.spring.service.UserService;
import com.bildit.spring.dao.User;

@Controller
public class UserController {
	
	private UserService userService;
	
	@Autowired
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	/**
	@RequestMapping(value="/login", method=RequestMethod.POST)
    public String loginPage(Model model, @RequestParam(value="error") String error,
    @RequestParam(value="username", requested=true) String username) {
         
        if (error != null) {
            model.addAttribute("error", "Invalid username or password.");
        }
        
         User user = userService.getUser(username);
		model.addAttribute("user", user);
        
        return "login";
	} */
	
	@RequestMapping("/userpage")
	public String showUserPage() {
		return "userpage";
	}
	
	@RequestMapping("/getusers")
	public String showUsers(Model model) {
		
		List<User> users = userService.getAllUsers();
		
		model.addAttribute("users", users);
		
		return "getusers";
	}
	
	@RequestMapping("/signup")
	public String signupUser(Model model) {
		
		model.addAttribute("user", new User());
		
		return "signup";
	}
	
	@RequestMapping(value="/signupuser", method=RequestMethod.POST)
	public String addingUser(Model model, @Valid User user, BindingResult result) {
		
		if (result.hasErrors()) {
			return "signup";
		}
		
		user.setAuthority("ROLE_USER");
		user.setEnabled(true);
		
		if (userService.isUserExists(user.getUsername())) {
			result.rejectValue("username", "DuplicateKey.user.username");
			return "signup";
		}
		
		try {
			userService.addUser(user);			
		} catch (DuplicateKeyException e) {
			result.rejectValue("username", "DuplicateKey.user.username");
			return "signup";
		}
		model.addAttribute("messageOk", "User "+user.getName()+" "+user.getLastName()+" is successfully registered.");
		return "messages";
	}
	
	@RequestMapping("/addadmin")
	public String addAdmin(Model model) {
		
		model.addAttribute("user", new User());
		
		return "addadmin";
	}
	
	@RequestMapping(value="/addingadmin", method=RequestMethod.POST)
	public String addingAdmin(Model model, @Valid User user, BindingResult result) {
		
		if (result.hasErrors()) {
			return "addadmin";
		}
		
		user.setAuthority("ROLE_ADMIN");
		user.setEnabled(true);
		
		if (userService.isUserExists(user.getUsername())) {
			result.rejectValue("username", "DuplicateKey.user.username");
			return "addadmin";
		}
		
		try {
			userService.addUser(user);			
		} catch (DuplicateKeyException e) {
			result.rejectValue("username", "DuplicateKey.user.username");
			return "addadmin";
		}
		model.addAttribute("messageOk", "Admin "+user.getName()+" "+user.getLastName()+" is successfully registered.");
		return "messages";
	}
	
	@RequestMapping("/deleteuser")
	public String deleteUser(Model model, String username) {
		
		model.addAttribute("username", username);
		
		return "deleteuser";
	}
	
	@RequestMapping(value="/deletinguser", method=RequestMethod.POST)
	public String deletingUser(Model model, String username) {
		
			User user = userService.getUser(username);
			userService.deleteUser(user);
			model.addAttribute("messageOk", "User "+user.getName()+" "+user.getLastName()+" is successfully deleted.");
			return "messages";
	}
	
	@RequestMapping("/getuser")
	public String showUser2(Model model, String username) {
		
		model.addAttribute("username", username);
		
		return "getuser";
	}
	
	@RequestMapping(value="/gettinguser", method=RequestMethod.POST)
	public String showAUser(Model model, String username) {
		
		User user = userService.getUser(username);
		model.addAttribute("user", user);
		
		return "listuser";
	}
	
	@RequestMapping("/updateuser1")
	public String updateUser(Model model, String username) {
		
		model.addAttribute("username", username);
		
		return "updateuser1";
	}
	
	@RequestMapping(value="/updatinguser1", method=RequestMethod.POST)
	public String updatingUser1(Model model, String username) {
		
		User user = userService.getUser(username);
		model.addAttribute("user", user);
		return "updateuser";
	}
	
	@RequestMapping(value="/updatinguser", method=RequestMethod.POST)
	public String updatingUser1(Model model, @Valid User user, BindingResult result) {
		
		if (result.hasErrors()) {
			model.addAttribute("messageError", "User is not updated.");
			return "updateuser";
		}
		
		userService.updateUser(user);
		model.addAttribute("messageOk", "User "+user.getName()+" "+user.getLastName()+" is successfully updated.");
		return "messages";
			
	}	
	
	@ExceptionHandler(EmptyResultDataAccessException.class)
	public String handleDBException(EmptyResultDataAccessException ex) {
		return "userexception";
	}
	
}
