function ajax(url, vars, callbackFunction) {

    if (window.XMLHttpRequest) {
        request = new XMLHttpRequest();
    }
    else if (window.ActiveXObject) {
        request = new ActiveXObject("Microsoft.XMLHTTP");
    }

  request.open("POST", url, true);
  request.setRequestHeader("Content-Type",
                           "application/x-www-form-urlencoded");
 
  request.onreadystatechange = function() {
    var done = 4, ok = 200;
    if (request.readyState == done && request.status == ok) {
      if (request.responseText) {
        callbackFunction(request.responseText);
      }
    }
  };
  request.send(vars);
}

function echo_response(text)
{
	alert(text);
}

function no_response()
{
}