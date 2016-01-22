package prizypricer

import prizypricer.Product

class Prices implements Serializable{

   Long prices_ID = 0L;
   String prices_BAR_CODE = "";
   Double prices_PRICE = 0d;
   String prices_NOTES = "";

   static mapping = {
      id generator: 'increment', name: 'prices_ID'
      version false
   }

   static belongsTo = [prices_ID:Product]
}
