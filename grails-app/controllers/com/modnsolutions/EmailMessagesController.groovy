package com.modnsolutions

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional
class EmailMessagesController {

    static allowedMethods = [sendEmail: "POST"]

    /**
     * Show write email view
     * @return Email emailAddress
     */
    def writeEmail() {
        def emailAddress = Email.get(params.id)
        [emailAddress: emailAddress]
    }

    /**
     * Simulate sending email - in later version email functionality will be provided
     */
    @Transactional
    def sendEmail() {
        def emailAddress = Email.get(params.id)
        def messageInstance = new Message(message: params.message, email: emailAddress)

        messageInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.success = "Message sent"
                redirect action: "writeEmail", id: emailAddress.id, method: "GET"
            }
            "*" { render status: OK }
        }
    }

    /**
     * Display the message history for an email
     * @return Message messageInstanceList
     */
    def emailHistory() {
        def emailAddress = Email.get(params.id)
        def messageInstanceList = Message.findAllByEmail(emailAddress)

        withFormat {
            html { [messageInstanceList: messageInstanceList, emailAddress: emailAddress] }
            xml { response.status = 200; render messageInstanceList }
            json { response.status = 200; render messageInstanceList }
        }
    }
}
