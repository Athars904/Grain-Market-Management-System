// script.js
document.getElementById('register-link').addEventListener('click', function() {
  // Redirect to the second HTML file when the button is clicked
  window.location.href = 'login.html';
});
document.addEventListener('DOMContentLoaded', function() {
    // Get the login button
    var loginButton = document.getElementById('getonnextpage');

    // Add click event listener to the login button
    loginButton.addEventListener('click', function(event) {
        // Prevent the default form submission behavior
        event.preventDefault();

        // Redirect to the menu.html page
        window.location.href = 'menu.html';
    });
});
