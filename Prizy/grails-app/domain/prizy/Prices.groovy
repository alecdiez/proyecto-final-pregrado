package prizy

import prizy.Product
import groovy.sql.Sql

class Prices implements Serializable{

   Long pricesId = 0L;
   Long pricesBarCode = 0L;
   BigDecimal pricesPrice = new BigDecimal(0);
   String pricesNotes = "";
  
   def sessionFactory
   
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

   def sqlQueries(params, fp, formulaUsedMin, formulaUsedMax){

      def sql = new Sql(sessionFactory.currentSession.connection())
      def result  = sql.rows("select (AVG(prices_price) * :fp) from Prices " +
                                "where prices_bar_code = :bc and prices_price not in " +
                                "(select prices_price from Prices where prices_bar_code = :bc " +
                                "order by prices_price desc limit :fi ) and prices_price not in " +
                                "(select prices_price from Prices where prices_bar_code = :bc " +
                                "order by prices_price asc limit :fm)",
         [bc: Long.parseLong(params.productBarCode), fp: fp, fi: formulaUsedMin, fm: formulaUsedMax])
      return [result: result]
   }

   def saveDataProduct(max, avg , min , total, idealPrice, idealPriceFormulaId, productId, product){

      try {
         product.executeUpdate("update Product set productHighestPrice = ?, productAveragePrice = ?, productLowestPrice = ?," +
                                   "productNumberOfPrices = ?, productIdealPrice = ?, productFormulaId = ? where productId = ?",
            [max, avg , min , total, idealPrice, idealPriceFormulaId, productId])

         [resultOK: "Updated Data for Product # " + productId +""]
      } catch (Exception e) {
         [resultError: e.getMessage()]
      }

   }
}
