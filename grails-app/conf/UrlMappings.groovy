class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        name userAccount: "/user/$username/personal-information" {
            controller = "user"
            action = "edit"
        }

        name changePassword: "/user/$username/change-password" {
            controller = "user"
            action = "editPassword"
        }

        "/"(view:"/index")
        "500"(view:'/error')
	}
}
