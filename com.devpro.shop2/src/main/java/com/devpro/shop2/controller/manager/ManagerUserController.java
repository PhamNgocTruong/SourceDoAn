package com.devpro.shop2.controller.manager;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.shop2.controller.BaseController;
import com.devpro.shop2.entities.Category;
import com.devpro.shop2.entities.Users;
import com.devpro.shop2.services.UserService;

@Controller
public class ManagerUserController extends BaseController{

	@Autowired
	private UserService userService;
	
	@RequestMapping(value = {"/admin/user" }, method = RequestMethod.GET) // -> action
	public String home(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response)
			throws IOException {
		//can lay danh sach categories tu db va tra ve view qua model
		List<Users> users = userService.findAll();
		 
		//day xuong view de xu ly
		model.addAttribute("users",users);
		
		
		// cac views se duoc dat tai thu muc: 
		return "manager/users"; // -> duong dan toi VIEW.
	}
	
	@RequestMapping(value = { "/admin/adduser" }, method = RequestMethod.GET) // -> action
	public String product(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response)
			throws IOException {
		
		List<Users> users = userService.findAll();
		//day xuong view de xu ly
		model.addAttribute("users",new Users());
		
		
		// cac views se duoc dat tai thu muc: 
		return "manager/adduser"; // -> duong dan toi VIEW.
	}
	
	/*
	 * @RequestMapping(value = { "/admin/edit-category/{categoryId}" }, method =
	 * RequestMethod.GET) // -> action public String editProduct(final Model model,
	 * final HttpServletRequest request, final HttpServletResponse response,
	 * 
	 * @PathVariable("categoryId") int categoryId) throws IOException {
	 * 
	 * Category category = categoriesServices.getById(categoryId);
	 * 
	 * //lay danh sach category
	 * 
	 * //day xuong view de xu ly model.addAttribute("categories",category);
	 * 
	 * 
	 * // cac views se duoc dat tai thu muc: return "manager/addcategories"; // ->
	 * duong dan toi VIEW. }
	 */
	
	@RequestMapping(value= {"/admin/adduser"},method = RequestMethod.POST)
	public String addProduct(final Model Model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			@ModelAttribute("users") Users users)
			
	throws Exception{
		
				
				//kiểm tra xem action là thêm mới hay chỉnh sửa
				if(users.getId()==null||users.getId()<=0 && users.getUsername() == null) {
					users.setPassword(new BCryptPasswordEncoder(4).encode(users.getPassword()));
					userService.save(users);
				}else {
					userService.edit(users);

				}
			
				return "redirect:/admin/user"; 			
	}
	
	@RequestMapping(value = { "/admin/del-user/{id}" }, method = RequestMethod.GET) // -> action
	public String delProduct(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			@PathVariable("id") int id)
			throws IOException {
		
		userService.deleteById(id);
		
		// cac views se duoc dat tai thu muc: 
		return "redirect:/admin/user"; // -> duong dan toi VIEW.
	}
	
	@RequestMapping(value = { "/admin/update-user/{id}" }, method = RequestMethod.GET) // -> action
	public String updateUser(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			@PathVariable("id") int id)
			throws Exception {
		
		Users user = userService.getById(id);
		
		user.setStatus(false);
		
		userService.edit(user);
		
		// cac views se duoc dat tai thu muc: 
		return "redirect:/admin/user"; // -> duong dan toi VIEW.
	}
}
