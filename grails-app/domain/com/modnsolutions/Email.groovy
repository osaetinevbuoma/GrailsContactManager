package com.modnsolutions

class Email {
	String email
	Contact contact
	Date dateCreated
	Date lastUpdated
	
	String toString() {
		"$email"
	}

	static belongsTo = Contact
	static hasMany = [messages: Message]
	
    static constraints = {
		email nullable: false, blank: false, email: true
		contact nullable: false
		messages nullable: true
    }
	
	static mapping = {
		autoTimestamp: true
	}
}
