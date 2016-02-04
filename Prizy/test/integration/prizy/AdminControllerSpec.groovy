package prizy

import com.admin.AdminController
import grails.plugin.spock.IntegrationSpec
import org.junit.Test

class AdminControllerSpec extends IntegrationSpec {

	def setup() {

	}

	def cleanup() {
	}

   @Test
	void "Product List"() {
      when:
      def model = new AdminController().showBookDetails()

      then:
      model.author == 'Alvin Plantinga'
	}
}