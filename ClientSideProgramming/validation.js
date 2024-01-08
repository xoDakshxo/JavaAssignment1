function validateForm() {
    // Get form input values
    var name = document.getElementById("name").value;
    var email = document.getElementById("email").value;
    var password = document.getElementById("password").value;

    // Initialize error messages
    var nameError = "";
    var emailError = "";
    var passwordError = "";

    // Validate name (required)
    if (name.trim() === "") {
        nameError = "Name is required.";
    }

    // Validate email (required and valid format)
    if (email.trim() === "") {
        emailError = "Email is required.";
    } else if (!validateEmail(email)) {
        emailError = "Invalid email format.";
    }

    // Validate password (required)
    if (password.trim() === "") {
        passwordError = "Password is required.";
    }

    // Display error messages
    document.getElementById("nameError").textContent = nameError;
    document.getElementById("emailError").textContent = emailError;
    document.getElementById("passwordError").textContent = passwordError;

    // Prevent form submission if there are errors
    if (nameError || emailError || passwordError) {
        return false;
    }

    return true;
}

// Email validation function
function validateEmail(email) {
    var re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return re.test(email);
}
