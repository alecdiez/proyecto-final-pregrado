package prizy

import com.admin.AdminController
import grails.plugin.spock.IntegrationSpec
import org.junit.Test

class AdminControllerSpec extends IntegrationSpec {    

    //This test is only to know that you didn't have any problem to run the script "prizy.backup"
    @Test
    void "Product First Row"() {
        when: 'Bar Code == 454545787878'
        def params =[barCode: 121212454545L] //barCode #121212454545 must always be the firt row on table Product
        def p = new AdminController().productTestFirstId(params)

        then: 'The productId must be 1'
        p.product.productId == 2L
    }
    
    //This test is proving the "productsWithCriteria" method in Product Domain class"
    @Test
    void "Product Find with criteria"() {
        when:'The Bar Code == 121212454545'
        def params = [barCode: '12'] 
        def p = new AdminController().productTestFindWithCriteria(params)

        then:'The result must be only one row'
        p.product.size() > 1
        
        /*when:'The Bar Code Like 45'
        def params2 = [barCode: '45'] 
        def p2 = new AdminController().productTestFindWithCriteria(params2)

        then:'Then the result must have more than one row'
        p2.product.size() > 1*/
    }
}