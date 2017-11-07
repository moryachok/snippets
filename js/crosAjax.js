//message, url, callback, method, deviceDetect
function callAjax(params){
    var method = (typeof params.method!="undefined") ? params.method: "GET";
    var contentType = (params.contentType) ? params.contentType : "application/x-www-form-urlencoded";
    var callback = (params.callback) ? params.callback : function(){};
    var xhr;
    // compatible with IE7+, Firefox, Chrome, Opera, Safari
    if(navigator.userAgent.indexOf("MSIE 9") > -1){
        xhr = new XDomainRequest();
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

    setTimeout(function () {
        xhr.send(params.message);
    }, 0);

}
