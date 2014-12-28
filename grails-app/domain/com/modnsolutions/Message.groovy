package com.modnsolutions

class Message {
	String message
	Email email
	Date dateCreated
	Date lastUpdated

	String toString() {
		"$message"
	}
	
	static belongsTo = Email

    static constraints = {
		message nullable: false, blank: false
		email nullable: false
    }
	
	static mapping = {
		autoTimestamp: true
	}
}
