public class CountryController {
    private List<CountryDataWrapper> countryDataWrapper;
    
    public void parseJSONData(){
        countryDataWrapper = new ParseMultipleJsonData().parse();
    }
    
    public List<CountryDataWrapper> getCountries(){
        return countryDataWrapper;
    }
}