package com.researcher

import prizy.Product
import prizy.Prices
import prizy.IdealPriceFormula

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
            def data = new Prices().calculateData(params)
            
            avg = new BigDecimal(data[0][0])
            max = new BigDecimal(data[0][1])
            min = new BigDecimal(data[0][2])
            total = data[0][3]

            IdealPriceFormula formulaUsed = IdealPriceFormula.findByIdealPriceFormulaIsUsed('Y')

            def formulaUsedPercentage = formulaUsed.getIdealPriceFormulaPercentage()
            def fp = new BigDecimal(formulaUsedPercentage).divide(100)+1
            def formulaUsedMax = Long.parseLong(formulaUsed.getIdealPriceFormulaMax())
            def formulaUsedMin = Long.parseLong(formulaUsed.getIdealPriceFormulaMin())

            def result = new Prices().sqlQueries(params, fp, formulaUsedMax, formulaUsedMin)
//continuar 03/02/2016
            def idealPrice
            if(result[0][0]){
                idealPrice = new BigDecimal(result[0][0])
            }else{
                idealPrice = new BigDecimal(0)
            }

            Product product = Product.findByProductId(Long.parseLong(productId))
            product.executeUpdate("update Product set productHighestPrice = ?, productAveragePrice = ?, productLowestPrice = ?," +
                                   "productNumberOfPrices = ?, productIdealPrice = ?, productFormulaId = ? where productId = ?",
                [max, avg , min , total, idealPrice, formulaUsed.getIdealPriceFormulaId(), Long.parseLong(productId)])
        }
        [prices: prices]
    }

    def newprice (){
        def note = params.note
        def price = params.price
        def barCode = params.barcode

        if(barCode && price){
            Product product = Product.findByProductBarCode(Long.parseLong(barCode))
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
