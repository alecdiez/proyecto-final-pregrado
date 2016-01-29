package prizy

import prizy.Prices

class Product implements Serializable {

   Long productId = 0L;
   Long productBarCode = 0L;
   Long productNumberOfPrices = 0L;
   String productCode = "";
   String productDesc = "";
   BigDecimal productIdealPrice = new BigDecimal(0);
   BigDecimal productAveragePrice = new BigDecimal(0);
   BigDecimal productLowestPrice = new BigDecimal(0);
   BigDecimal productHighestPrice = new BigDecimal(0);


   static constraints = {
      productCode blank: false, unique: true
      productBarCode size: 12, blank: false, unique: true
   }

   static mapping = {
      id generator: 'increment', name: 'productId'
      version false
   }
   static hasMany = [productId:Prices]
}
