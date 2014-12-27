package com.modnsolutions

class User {
	String firstName
	String surname
	String username
	String password
	Date dateCreated
	Date lastUpdated
	
	String toString() {
		"$firstName $surname"
	}
	
	static hasMany = [contacts: Contact]

    static constraints = {
		firstName nullable: false, blank: false
		surname nullable: false, blank: false
		username nullable: false, blank: false, unique: true
		password nullable: false, blank: false
		contacts nullable: true
    }
	
	static mapping = {
		autoTimestamp: true
	}
}
