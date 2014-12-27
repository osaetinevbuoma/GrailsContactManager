package com.modnsolutions

class Message {
	String message
	Email email
	Date dateCreated
	Date lastUpdated
	
	static belongsTo = Email

    static constraints = {
		message nullable: false, blank: false
		email nullable: false
    }
	
	static mapping = {
		autoTimestamp: true
	}
}
