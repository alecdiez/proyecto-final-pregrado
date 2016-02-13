package prizy

class IdealPriceFormula implements Serializable {

    Long formulaId = 0L
    String formulaDescription = ""
    String formula = ""    
    String formulaIsUsed = ""
    Date formulaDate = new Date()

    static mapping = {
        version false
        id generator: 'increment', name: 'formulaId'        
        formulaDate defaultValue: 'now()'
        formula type: 'text', size: 1..5000
    }
}
