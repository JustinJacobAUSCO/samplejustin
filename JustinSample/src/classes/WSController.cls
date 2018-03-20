public class WSController {
    public JSON2Apex info { get; set; }

    String jsonStr = '{"DateModifiedUtc":"2016-09-07T20:12:47.1519119Z",' + 
'"AgentInfoList":[{"Username":"Agent00@gmail.com","PriorityNumber":0}, ' +
'{"Username":"Agent01@gmail.com","PriorityNumber":0},{"Username":"Agent02@gmail.com","PriorityNumber":0},' +
'{"Username":"Agent03@gmail.com","PriorityNumber":0},{"Username":"Agent04@gmail.com","PriorityNumber":0},' +
'{"Username":"Agent05@gmail.com","PriorityNumber":0},{"Username":"Agent06@gmail.com","PriorityNumber":0},' +
'{"Username":"Agent07@gmail.com","PriorityNumber":0},{"Username":"Agent08@gmail.com","PriorityNumber":0},' +
'{"Username":"Agent09@gmail.com","PriorityNumber":0},{"Username":"Agent10@gmail.com","PriorityNumber":0},' +
'{"Username":"Agent11@gmail.com","PriorityNumber":0},{"Username":"Agent00@gmail.com","PriorityNumber":1},' +
'{"Username":"Agent01@gmail.com","PriorityNumber":1},{"Username":"Agent02@gmail.com","PriorityNumber":1},' +
'{"Username":"Agent03@gmail.com","PriorityNumber":1},{"Username":"Agent04@gmail.com","PriorityNumber":1},' +
'{"Username":"Agent05@gmail.com","PriorityNumber":1},{"Username":"Agent06@gmail.com","PriorityNumber":1},' +
'{"Username":"Agent07@gmail.com","PriorityNumber":1},{"Username":"Agent08@gmail.com","PriorityNumber":1},' +
'{"Username":"Agent09@gmail.com","PriorityNumber":1},{"Username":"Agent10@gmail.com","PriorityNumber":1},' +
'{"Username":"Agent11@gmail.com","PriorityNumber":1},{"Username":"Agent00@gmail.com","PriorityNumber":2},' +
'{"Username":"Agent01@gmail.com","PriorityNumber":2},{"Username":"Agent02@gmail.com","PriorityNumber":2},' +
'{"Username":"Agent03@gmail.com","PriorityNumber":2},{"Username":"Agent04@gmail.com","PriorityNumber":2},' +
'{"Username":"Agent05@gmail.com","PriorityNumber":2},{"Username":"Agent06@gmail.com","PriorityNumber":2},' +
'{"Username":"Agent07@gmail.com","PriorityNumber":2},{"Username":"Agent08@gmail.com","PriorityNumber":2},' +
'{"Username":"Agent09@gmail.com","PriorityNumber":2},{"Username":"Agent10@gmail.com","PriorityNumber":2},' +
'{"Username":"Agent11@gmail.com","PriorityNumber":2}]}';

    //wrapper class
    public class JSON2Apex 
    {
        public String DateModifiedUtc { get; set; }
        public List<AgentInfoList> AgentInfoList { get; set; }
    }
    public class AgentInfoList 
   {
        public String Username { get; set; }
        public Integer PriorityNumber { get; set; }
    }
    public static JSON2Apex parse(String json) 
    {
        return (JSON2Apex) System.JSON.deserialize(json, JSON2Apex.class);
    }
    public WSController() {
        info = (JSON2Apex)parse(jsonStr);
    }
}