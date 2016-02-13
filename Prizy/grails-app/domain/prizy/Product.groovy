package prizy

import prizy.Prices

class Product implements Serializable {

    Long productId = 0L;
    Long productBarCode = 0L;
    Long productNumberOfPrices = 0L;
    Long productFormulaId = 0L;
    String productCode = "";
    String productDesc = "";
    BigDecimal productIdealPrice = new BigDecimal(0);
    BigDecimal productAveragePrice = new BigDecimal(0);
    BigDecimal productLowestPrice = new BigDecimal(0);
    BigDecimal productHighestPrice = new BigDecimal(0);

    static constraints = {        
        productCode blank: false
        productBarCode size: 12, blank: false
    }

    static mapping = {
        version false
        id generator: 'increment', name: 'productId'
        dynamicUpdate true        
    }
    static hasMany = [productId:Prices]
   
    def productsWithCriteria(params){        
        def products = this.findAll("FROM Product AS p WHERE str(p.productBarCode) LIKE :bc",
            [bc: '%' + params.barCode + '%'])       
        [products: products]             
    }
    
    def saveDataProduct(Product product, max, avg , min , total, idealPrice, formulaId){

        try {
            product.setProductHighestPrice(max)
            product.setProductLowestPrice(min)
            product.setProductAveragePrice(avg)
            product.setProductNumberOfPrices(total)
            product.setProductIdealPrice(idealPrice)
            product.setProductFormulaId(formulaId)
            if(product.save(flush: true, failOnError: true)){
                [resultOk: "Updated Data for Product # " << product.getProductId() ]
            }else{
                [resultError: "Error Updating Product # " << product.getProductId() ]
            }

            [resultOK: "Updated Data for Product # " << product.getProductId()]
        } catch (Exception e) {
            [resultError: e.getMessage()]
        }

    }
}
