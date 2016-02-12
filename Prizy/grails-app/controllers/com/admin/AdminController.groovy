package com.admin

import prizy.Product
import prizy.IdealPriceFormula

class AdminController {

    def index() {
        def barCode = params.barCode
        def products
        if (!barCode) {
            products = Product.listOrderByProductId(order: "desc")
            [products: products]
        }else{
            products = new Product().productsWithCriteria(params)
            [products: products.products, barCode: barCode]
        }
    }

    def newproduct() {
        def code = params.code
        def desc = params.desc
        def barCode = params.barCode

        if(code && barCode){
            def pro = new Product()
            pro.setProductCode(code)
            pro.setProductDesc(desc)
            pro.setProductBarCode(Long.parseLong(barCode))
            if(pro.save(flush: true, failOnError: false)){
                redirect(controller: "admin", action: "index", params: [barCode: barCode])
            }else{
                [error: "Error to Save new Product!"]
            }
        }
    }

    def idealpriceformula(){
        def formulas = IdealPriceFormula.listOrderByFormulaIsUsed()
        def formulaUsed = IdealPriceFormula.findByFormulaIsUsed('Y')        
        def idPick = params.idPick
        def error = ""
        

        if(idPick){
            IdealPriceFormula pick = IdealPriceFormula.findByFormulaId(Long.parseLong(idPick))
            formulaUsed.setFormulaIsUsed('N')
            if(formulaUsed.save(flush: true, failOnError: false)){
                pick.setFormulaIsUsed('Y')
                if(pick.save(flush: true, failOnError: false)){
                    redirect(controller: "admin", action: "idealpriceformula")
                }else{
                    error = "Error to Update the Formula Used!"
                }
            }else{
                error = "Error to Update the Formula Used!"
            }
        }

        [formulas: formulas.results, formulaUsed: formulaUsed, error: error]
    }

    /*Next Methods are only for Integration Test*/

    def productTestFirstId(params) {
        [ product: Product.findByProductBarCode(params.barCode)]
    }

    def productTestFindWithCriteria(params) {
        [ product: new Product().productsWithCriteria(params)]
    }

   def idealPriceFormulaFirstId(params) {
        [ original: IdealPriceFormula.findByIdealPriceFormulaId(params.idealPriceFormulaId)]
    }

}
