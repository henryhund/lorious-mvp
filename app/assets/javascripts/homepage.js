$(document).ready(function(){
  $('#signup').validate({
      rules: {
          fname: "required",
          email: {
            required: true,
            email: true
          }

      },
      messages: {
          fname: "Your name is required",
          email: {
            required: "Your email is required",
            email: "A valid email is required"
          }
      },
      errorContainer: $('#errorContainer1'),
      errorLabelContainer: $('#errorContainer1 ul'),
      wrapper: 'li'
  });
  $('#signup2').validate({
    rules: {
        fname: "required",
        email: {
          required: true,
          email: true
        }


    },
    messages: {
        fname: "Your name is required",
        email: {
          required: "Your email is required",
          email: "A valid email is required"
        }
    },
    errorContainer: $('#errorContainer2'),
    errorLabelContainer: $('#errorContainer2 ul'),
    wrapper: 'li'
  });
  });
