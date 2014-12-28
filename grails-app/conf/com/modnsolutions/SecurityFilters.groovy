package com.modnsolutions

class SecurityFilters {

    def filters = {
        checkLogin(controller:'*', action:'*') {
            before = {
                if (!controllerName && !actionName) {
                    return true
                }

                def allowedActions = ["register", "validate", "index"]

                if (!session.user && !allowedActions.contains(actionName)) {
                    redirect controller: "main", action: "index"
                    return false
                }
            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
    }
}
