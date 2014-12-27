package com.modnsolutions

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

class MainController {
	
	/**
	 * Register a new user.
	 * Check constraints to ensure valid entries are made.
	 */
	@Transactional
	def register(User userInstance) {		
		// Check that passwords match
		if (userInstance.password != params.confirm_password) {
			response("Passwords do not match", "error", 400)
			return
		}
		
		// Check for errors
		if (userInstance.hasErrors()) {
			request.withFormat {
				form multipartForm {
					flash.error = userInstance.errors
					redirect uri: "/"
				}
				"*" { 
					render "You have errors" 
					response.status = 400 
				}
			}
			
			return
		}
		
		userInstance.save flush: true // For a production app, passwords should be encrypted
		
		request.withFormat {
			form multipartForm {
				session.user = userInstance
				redirect controller: "contact"
			}
			"*" { 
				render "New user was created successfully" 
				response.status = 200 
			}
		}
	}
	
	/**
	 * Login the user
	 */
	def validate(User userInstance) {
		if (userInstance == null) {
			response("Username and password fields are required", "error", 400)
			return
		}
		
		if (User.findByUsername(userInstance.username) && User.findByPassword(userInstance.password)) {
			session.user = User.findByUsername(userInstance.username)
			request.withFormat {
				form multipart { redirect controller: "contact" }
				"*" { 
					render "User validated"
					response.status = 200
				}
			}
		} 
	}
	
	/**
	 * Logout a user
	 */
	def logout() {
		session.user = null
		redirect uri: "/"
	}
	
	/**
	 * Response when not found
	 */
	protected void response(message, messageType, code) {
		request.withFormat {
			form multipartForm {
				if (messageType == "error") flash.error = message
				else if (messageType == "success") flash.success = message
				
				redirect uri: "/"
			}
			'*'{ 
				render message
				response.status = code 
			}
		}
	}

}
