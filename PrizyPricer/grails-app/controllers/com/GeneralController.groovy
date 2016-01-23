package com

import prizypricer.Product

class GeneralController {    
    def index() {

    }
   
    def admin (){      
        def barcode = params.barcode      
        def products = "";
        if (barcode == null || barcode.empty) {
            products = Product.findAll()
            [products: products]
        }else{
            products = Product.findAll("from Product as p " +
                         "where p.product_BAR_CODE = :barcode",
                [barcode: Long.parseLong(barcode)])
            [products: products, barcode:barcode]
        }
    }
    
    def researcher (){
        
        
    }
    
    def newproduct (){
        def code = params.code
        def barcode = params.barcode
        def desc = params.desc
         [code:code, barcode:barcode, desc:desc]           
        }      
       
}
