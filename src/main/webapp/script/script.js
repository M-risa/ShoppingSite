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


/**
 * 管理者画面用 ポップアップ制御スクリプト
 */
document.addEventListener("DOMContentLoaded", function() {
    
    // 1.「続けて商品を登録する」ボタンの要素を取得
    const btnAdd = document.getElementById("btn-add");
    
    // 2.「商品管理画面へ戻る」ボタンの要素を取得
    const btnManage = document.getElementById("btn-manage");

    // ボタンが存在する場合（ポップアップが表示されている時）だけイベントを設定
    if (btnAdd) {
        btnAdd.addEventListener("click", function() {
            // まっさらな新規登録画面へ遷移
            window.location.href = "/ShoppingSite/views/admin-product-add.jsp"; 
        });
    }

    if (btnManage) {
        btnManage.addEventListener("click", function() {
            // 商品管理の一覧画面へ遷移
            window.location.href = "/ShoppingSite/jp/co/aforce/servlet/AdminProductList.action"; 
        });
    }
});
