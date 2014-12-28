package com.modnsolutions



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UserController {

    static allowedMethods = [update: "PUT", updatePassword: "PUT", delete: "DELETE"]

    def edit() {
        def userInstance = User.findByUsername(params.username)
        respond userInstance
    }

    @Transactional
    def update(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'edit'
            return
        }

        userInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.success = "Your personal information has been updated"
                redirect mapping: "userAccount", params: [username: userInstance.username]
            }
            '*'{ respond userInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(User userInstance) {

        if (userInstance == null) {
            notFound()
            return
        }

        userInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    /**
     * Show the edit password view
     */
    def editPassword() {
        def userInstance = User.findByUsername(params.username)
        respond userInstance
    }

    /**
     * Update password
     */
    @Transactional
    def updatePassword(User userInstance) {
        if (userInstance.password != params.confirmPassword) {
            flash.error = "Passwords do not match"
            redirect mapping: "changePassword", params: [username: userInstance.username]
            return
        }

        if (userInstance == null) {
            notFound()
            return
        }

        userInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.success = "You have successfully updated your password"
                redirect mapping: "changePassword", params: [username: userInstance.username]
            }
            "*" { render status: OK }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
