package prizy

class IdealPriceFormula implements Serializable {

    Long idealPriceFormulaId = 0L
    String idealPriceFormulaPercentage = ""
    String idealPriceFormulaMax = ""
    String idealPriceFormulaMin = ""
    String idealPriceFormulaIsUsed = ""
    Date idealPriceFormulaDate = new Date()

    static mapping = {
        id generator: 'increment', name: 'idealPriceFormulaId'
        version false
        idealPriceFormulaDate defaultValue: 'now()'
    }
}
