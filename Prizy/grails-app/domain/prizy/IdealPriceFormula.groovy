package prizy

class IdealPriceFormula implements Serializable {

    Long formulaId = 0L
    String formulaDescription = ""
    String formula = ""    
    String formulaIsUsed = ""
    Date formulaDate = new Date()

    static mapping = {
        id generator: 'increment', name: 'formulaId'
        version false
        idealPriceFormulaDate defaultValue: 'now()'
    }
}
