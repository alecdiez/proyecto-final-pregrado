package com.researcher

import prizy.Product
import prizy.Prices

class ResearcherController {

    def index() {
        def max = ""
        def avg = ""
        def min = ""
        def total = ""

        def productId = params.productId
        def productBarCode = params.productBarCode
        def prices = Prices.listOrderByPricesId(order: "desc")

        if(productId){
            def data = Prices.executeQuery("select AVG(p.pricesPrice) as AVG, MAX(p.pricesPrice) as MAX, MIN(p.pricesPrice) as MIN, COUNT(*) as TOTAL " +
                                                  " from Prices as p where p.pricesBarCode = :bc",
                [bc:Long.parseLong(productBarCode)])

            avg = new BigDecimal(data[0][0])
            max = new BigDecimal(data[0][1])
            min = new BigDecimal(data[0][2])
            total = data[0][3]        

            BigDecimal idealPrice = new BigDecimal(0)
            
            Product product = Product.findByProductId(Long.parseLong(productId))
            product.executeUpdate("update Product set productHighestPrice = ?, productAveragePrice = ?, productLowestPrice = ?," +
                                   "productNumberOfPrices = ?, productIdealPrice = ? where productId = ?",
                [max, avg , min , total, idealPrice, Long.parseLong(productId)])
                                               
           
        }
        [prices: prices]       
    }
    
    def newprice (){
        def note = params.note
        def price = params.price
        def barCode = params.barcode     

        if(barCode && price){          
            Product product = Product.findByProductBarCode(Long.parseLong(barCode))
            if(product.getProductBarCode() == Long.parseLong(barCode)){
                Prices pri = new Prices()
                pri.setPricesBarCode(Long.parseLong(barCode))
                pri.setPricesPrice(new BigDecimal(price))
                pri.setPricesNotes(note)
                def newprice= pri.save()
                if(newprice){
                    redirect(action: "index", params: [productId: product.getProductId(), productBarCode: product.getProductBarCode()])
                }else{
                    [error: "Error to Save new Price!."]
                }   
            }else{
                [error: "Product doesn't Exists!."]
            }
        }
    }
}
