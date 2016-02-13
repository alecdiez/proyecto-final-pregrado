/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com

/**
 *
 * @author Alejandro
 */
public class Context {
    private Strategy strategy;

    public Context(Strategy strategy){
        this.strategy = strategy;
    }

    public BigDecimal executeStrategy(Long barCode, String className, dataSource){
        return strategy.getFormula(barCode, className, dataSource)
    }
}

