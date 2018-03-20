public with sharing class ContinuationController {
  
    // Result of callout
    public class GlossEntry {
        public String ID;
        public String SortAs;
        public String GlossTerm;
        public String Acronym;
        public String Abbrev;
        public GlossDef GlossDef;
        public String GlossSee;
    }

    public class GlossDef {
        public String para;
        public List<String> GlossSeeAlso;
    }

    public class ResponseClass {
        public Glossary glossary;
    }

    public class Glossary {
        public String title;
        public GlossDiv GlossDiv;
    }

    public class GlossList {
        public GlossEntry GlossEntry;
    }

    public class GlossDiv {
        public String title;
        public GlossList GlossList;
    }

    
    public static ResponseClass parse(String json) {
        return (ResponseClass) System.JSON.deserialize(json, ResponseClass.class);
    }

    public String result {get;set;}
    
    
    public void startRequest()
    {
    //make a web callout to an external endpoint. The response received will be stored in string; below is the sample of the response string
        String sampleResponse = '{"glossary":{"title":"example glossary","GlossDiv":{"title":"S","GlossList":{"GlossEntry":{"ID":"SGML","SortAs":"SGML","GlossTerm":"Standard Generalized Markup Language","Acronym":"SGML","Abbrev":"ISO 8879:1986","GlossDef":{"para":"A meta-markup language, used to create markup languages such as DocBook.","GlossSeeAlso":["GML","XML"]},"GlossSee":"markup"}}}}}';

        ResponseClass parsedObj = parse(sampleResponse);

        result = parsedObj.glossary.GlossDiv.GlossList.GlossEntry.ID;
    }
}