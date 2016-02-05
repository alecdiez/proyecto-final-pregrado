package prizy

import com.researcher.ResearcherController
import grails.plugin.spock.IntegrationSpec
import org.junit.Test

class ResearcherControllerSpec extends IntegrationSpec {

   // This will test "calculateData" method in Prices Domain Class
   @Test
    void "We must get the calculated data for the first product"() {
        when:'The Product Bar Code == 121212454545'
        def params = [productBarCode: '121212454545']
        def p = new ResearcherController().pricesTestForCalculateData(params)

        then:'We must have the 4 numbers calculated != null'
        p.product[0][0] != null
        p.product[0][1] != null
        p.product[0][2] != null
        p.product[0][3] != null
    }
}