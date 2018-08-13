package org.j2ee.ssh;

import java.util.regex.Pattern;

import com.opensymphony.xwork2.ActionSupport;

public class RegAndLoginAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private LoginUser user;
	
	
	
	public LoginUser getUser() {
		return user;
	}



	public void setUser(LoginUser user) {
		this.user = user;
	}



	public String Reg() throws Exception
	{
		if(this.user.getUsername() == null || this.user.getUsername().equals(""))
		{
			this.addFieldError("user.username", "User name can not be null!");
		}
		else if(!Pattern.matches("^[a-zA-z][a-zA-z0-9]_{3,14}$", this.user.getUsername() ) )
		{
			this.addFieldError("user.username", "User name must start with letter, and length must be 4- 15");
		}
		else if(this.user.getPassword() == null || this.user.getPassword().equals(""))
		{
			this.addFieldError("user.password", "password not null");			
		}
		else if(!this.user.getPassword().equals(this.user.getPassword2() ))
		{
			this.addFieldError("user.password2", "password not matched");
		}
		else if(this.user.getAge() <16)
		{
			this.addFieldError("user.age", "must be older than 16");
		}
		
		if(this.hasFieldErrors())
			return LOGIN;
		System.out.println("Reg success");
		return SUCCESS;
	}

}
