package com.modnsolutions

import java.util.Date;

class Groups {
	String name
	User user
	Date dateCreated
	Date lastUpdated
	
	String toString() {
		"$name"
	}
	
	static belongsTo = User
	static hasMany = [contacts: Contact]

	static constraints = {
		name nullable: false, blank: false
		contacts nullable: true
	}
	
	static mapping = {
		autoTimestamp true
	}
}
