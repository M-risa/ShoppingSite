function togglePassword() {
    // パスワードの入力欄と、チェックボックスをそれぞれ取得
    var passwordInput = document.getElementById("login-password");
    var passwordCheckbox = document.getElementById("password-toggle");
    

    if (passwordCheckbox.checked) {
        passwordInput.type = "text";
    } else {
        passwordInput.type = "password";
    }
}
