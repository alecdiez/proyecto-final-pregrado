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
        def formulas = new IdealPriceFormula().formulasOrderBy()
        IdealPriceFormula formulaUsed = IdealPriceFormula.findByIdealPriceFormulaIsUsed('Y')

        def percentage = params.percentage
        def max = params.max
        def min = params.min
        def idPick = params.idPick
        def error = ""

        if(percentage && max && min){
            IdealPriceFormula isNewFormula = IdealPriceFormula.findWhere([idealPriceFormulaPercentage: percentage, idealPriceFormulaMax: max, idealPriceFormulaMin: min])
            if(!isNewFormula){
                IdealPriceFormula ipf = new IdealPriceFormula()
                ipf.setIdealPriceFormulaPercentage(percentage)
                ipf.setIdealPriceFormulaMax(max)
                ipf.setIdealPriceFormulaMin(min)
                ipf.setIdealPriceFormulaIsUsed('N')
                if(ipf.save(flush: true, failOnError: false)){
                    redirect(controller: "admin", action: "idealpriceformula")
                }else{
                    error = "Error to Save new Formula!"
                }
            }else{
                error = "Formula already exists!"
            }
        }

        if(idPick){
            IdealPriceFormula pick = IdealPriceFormula.findByIdealPriceFormulaId(Long.parseLong(idPick))
            formulaUsed.setIdealPriceFormulaIsUsed('N')
            if(formulaUsed.save(flush: true, failOnError: false)){
                pick.setIdealPriceFormulaIsUsed('Y')
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
}
