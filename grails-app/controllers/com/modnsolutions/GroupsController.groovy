package com.modnsolutions



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class GroupsController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def create() {
		def groupsInstanceList = Groups.findAllByUser(session.user)
		
        respond new Groups(params), model: [groupInstanceList: groupsInstanceList]
    }

    @Transactional
    def save(Groups groupsInstance) {
        if (groupsInstance == null) {
            notFound()
            return
        }

        if (groupsInstance.hasErrors()) {
            respond groupsInstance.errors, view:'create'
            return
        }

        groupsInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = groupsInstance.name + " was successfully created"
                redirect action: "create"
            }
            '*' { respond groupsInstance, [status: CREATED] }
        }
    }

    def edit(Groups groupsInstance) {
        respond groupsInstance
    }

    @Transactional
    def update(Groups groupsInstance) {
        if (groupsInstance == null) {
            notFound()
            return
        }

        if (groupsInstance.hasErrors()) {
            respond groupsInstance.errors, view:'edit'
            return
        }

        groupsInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = "Update was successful"
                redirect action: "create"
            }
            '*'{ respond groupsInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Groups groupsInstance) {

        if (groupsInstance == null) {
            notFound()
            return
        }

        groupsInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = groupsInstance.name + " was deleted"
                redirect action:"create", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'groups.label', default: 'Groups'), params.id])
                redirect action: "create", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
