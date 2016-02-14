/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com

import groovy.sql.Sql
import prizy.IdealPriceFormula

/**
 *
 * @author Alejandro
 */
class MostRepeated implements Strategy {
    
    @Override
    public BigDecimal getFormula(Long barCode, String className, dataSource) {        
        def formula = IdealPriceFormula.findByFormulaName(className)
        def sql = new Sql(dataSource)        
        def idealPrice  = sql.rows(formula.getFormula(),[bc: barCode])
        return idealPrice[0][0] ? new BigDecimal(idealPrice[0][0]) : new BigDecimal(0)
    }
	
}

