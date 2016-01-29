package prizy

import prizy.Product

class Prices implements Serializable{

   Long pricesId = 0L;
   Long pricesBarCode = 0L;
   BigDecimal pricesPrice = new BigDecimal(0);
   String pricesNotes = "";

   static mapping = {
      id generator: 'increment', name: 'pricesId'
      version false
   }
   static belongsTo = [pricesId:Product]
}
