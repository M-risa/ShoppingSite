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

function showCustomAlert(message) {
	const alertMobal = document.getElementById('customAlertModal');
	if (!alertMobal) {
		alert(message);
		return Promise.resolve();
	}

	document.getElementById('alertMessage').textContent = message;
	alertMobal.style.display = 'flex';

	return new Promise((resolve) => {
		document.getElementById('btn-alert-ok').onclick = function() {
			alertMobal.style.display = 'none';
			resolve();
		};
	});
}

//編集ボタン
function goToEdit() {
	const form = document.getElementById('productActionForm');
	const checkedRadio = document.querySelector('input[name="selectProductId"]:checked'); //ラジオボタンで選択されているもの

	if (!checkedRadio) {
		showCustomAlert('編集する商品を選択してください。');
		return;
	}

	form.submit(); //action.javaに送る
}

//削除ボタン
function deleteOnTheSpot() {
	const checkedRadio = document.querySelector('input[name="selectProductId"]:checked');

	if (!checkedRadio) {
		showCustomAlert('削除する商品を選択してください。');
		return;
	}

	const productId = checkedRadio.value;

	const confirmModal = document.getElementById('customConfirmModal');
	if (!confirmModal) {
		if (confirm(`商品ID：${productId}の商品を本当に削除しますか？`)) {
			executeDeleteFetch(productId);
		}
		return;

	}

	document.getElementById('confirmMessage').textContent = `商品ID：${productId} の商品を本当に削除しますか？`;
	confirmModal.style.display = 'flex';

	// 「はい」を押したときの処理
	document.getElementById('btn-confirm-yes').onclick = function() {
		confirmModal.style.display = 'none';
		executeDeleteFetch(productId);
	};

	// 「いいえ」を押したときの処理
	document.getElementById('btn-confirm-no').onclick = function() {
		confirmModal.style.display = 'none';
	};
}


// 【内部補助関数】実際の削除非同期通信
function executeDeleteFetch(productId) {
	fetch(`${contextPath}/jp/co/aforce/servlet/AdminProductDelete.action`, {
		method: 'POST',
		headers: {
			'Content-Type': 'application/x-www-form-urlencoded',
		},
		body: `selectProductId=${productId}`
	})
		.then(response => {
			if (response.ok) {
				const targetCard = document.getElementById(`product-${productId}`);
				if (targetCard) {
					targetCard.remove(); // 画面からカードを削除
					showCustomAlert('商品を削除しました。');
				}
			} else {
				showCustomAlert('削除に失敗しました。');
			}
		})
		.catch(error => {
			console.error('Error:', error);
			showCustomAlert('通信エラーが発生しました。');
		});
}

//並び替え
function submitWithFilters(selectElem) {
	const filterForm = document.querySelector('.product-filter-form');
	if (filterForm) {
		let hiddenSort = filterForm.querySelector('input[name="sort"]');

		if (!hiddenSort) {
			hiddenSort = document.createElement('input');
			hiddenSort.type = 'hidden';
			hiddenSort.name = 'sort';
			filterForm.appendChild(hiddenSort);
		}

		hiddenSort.value = selectElem.value;
		filterForm.submit();
	} else {
		selectElem.form.submit();
	}
}


/**
 * ヘッダーの検索バー送信時の制御
*/
function handleHeaderSearch(event, formEl) {
	// JSP側にある隠しインプットからログイン状態（'true' か 'false'）を取得
	const loginFlagEl = document.getElementById('is-logged-in-flag');
	const isLoggedIn = loginFlagEl ? loginFlagEl.value === 'true' : false;

	// 未ログインの場合
	if (!isLoggedIn) {
		event.preventDefault();

		// ダイアログを表示
		const modal = document.getElementById('login-modal');
		if (modal) {
			modal.style.display = 'flex';
		}
		return false;
	}

	// ログイン済みならそのまま検索を実行
	return true;
}


function closeLoginModal() {
	const modal = document.getElementById('login-modal');
	if (modal) {
		modal.style.display = 'none';
	}
}

/**
 * 商品詳細画面：カート追加完了ダイアログの制御ロジック
 */
window.addEventListener('DOMContentLoaded', () => {
    // JSP側の隠しインプットからカート追加フラグ（'true' か 'false'）を取得
    const cartAddedFlagEl = document.getElementById('cart-added-flag');
    const isCartAdded = cartAddedFlagEl ? cartAddedFlagEl.value === 'true' : false;
    
    // カート追加直後であれば、ダイアログを自動でポップアップ表示する
    if (isCartAdded) {
        const modal = document.getElementById('cart-success-modal');
        if (modal) {
            modal.style.display = 'flex';
        }
    }
});

function closeCartModal() {
    const modal = document.getElementById('cart-success-modal');
    if (modal) {
        modal.style.display = 'none';
    }
}
