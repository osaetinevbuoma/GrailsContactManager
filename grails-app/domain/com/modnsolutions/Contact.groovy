package com.modnsolutions

class Contact {
	String firstName
	String middleName
	String surname
	User user
	Date dateCreated
	Date lastUpdated
	
	String toString() {
		"$firstName $middleName $surname"
	}
	
	static belongsTo = [User, Groups]
	static hasMany = [emailAddresses: Email, phoneNumbers: PhoneNumber, groups: Groups]

    static constraints = {
		firstName nullable: false, blank: false
		middleName nullable: true, blank: true
		surname nullable: false, blank: false
		user nullable: false
		emailAddresses nullable: true
		phoneNumbers nullable: true
		groups nullable: true
    }
	
	static mapping = {
		autoTimestamp: true
	}
}
