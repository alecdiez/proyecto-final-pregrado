package prizy

import com.admin.AdminController
import grails.plugin.spock.IntegrationSpec
import org.junit.Test

class AdminControllerSpec extends IntegrationSpec {

    //This test is only to know that you didn't have any problem to run the script "prizy.backup"
    @Test
    void "Product First Row"() {
        when: 'Bar Code == 121212454545'
        def params =[barCode: 121212454545] //barCode #121212454545 must always be the firt row on table Product
        def p = new AdminController().productTestFirstId(params)

        then: 'The productId must be 1'
        p.product.productId == 1L
    }

    //Here we are testing the "productsWithCriteria" method in Product Domain class
    @Test
    void "Product Find with criteria"() {
        when:'The Bar Code == 121212454545'
        def params = [barCode: '121212454545']
        def p = new AdminController().productTestFindWithCriteria(params)

        then:'The result must be only one row'
        p.product.products.size() == 1

        when:'The Bar Code Like 45'
        def params2 = [barCode: '45']
        def p2 = new AdminController().productTestFindWithCriteria(params2)

        then:'Then the result must have more than one row'
        p2.product.products.size() >= 3 //Here the result must have at least 3 rows!
    }

   /*
    * The first Id of IdealPriceFormula table must be the Original Formula
    * This price is calculated by taking all the prices of this product,
    * removing the 2 highest and 2 lowest, then doing an average
    * with the rest and adding 20% to it.
   */

    @Test
    void "Ideal Price Formula Find First Id"() {
        when:'The Id == 1'
        def params = [idealPriceFormulaId: 1L]
        def ipf = new AdminController().idealPriceFormulaFirstId(params)

        then:'The attributes of the result must be equals to the original formula'
        ipf.original.idealPriceFormulaPercentage == '20'
        ipf.original.idealPriceFormulaMax == '2'
        ipf.original.idealPriceFormulaMin == '2'
    }
}