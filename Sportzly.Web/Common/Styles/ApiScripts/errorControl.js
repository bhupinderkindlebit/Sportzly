error = function (msg, cde, tpe) {
    var self = this;
    self.message = msg;
    self.visible = ko.observable();
    self.visible(true);
    self.code = cde;
    self.errTpe = tpe;
    self.getErrColor = function () {
        switch (self.errTpe) {
            case "Error":
                return "Red";
            case "Warn":
                return "Orange";
            case "Message":
                return "Green";
        }
    }
}

ko.bindingHandlers.fade = {
    update: function (element, valueAccessor) {
        // Whenever the value subsequently changes, slowly fade the element in or out
        var err = valueAccessor();
        var value = ko.utils.unwrapObservable(err).visible();
        
        value ? $(element).fadeIn() : $(element).fadeOut('slow',function () { errorModel.errors.remove(err); });
    }
};

function errorViewModel() {
    var self = this;
    self.errors = ko.observableArray([]);
    self.addErr = function (err) { self.errors.push(err); }
    self.removeErr = function (err) {        
        $($('div.error-div').get(err)).hide();
    };
}

var errorModel = new errorViewModel();

ko.applyBindings(errorModel, $('div.error-area').get(0));

//errorModel.addError(new error("TEst", "1001", "Warn"));
//errorModel.addError(new error("TEst", "1001", "Warn"));