public class ParseMultipleJsonData {
    public List<CountryDataWrapper> parse() {
        String jsonMessage = '[{'+
        '  \"countryName\": \"India\",'+
        '  \"countryCapital\": \"Delhi\",'+
        '  \"countryCurrency\": \"Indian rupee\"'+
        '},'+
        '{'+
        '  \"countryName\": \"Switzerland\",'+
        '  \"countryCapital\": \"Bern\",'+
        '  \"countryCurrency\": \"Swiss franc\"'+
        '},'+
        '{'+
        '  \"countryName\": \"United States of America\",'+
        '  \"countryCapital\": \"Washington, D.C.\",'+
        '  \"countryCurrency\": \"US Dollar\"'+
        '}]';
        
        return (List<CountryDataWrapper>) System.JSON.deserialize(jsonMessage, List<CountryDataWrapper>.class);
    }
}