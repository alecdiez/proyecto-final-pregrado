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
    
    // This will test ideal price formula strategy only for the first test!! after you some changes this test will fail.
    @Test
    void "Ideal Price Strategy"() {
        
        when:'Formula = Original'
        def params = [formulaUrl: 'com.Original', barCode: '121212454545', formulaName: 'Original']
        def idealPrice = new ResearcherController().idealPriceStrategy(params)

        then:'Ideal Price Calculated is equal to Ideal Price Stored'
        idealPrice.ip == idealPrice.ips    
        
        
        when:'Formula = Simple'
        params = [formulaUrl: 'com.Simple', barCode: '898989454545', formulaName: 'Simple']
        idealPrice = new ResearcherController().idealPriceStrategy(params)

        then:'Ideal Price Calculated is equal to Ideal Price Stored'
        idealPrice.ip == idealPrice.ips
        
        
        when:'Formula = Newest'
        params = [formulaUrl: 'com.Newest', barCode: '787878454545', formulaName: 'Newest']
        idealPrice = new ResearcherController().idealPriceStrategy(params)

        then:'Ideal Price Calculated is equal to Ideal Price Stored'
        idealPrice.ip == idealPrice.ips
        
        
        when:'Formula = LargeProfit'
        params = [formulaUrl: 'com.LargeProfit', barCode: '989898787878', formulaName: 'LargeProfit']
        idealPrice = new ResearcherController().idealPriceStrategy(params)

        then:'Ideal Price Calculated is equal to Ideal Price Stored'        
        idealPrice.ip == idealPrice.ips
        
        
        when:'Formula = MostRepeated'
        params = [formulaUrl: 'com.Newest', barCode: '656565454545', formulaName: 'MostRepeated']
        idealPrice = new ResearcherController().idealPriceStrategy(params)

        then:'Ideal Price Calculated is equal to Ideal Price Stored'
        idealPrice.ip == idealPrice.ips
    }
}