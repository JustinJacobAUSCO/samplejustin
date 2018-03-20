public class GlossaryController {
    private List<GlossaryDataWrapper> glossaryDataWrapper;
    
    public void parseJSONData(){
        glossaryDataWrapper= new ParseMultipleJsonData2().parse();
    }
    
    public List<GlossaryDataWrapper> getglossaries(){
        return glossaryDataWrapper;
    }
}