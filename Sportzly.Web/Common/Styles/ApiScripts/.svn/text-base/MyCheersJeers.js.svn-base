
cheers = function (data, isCheers) {

    scsHdlr = function (result) {
        var results = getJson(result);
        if (valid(results)) {
            data.Cheers.Cheers(results.Results[0].Cheers);
            data.Cheers.Jeers(results.Results[0].Jeers);
        }
    }

    LikeDislike(scsHdlr, errHdlr, getUser().UserKey, data.Id(), isCheers);
}

