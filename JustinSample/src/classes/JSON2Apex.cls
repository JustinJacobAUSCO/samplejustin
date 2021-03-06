//
// Generated by JSON2Apex http://json2apex.herokuapp.com/
//

public class JSON2Apex {

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

    public class JSON2Apex2 {
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

    
    public static JSON2Apex parse(String json) {
        return (JSON2Apex) System.JSON.deserialize(json, JSON2Apex.class);
    }
}