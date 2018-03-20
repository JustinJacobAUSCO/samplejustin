public class WSController2 {
    public JSON2Apex info { get; set; }

    String jsonStr = '{"glossary": {"title": "example glossary","GlossDiv": { "title": "S", "GlossList": {"GlossEntry": {"ID": "SGML","SortAs": "SGML","GlossTerm": "Standard Generalized Markup Language","Acronym": "SGML","Abbrev": "ISO 8879:1986","GlossDef":{"para": "A meta-markup language, used to create markup languages such as DocBook.","GlossSeeAlso": ["GML", "XML"]},"GlossSee": "markup"}}}}}';


 public class JSON2Apex 
    {
        public String ID { get; set; }
       
    }

 
    public static JSON2Apex parse(String json) 
    {
        return (JSON2Apex) System.JSON.deserialize(json, JSON2Apex.class);
    }
    public WSController2() {
        info = (JSON2Apex)parse(jsonStr);
        system.debug('+++++++++++++++++++++++++++'+info);
    }
}