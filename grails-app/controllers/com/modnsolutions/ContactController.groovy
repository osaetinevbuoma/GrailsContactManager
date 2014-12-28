package com.modnsolutions



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ContactController {

    static allowedMethods = [
            save: "POST",
            createEmail: "POST",
            createPhoneNumber: "POST",
            addToGroups: "POST",
            update: "PUT",
            updateEmail: "PUT",
            updatePhoneNumber: "PUT",
            delete: "DELETE",
            deleteEmail: "GET",
            deletePhoneNumber: "GET"
    ]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
		
		def contactInstanceList = Contact.findAllByUser(session.user)
		
        withFormat {
			html { [contactInstanceList: contactInstanceList] }
			xml {
				response.status = 200
				render Contact.list(params)
			}
			json {
				response.status = 200
				render Contact.list(params)
			}
		}
    }

    def show(Contact contactInstance) {
        withFormat {
			html { respond contactInstance }
			xml {
				response.status = 200
				render contactInstance
			}
			json {
				response.status = 200
				render contactInstance
			}
		}
    }

    def create() {
        respond new Contact(params)
    }

    @Transactional
    def save(Contact contactInstance) {
        if (contactInstance == null) {
            notFound()
            return
        }

        if (contactInstance.hasErrors()) {
            respond contactInstance.errors, view:'create'
            return
        }

        contactInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.success = "${ contactInstance.firstName } ${ contactInstance.surname } created successfully"
                redirect contactInstance
            }
            '*' { respond contactInstance, [status: CREATED] }
        }
    }

    def edit(Contact contactInstance) {
        respond contactInstance
    }

    @Transactional
    def update(Contact contactInstance) {
        if (contactInstance == null) {
            notFound()
            return
        }

        if (contactInstance.hasErrors()) {
            respond contactInstance.errors, view:'edit'
            return
        }

        contactInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = "Contact has been successfully updated"
                redirect contactInstance
            }
            '*'{ respond contactInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Contact contactInstance) {

        if (contactInstance == null) {
            notFound()
            return
        }

        contactInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = contactInstance.getFirstName() + " " + contactInstance.getSurname() + " has been deleted"
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }
	
	/**
	 * Create email for contact
	 */
	@Transactional
	def createEmail(Email emailAddressesInstance) {
		if (emailAddressesInstance == null) {
            request.withFormat {
                flash.error = "Please enter an email"
                redirect Contact.find(emailAddressesInstance.contact)
            }
			return
		}

		if (emailAddressesInstance.hasErrors()) {
			respond emailAddressesInstance.errors, view: "show"
			return
		}

        /**
         * Ensure that email is unique
         */
        if (Email.findByEmail(emailAddressesInstance.email)) {
            flash.error = "$emailAddressesInstance.email already exist"
            redirect Contact.find(emailAddressesInstance.contact)
            return
        }

		emailAddressesInstance.save flush:true
		
		request.withFormat {
			form multipartForm {
				flash.message = emailAddressesInstance.email + " added for " + emailAddressesInstance.contact.user
				redirect Contact.find(emailAddressesInstance.contact)
			}
			"*" { render status: CREATED }
		}
	}

    /**
     * Display edit email form
     */
    def editEmail() {
        [emailAddressesInstance: Email.get(params.id)]
    }

    /**
     * Update contact email
     */
    @Transactional
    def updateEmail(Email email) {
        if (email == null) {
            notFound()
            return
        }

        email.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = "Email updated successfully"
                redirect action: "show", id: email.contact.id
            }
            "*" { render status: OK }
        }
    }

    /**
     * Delete contact email
     */
    @Transactional
    def deleteEmail() {
        def email = Email.get(params.id)

        if (email == null) {
            notFound()
            return
        }

        email.delete flush: true

        flash.message = "Email has been deleted"
        redirect action: "show", id: email.contact.id, method: "GET"
    }

    /**
     * Create user phone number
     */
    @Transactional
    def createPhoneNumber(PhoneNumber phoneNumber) {
        if (phoneNumber == null) {
            notFound()
            return
        }

        if (phoneNumber.hasErrors()) {
            flash.errors = phoneNumber.errors
            redirect action: "show", id: phoneNumber.contact.id
            return
        }

        phoneNumber.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = "Phone was saved successfully"
                redirect action: "show", id: phoneNumber.contact.id, method: "GET"
            }
            "*" { render status: CREATED }
        }
    }

    /**
     * Display edit phone number view
     */
    def editPhoneNumber() {
        def phoneNumber = PhoneNumber.get(params.id)

        if (phoneNumber == null) {
            notFound()
            return
        }

        [phoneNumberInstance: phoneNumber]
    }

    /**
     * Update contact phone number
     */
    @Transactional
    def updatePhoneNumber(PhoneNumber phoneNumber) {
        if (phoneNumber == null) {
            notFound()
            return
        }

        if (phoneNumber.hasErrors()) {
            flash.errors = phoneNumber.errors
            redirect action: "show", id: phoneNumber.contact.id, method: "GET"
            return
        }

        phoneNumber.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = "Phone number has been updated"
                redirect action: "show", id: phoneNumber.contact.id, method: "GET"
            }
            "*" { render status: OK }
        }
    }

    /**
     * Delete phone number
     */
    @Transactional
    def deletePhoneNumber() {
        def phoneNumber = PhoneNumber.get(params.id)

        if (phoneNumber == null) {
            notFound()
            return
        }

        phoneNumber.delete flush: true

        flash.message = "Phone number deleted successfully"
        redirect action: "show", id: phoneNumber.contact.id, method: "GET"
    }

    /**
     * Add contact to one or more groups
     * Check if the groups were sent as an array of Strings. If so, iterate over the array,
     * Get the group instance and add to contact instance. Else get the group instance and add to the
     * Contact instance
     */
    @Transactional
    def addToGroups() {
        def contactInstance = Contact.get(params.id)

        if (contactInstance == null) {
            notFound()
            return
        }

        if (params.groups instanceof java.lang.String) {
            contactInstance.addToGroups(Groups.get(params.groups))
        } else {
            for (int i = 0; i < params.groups.length; i++) {
                contactInstance.addToGroups(Groups.get(params.groups[i]))
            }
        }

        contactInstance.save flush: true

        request.withFormat {
            form multipatForm {
                flash.message = contactInstance.firstName + " has been added to " + contactInstance.groups
                redirect action: "show", id: contactInstance.id, method: "GET"
            }
            "*" { render status: CREATED }
        }
    }

    @Transactional
    def removeFromGroup() {
        def contactInstance = Contact.get(params.id)

        if (contactInstance == null) {
            notFound()
            return
        }

        contactInstance.removeFromGroups(Groups.get(params.group))
        contactInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = "${ contactInstance.firstName } has been removed from ${ Groups.get(params.group) }"
                redirect action: "show", id: contactInstance.id, method: "GET"
            }
            "*" { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.error = message(code: 'default.not.found.message', args: [message(code: 'contact.label', default: 'Contact'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
