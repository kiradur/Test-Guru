document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('.check-password');

  if (control) { control.addEventListener('input', checkPass) };
})

function checkPass() {
  if (document.getElementById("user_password_confirmation").value == '') {
    this.querySelector('.octicon-check').classList.add('hide');
    this.querySelector('.octicon-x').classList.add('hide');
  } else if (document.getElementById("user_password").value ==
    document.getElementById("user_password_confirmation").value) {
      this.querySelector('.octicon-check').classList.remove('hide');
      this.querySelector('.octicon-x').classList.add('hide');
  } else {
      this.querySelector('.octicon-x').classList.remove('hide');
      this.querySelector('.octicon-check').classList.add('hide');
  }
}
