package com

import prizypricer.Product
import prizypricer.Prices

class GeneralController {    
    def index() {

    }
   
    def admin (){      
        def barcode = params.barcode      
        def products = "";
        if (barcode == null || barcode.empty) {
            products = Product.findAll("from Product as p order by product_ID desc")
            [products: products]
        }else{
            products = Product.findAll("from Product as p " +
                         "where str(p.product_BAR_CODE) like :barcode",
                [barcode: '%' + barcode + '%'])
            [products: products, barcode:barcode]
        }        
    }
    
    def researcher (){        
        def prices = Prices.findAll("from Prices as p order by prices_ID desc")
        [prices: prices]
    }
    
    def newproduct (){
        
        def code = params.code        
        def desc = params.desc   
        def barcode = params.barcode
         
        if(code && barcode && barcode.toString().length() == 12){
            def pro = new Product()
            pro.setProduct_CODE(code)
            pro.setProduct_BAR_CODE(Long.parseLong(barcode))
            pro.setProduct_DESC(desc)
            if(pro.save()){
                redirect(action: "admin", params: [barcode: barcode])
            }else{
                def error = "ERROR to Save the new Product!"
                [error: error]
            }
        }             
    }
    
    def newprice (){        
        
    }
}