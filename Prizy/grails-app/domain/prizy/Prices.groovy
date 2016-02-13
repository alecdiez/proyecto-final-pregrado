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
    static belongsTo = [pricesId: Product]

    def calculateData(params){
        def query = StringBuilder.newInstance()
        query << "SELECT AVG(p.pricesPrice) AS AVG,"
        query << " MAX(p.pricesPrice) AS MAX,"
        query << " MIN(p.pricesPrice) AS MIN, COUNT(*) AS TOTAL "
        query << " FROM Prices AS p WHERE p.pricesBarCode = :bc"
        def data = this.executeQuery(query.toString(),[bc: Long.parseLong(params.productBarCode)])
        return data
    }    
}
