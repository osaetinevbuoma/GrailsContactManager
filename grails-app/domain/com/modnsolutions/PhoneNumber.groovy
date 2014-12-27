package com.modnsolutions

class PhoneNumber {
	int countryCode
	int areaCode
	Long phoneNumber
	int extension
	Contact contact
	Date dateCreated
	Date lastUpdated
	
	String toString() {
		"($countryCode) - [$areaCode] $phoneNumber - $extension"
	}
	
	static belongsTo = Contact

    static constraints = {
		countryCode nullable: false, blank: false
		areaCode nullable: true, blank: true
		phoneNumber nullable: false, blank: false
		extension nullable: true, blank: true
		contact nullable: false
    }
	
	static mapping = {
		autoTimestamp: true
	}
}
