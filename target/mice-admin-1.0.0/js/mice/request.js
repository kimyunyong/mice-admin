;(function($) {
    'use strict';

    //basic request obj
    var request = function(url, data) {
        this.url = url;
        this.data = data;
		
        // this.setData = function(data) {
        //     this.data = data;
        //     return this;
        // };

        // this.setUrl = function(url) {
        //     this.url = url;
        //     return this;
        // };

        // this.setType = function(type) {
        //     this.type = type;
        //     return this;
        // };

        // this.setDataType = function(dataType) {
        //     this.dataType = dataType;
        //     return this;
        // };
        
        // this.setCache = function(isCache){
        // 	this.cache = isCache;
        // 	return this;
        // };
    };

    //ajax for calling
    $.makeAjax = function(url, data) {
    	var instance = new request(url, data);
        instance.send = function(callback) {
        	if(!checkOnline(callback)){
				return instance;
    		}
            $.ajax({
                url: instance.url,
                data: instance.data || undefined,
                type: instance.type || 'GET',
                dataType: instance.dataType || 'jsonp',
                cache: instance.cache || false,
                success: function(result) {
                    callback && callback(true, result);
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    var result = {
                        jaXHR: jqXHR,
                        textStatus: textStatus,
                        errorThrown: errorThrown
                    };

                    callback && callback(false, result);
                }
            });
        };

        return instance;
    };


    //ajax for calling api
    $.makeAjaxApi = function(url, dtype, data) {
        var instance = new request(url, data);

        instance.send = function(callback) {
			if(!checkOnline(callback)){
				return instance;
    		}

            $.ajax({
                url: instance.url,
                data: instance.data || undefined,
                type: 'POST',
                dataType: dtype,
                cache: instance.cache || false,
                success: function(result) {
                    callback && callback(true, result);
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    var result = {
                        jaXHR: jqXHR,
                        textStatus: textStatus,
                        errorThrown: errorThrown
                    };
                    callback && callback(false, result);
                }
            });
        };

        return instance;
    };


    function checkOnline(callback){
        if(!navigator.onLine){
            var result = {
                jaXHR: {"status":0},
                textStatus: "인터넷 연결 끈겼습니다.\n 인터넷 연결후 사용하세요.",
                errorThrown: null
            };
            callback && callback(false, result);
            return false;
        }
        return true;
    }

}(jQuery));