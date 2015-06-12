var eventObjViewModel = function () {
    var self = this;
    self.Result = ko.observableArray();
    self.addeventObj = function (eventObj) { self.Result.push(eventObj); }
    self.clear = function () { self.Result.removeAll(); }
    self.deleventObj = function (act) { self.Result.remove(act); }
    self.PendingResultCount = ko.observable();
    this.load = function () {
        var emId = "";
        //var criteria = geteventObjQueryString();
        scsHdlr = function (result) {
            var results = getJson(result);
            if (valid(results)) {
                self.PendingResultCount(results.Results.length);
              
                for (var d in results.Results) {
                    var model = ko.mapping.fromJS(results.Results[d]);
                    self.addeventObj(model);                    
                }
                
                //                self.Result = ko.mapping.fromJS(results);
                bindeventObjList();
            }
        }
        
        GetUserEventsNotification(scsHdlr, errHdlr, getUser().UserKey, emId, 5);
    }
    self.load();
}
var eventObjModel = new eventObjViewModel();



bindeventObjList = function () {
   
    ko.applyBindings(eventObjModel, $('.eventObjsList').get(0));   
    if (eventObjModel.PendingResultCount() > 0) {
        $('#spCalenderResult').show();
        $('#spCalenderResult').text(eventObjModel.PendingResultCount());
    } else {
        $('#spCalenderResult').hide();
    }
}



//eventObjModel.load();

joinEvent = function (data, response) {

    var id = data.EventId();
    var userKey = getUser().UserKey;

    scsHdlr = function (result) {
        var results = getJson(result);
        if (valid(results)) {
            //eventObjModel.load();
            eventObjModel.PendingResultCount(eventObjModel.PendingResultCount() - 1);
            eventObjModel.Result.remove(data);
            if (eventObjModel.PendingResultCount() > 0) {
                $('#spCalenderResult').show();
                $('#spCalenderResult').text(eventObjModel.PendingResultCount());
            } else {
                $('#spCalenderResult').hide();
            }
            //if (eventObjModel)
            //    eventObjModel.load();
        }
    }
    JoinEvent(scsHdlr, errHdlr, userKey, id, response);

}