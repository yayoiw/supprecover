
document.addEventListener("DOMContentLoaded", function() {
  let modal = new bootstrap.Modal(document.getElementById('staticBackdrop'));
  modal.show();

  let modalDisable = document.getElementById('beforeUseCheckBox');
  let modalButton = document.getElementById('modalButton');

  modalDisable.addEventListener('click', function() {
    modalButton.disabled = !modalDisable.checked;
  });

  // '利用を始める'ボタンのクリックイベント
  modalButton.addEventListener('click', function() {
    // Ajaxリクエストを送信
    fetch('/set_agree_cookie', {
      method: 'POST',
      headers: {
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content,
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ agree: true }),
      credentials: 'include'
    }).then(response => {
      if (response.ok) {
        console.log('Cookie set successfully');
        // モーダルを閉じる
        modal.hide();
      } else {
        console.error('Error setting cookie');
      }
    });
  });
});