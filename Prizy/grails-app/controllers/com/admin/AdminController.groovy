package com.admin

import prizy.Product
import prizy.IdealPriceFormula

class AdminController {

    def index() {
        def barcode = params.barcode
        def products = ""
        if (!barcode) {
            products = Product.listOrderByProductId(order: "desc")            
            [products: products]
        }else{          
            products = Product.findAll("from Product as p " +
                         "where str(p.productBarCode) like :barcode",
                [barcode: '%' + barcode + '%'])
            [products: products, barcode:barcode]
        }
    }
    
    def newproduct() {
        def code = params.code
        def desc = params.desc
        def barCode = params.barcode       

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
        def formulas = IdealPriceFormula.findAll("from IdealPriceFormula as i order by idealPriceFormulaIsUsed desc, idealPriceFormulaId desc") 
        def formulaUsed = IdealPriceFormula.findByIdealPriceFormulaIsUsed('S')
        
        def percentage = params.percentage
        def max = params.max
        def min = params.min
        
        if(percentage && max && min){
            IdealPriceFormula ipf = new IdealPriceFormula()            
            ipf.setIdealPriceFormulaPercentage(percentage)
            ipf.setIdealPriceFormulaMax(max)
            ipf.setIdealPriceFormulaMin(min)
            ipf.setIdealPriceFormulaIsUsed('N')
            if(ipf.save(flush: true, failOnError: false)){
                redirect(controller: "admin", action: "idealpriceformula")
            }else{                
                [error: "Error to Save new Formula!"]
            }            
        }
            
        [formulas: formulas, formulaUsed: formulaUsed]
    }
}
