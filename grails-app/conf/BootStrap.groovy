import com.modnsolutions.Email
import com.modnsolutions.User
import com.modnsolutions.Groups
import com.modnsolutions.Contact

class BootStrap {

    def init = { servletContext ->
		
		/**
		 * User instances
		 */
		def user1 = new User(firstName: "John", surname: "Doe", username: "j.doe", password: "doe").save()
		def user2 = new User(firstName: "Jane", surname: "Doe", username: "jane.doe", password: "doe").save()
		
		/**
		 * Groups users created
		 */
		def group1User1 = new Groups(name: "Family", user: user1).save()
		def group2User1 = new Groups(name: "Friends", user: user1).save()
		def group3User1 = new Groups(name: "Best Friends", user: user1).save()
		
		/**
		 * Contacts for users
		 */
		def contact1User1 = new Contact(firstName: "Bobby", surname: "Charlton", user: user1).save()
		def contact2User1 = new Contact(firstName: "Jane", middleName: "Janet", surname: "Doe", user: user1).save()

		/**
		 * Email for contact users
		 */
		def email1Conact1User1 = new Email(email: "b@yahoo.com", contact: contact1User1).save()
		def email1Conact2User1 = new Email(email: "b@yahoo.com", contact: contact1User1).save()
		def email1Conact3User1 = new Email(email: "c@yahoo.com", contact: contact1User1).save()
		def email1Conact4User1 = new Email(email: "bobby.charlton@yahoo.com", contact: contact1User1).save()
		
    }
    def destroy = {
    }
}
