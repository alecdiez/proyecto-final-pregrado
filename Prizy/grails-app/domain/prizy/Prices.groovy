package prizy

import prizy.Product

class Prices implements Serializable{

    Long pricesId = 0L
    Long pricesBarCode = 0L
    BigDecimal pricesPrice = new BigDecimal(0)
    String pricesNotes = ""    
   
    static mapping = {
        id generator: 'increment', name: 'pricesId'
        version false
    }
    static belongsTo = [pricesId:Product]
    
    def calculateData(params){
        def data = this.executeQuery("select AVG(p.pricesPrice) as AVG, MAX(p.pricesPrice) as MAX, MIN(p.pricesPrice) as MIN, COUNT(*) as TOTAL " +
                                                  " from Prices as p where p.pricesBarCode = :bc",
            [bc:Long.parseLong(params.productBarCode)])
        return data
    }
}
