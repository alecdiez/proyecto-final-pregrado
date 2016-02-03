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
    
    def formulasOrderBy(){
        def results = this.findAll("from IdealPriceFormula " +
                                    "order by idealPriceFormulaIsUsed desc, " +
                                              "idealPriceFormulaId desc")    
        [results: results]
    }
}
