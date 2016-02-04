package com.admin



import grails.test.mixin.*
import org.junit.*
import prizy.Product
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(AdminController)
class AdminControllerTests extends Specification {

    @Test
    void 'test list of products'() {
        when:
        def pro = controller.index()

        then:
        pro.products == Product.listOrderByProductId(order: "desc")
    }
}
