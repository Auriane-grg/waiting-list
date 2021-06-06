const errorsNewForm= () => {
  const inputs = document.querySelectorAll('.input')
  const submit = document.getElementById('submit-btn')
  const phone = document.getElementById('input-phone')
  const email = document.getElementById('input-email')

  // Do not execute the validation if you are not in the new form page :
  if (!submit) { return };



  // Error messages if submit and blank fields
  submit.addEventListener('click', () => {
    inputs.forEach((input) => {
      if (input.value === "") {
        input.nextElementSibling.innerText = "This field is mandatory: please fill it."
      };
    });
  });


  // Dynamic error messages when changing fields
  inputs.forEach((input) => {
    // No field should be blank
    input.addEventListener('focus', () => {
      if (input.value === "") {
        input.nextElementSibling.innerText = "This field is mandatory: please fill it."
      };
    });
    input.addEventListener('change', () => {
      if (input.value != "") {
        input.nextElementSibling.innerText = ""
      };

      // Phone field must look like 0618290348
      phone.addEventListener('change', () => {
        if (/^[0-9]{10}$/.test(phone.value) === false) {
          phone.nextElementSibling.innerText = "Your phone should match this format : 0619028349 (10 digits)."
        } else {
          phone.nextElementSibling.innerText = ""
        }
      });

      // Email field you look like an email adress
      email.addEventListener('change', () => {
        if (/^[A-Za-z0-9._%+-]+@[A-Za-z0-9]{2,6}\.[A-Za-z]{2,4}$/.test(email.value) === false) {
          email.nextElementSibling.innerText = "Your email does not seem valid."
        } else {
          email.nextElementSibling.innerText = ""
        }
      });
    });
  });

}

export { errorsNewForm }

// TO DO : add error message is email is already taken => TURN THIS VALIDATIONS TO AJAX