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
        def max = ""
        def avg = ""
        def min = ""
        def total= ""
        
        def product_ID = params.product_ID
        def product_BAR_CODE = params.product_BAR_CODE
        
        if(product_ID){
            def data = Prices.executeQuery("select AVG(p.prices_PRICE) as AVG, MAX(p.prices_PRICE) as MAX, MIN(p.prices_PRICE) as MIN, COUNT(*) as TOTAL " +
                                                  " from Prices as p where p.prices_BAR_CODE = :bc",
                [bc:Long.parseLong(product_BAR_CODE)])
                    
            avg = data[0][0]
            max = data[0][1]
            min = data[0][2]
            total = data[0][3]
            
            //String query = "select (AVG(prices_PRICE)*1.2) as IDEALPRICE from prices where prices_BAR_CODE = 121212454545 and prices_PRICE not in (select prices_PRICE from prices where prices_BAR_CODE = 121212454545 order by prices_PRICE desc limit 2 ) and prices_PRICE not in (select prices_PRICE from prices where prices_BAR_CODE = 121212454545 order by prices_PRICE asc limit 2)"
            //def ip = session.createSQLQuery(query).addEntity("Prices", Prices.class).list()    


            Product product = Product.find("from Product as p where p.product_ID = ?",[Long.parseLong(product_ID)])
            product.executeUpdate("update Product set product_HIGHEST_PRICE = ?, product_AVERAGE_PRICE = ?, product_LOWEST_PRICE = ?," +
                                                    "product_NUMBER_OF_PRICES = ? where product_ID = ?", [max, avg , min ,total,Long.parseLong(product_ID)])
        }

        [prices: prices]

    }

    def newproduct (){        
        def code = params.code        
        def desc = params.desc   
        def barcode = params.barcode
        def error = "ERROR to Save the new Product!"

        if(code && barcode && barcode.toString().length() == 12){
            def pro = new Product()
            pro.setProduct_CODE(code)
            pro.setProduct_BAR_CODE(Long.parseLong(barcode))
            pro.setProduct_DESC(desc)
            if(pro.save()){
                redirect(action: "admin", params: [barcode: barcode])
            }else{                
                [error: error]
            }
        }else{  
            if(barcode && barcode.toString().length() != 12){
                [error: error]
            }
        }             
    }

    def newprice (){        
        def note = params.note        
        def price = params.price   
        def barcode = params.barcode
        def error = "ERROR to Save the new Price!"       

        if(barcode && price && barcode.toString().length() == 12){            
            Product product = Product.find("from Product as p where p.product_BAR_CODE = ?",[Long.parseLong(barcode)])
            if(product.getProduct_BAR_CODE() == Long.parseLong(barcode)){
                Prices pri = new Prices()
                pri.setPrices_BAR_CODE(Long.parseLong(barcode))
                pri.setPrices_PRICE(Double.parseDouble(price))
                pri.setPrices_NOTES(note)
                def newprice= pri.save()
                if(newprice){                   
                    redirect(action: "researcher",params: [product_ID: product.getProduct_ID(), product_BAR_CODE: product.getProduct_BAR_CODE()])
                }else{                
                    [error: error]
                }
            }else{
                [error:error]
            }
        }else{            
            if(barcode && barcode.toString().length() != 12){
                [error: error]
            }
        }       
    }
}