document.addEventListener('DOMContentLoaded', function() {
    // Get the login button
    var loginButton = document.getElementById('add-products');

    // Add click event listener to the login button
    loginButton.addEventListener('click', function(event) {
        // Prevent the default form submission behavior
        event.preventDefault();

        // Redirect to the menu.html page
        window.location.href = 'addproduct.html';
    });
});