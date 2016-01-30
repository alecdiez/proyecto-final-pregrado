package com.admin

import prizy.Product

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
}
