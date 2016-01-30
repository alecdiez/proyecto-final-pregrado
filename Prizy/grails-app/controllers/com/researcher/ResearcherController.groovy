package com.researcher

import prizy.Product
import prizy.Prices

class ResearcherController {

    def index() {
        def max = ""
        def avg = ""
        def min = ""
        def total= ""

        def productId = params.productId
        def productBarCode = params.productbarcode
        def prices = Prices.listOrderByPricesId(order: "desc")

        if(productId){
            def data = Prices.executeQuery("select AVG(p.pricesPrice) as AVG, MAX(p.pricesPrice) as MAX, MIN(p.pricesPrice) as MIN, COUNT(*) as TOTAL " +
                                                  " from Prices as p where p.pricesBarCode = :bc",
                [bc:Long.parseLong(productBarCode)])

            avg = data[0][0]
            max = data[0][1]
            min = data[0][2]
            total = data[0][3]        

            def idealPrice = ""

            if(!idealPrice){
                idealPrice = 0d
            }            
            product.executeUpdate("update Product set productHighestPrice = ?, productAveragePrice = ?, productLowestPrice = ?," +
                                                    "productNumberOfPrices = ?, productIdealPrice = ? where productId = ?", [max, avg , min , total, idealPrice, Long.parseLong(productId)])
        }
        [prices: prices]       
    }
    
    def newprice (){
        def note = params.note
        def price = params.price
        def barCode = params.barcode     

        if(barCode && price){          
            def product = Product.exists(Long.parseLong(barCode)) 
            if(product){
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
