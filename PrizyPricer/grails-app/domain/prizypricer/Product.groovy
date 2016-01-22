package prizypricer

import prizypricer.Prices


class Product implements Serializable {
   
   Long product_ID = 0L;
   String product_CODE = "";
   Long product_BAR_CODE = 0L;
   String product_DESC = "";
   Double product_IDEAL_PRICE = 0d;
   Double product_AVAREGE_PRICE = 0d;
   Double product_LOWEST_PRICE = 0d;
   Double product_HIGHEST_PRICE = 0d;
   Long product_NUMBER_OF_PRICES = 0L;

   static constraints = {
      product_CODE blank: false, unique: true
      product_BAR_CODE size: 12, blank: false, unique: true
   }

   static mapping = {
      id generator: 'increment', name: 'product_ID'
      version false
   }

   static hasMany = [product_ID:Prices]

}
