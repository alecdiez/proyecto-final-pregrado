package com.researcher

import prizy.Product
import prizy.Prices
import prizy.IdealPriceFormula
import com.Context

class ResearcherController {   
    
    def dataSource
    
    def index() {
        def max
        def avg
        def min
        def total
        def updateProduct        
        def idealPrice = new BigDecimal(0)
        
        def productId = params.productId
        def productBarCode = params.productBarCode
        def prices = Prices.listOrderByPricesId(order: "desc")

        if(productId){
            def data = new Prices().calculateData(params)

            avg = new BigDecimal(data[0][0])
            max = new BigDecimal(data[0][1])
            min = new BigDecimal(data[0][2])
            total = data[0][3]

            IdealPriceFormula formulaUsed = IdealPriceFormula.findByFormulaIsUsed('Y')     
            
            def formulaClassName = Class.forName('com.' + formulaUsed.getFormulaName(), true, Thread.currentThread().contextClassLoader).newInstance()    
            
            Context context = new Context(formulaClassName)
            idealPrice = context.executeStrategy(Long.parseLong(productBarCode), formulaUsed.getFormulaName(), dataSource)
        
            Product product = Product.findByProductId(Long.parseLong(productId))
            updateProduct = new Product().saveDataProduct( product, max, avg , min , total, idealPrice, formulaUsed.getFormulaId())
            
        }
        [prices: prices, updateProduct: updateProduct]
    }
    
    def newprice(){
        def note = params.note ? params.note.trim() : params.note
        def price = params.price
        def barCode = params.barCode

        if(barCode && price){
            Product product = Product.findByProductBarCode(Long.parseLong(barCode))
            if(product){
                Prices pri = new Prices()
                pri.setPricesBarCode(Long.parseLong(barCode))
                pri.setPricesPrice(new BigDecimal(price))
                pri.setPricesNotes(note)
                def newprice= pri.save(flush: true, failOnError: false)
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

    /*Next Methods are only for Integration Test*/

    def pricesTestForCalculateData(params) {
        [ product:  new Prices().calculateData(params)]
    }
    
    def idealPriceStrategy(params) {
        def idealPriceStored = Product.findByProductBarCode(Long.parseLong(params.barCode))
        def idealPrice = new BigDecimal(0)
        def formulaClassName = Class.forName(params.formulaUrl, true, Thread.currentThread().contextClassLoader).newInstance()            
        Context context = new Context(formulaClassName)
        idealPrice = context.executeStrategy(Long.parseLong(params.barCode), params.formulaName, dataSource)
        [ ip:  idealPrice, ips: idealPriceStored.productIdealPrice]
    }
}
