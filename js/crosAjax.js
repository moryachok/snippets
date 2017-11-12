
/**

callAjax()

    This is crossdomain, crossbrowser ajax call.
    Support of IE9+

    @Params:
        .message, .url, .callback, .method
*/
function callAjax(params){
    var method = (typeof params.method!="undefined") ? params.method: "GET";
    var contentType = (params.contentType) ? params.contentType : "application/x-www-form-urlencoded";
    var callback = (params.callback) ? params.callback : function(){};
    var xhr;

    if(navigator.userAgent.indexOf("MSIE 9") > -1){
        xhr = new XDomainRequest(); // XDomainRequest allows IE9 crossdomain call
        xhr.onload = function(){params.callback(xhr.responseText);};
        xhr.onprogress = function () { };
        xhr.ontimeout = function () { };
        xhr.onerror = function () { };
        xhr.open(method, params.url, true);
    }else{

        xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function(){
            if (xhr.readyState == 4 && xhr.status == 200){
                callback(xhr.responseText);
            }
        }
        xhr.open(method, params.url, true);
        xhr.setRequestHeader("Content-Type", contentType);
    }

    // Async ajax approach in old browsers (IE9)
    setTimeout(function () {
        xhr.send(params.message);
    }, 0);

}
