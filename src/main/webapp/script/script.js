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


const scriptEl = document.getElementById('adminScript');
const contextPath = scriptEl.getAttribute('data-context-path');

//編集ボタン
function goToEdit(){
	const form = document.getElementById('productActionForm');
	const checkedRadio = document.querySelector('input[name="selectProductId"]:checked'); //ラジオボタンで選択されているもの
	
	if(!checkedRadio){
		alert('編集する商品を選択してください');
		return;
	}
	
	form.submit(); //action.javaに送る
}

//削除ボタン
function deleteOnTheSpot(){
	const checkedRadio = document.querySelector('input[name="selectProductId"]:checked');
	
	if(!checkedRadio){
		alert('削除する商品を選択してください。');
		return;
	}
	
	const productId = checkedRadio.value;
	
	if(confirm(`商品ID：${productId}の商品を本当に削除しますか？`)){
		
		//Fetch API(非同期通信)・画面を切り替えることなく、actionへ走らせる
		fetch(`${contextPath}/jp/co/aforce/servlet/AdminProductDelete.action`,{
			method: 'POST',
			headers: {
				'Content-Type': 'application/x-www-form-urlencoded',
			},
			body: `selectProductId=${productId}`
		})
		.then(response => {
			if(response.ok){
				const targetCard = document.getElementById(`product-${productId}`);
				if(targetCard){
					targetCard.remove();
					alert('商品を削除しました');
				}
			} else{
				alert('削除に失敗しました');
			}
		})
		.catch(error => {
			console.error('Error:', error);
			alert('通信エラーが発生しました。');
		});
	}
}

//並び替え
function submitWithFilters(selectElem){
	const filterForm = document.querySelector('.product-filter-form');
	if(filterForm){
		let hiddenSort = filterForm.querySelector('input[name="sort"]');
		
		if(!hiddenSort){
			hiddenSort = document.createElement('input');
			hiddenSort.type = 'hidden';
			hiddenSort.name = 'sort';
			filterForm.appendChild(hiddenSort);
		}
	
		hiddenSort.value = selectElem.value;
		filterForm.submit();
	} else{
		selectElem.form.submit();
	}
}
