package com.admin

import prizy.Product

class AdminController {

   def index() {
      def barcode = params.barcode
      def products = "";
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
      def barcode = params.barcode
      def error = "ERROR to Save the new Product!"

      if(code && barcode && barcode.toString().length() == 12){
         def pro = new Product()
         pro.setProduct_CODE(code)
         pro.setProduct_BAR_CODE(Long.parseLong(barcode))
         pro.setProduct_DESC(desc)
         if(pro.save()){
            redirect(controller: "admin", action: "index", params: [barcode: barcode])
         }else{
            [error: error]
         }
      }else{
         if(barcode && barcode.toString().length() != 12){
            [error: error]
         }
      }

   }

}
