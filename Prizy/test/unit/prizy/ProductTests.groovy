package prizy



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Product)
class ProductTests {

   @Test
   void setupSpec() {
      mockDomain(Product)
   }

   void 'Test first ID of table Prodcut'() {

      when: "We find a product with barCode == 121212454545"
      Product pro = Product.findByProductBarCode(121212454545L)

      then: "We must now that this product has de first id of the table product!"
      pro.productId == 1L
   }
}
