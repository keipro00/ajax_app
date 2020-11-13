function memo() {

  // indexファイルのsubmitメソッドの箇所にidがある
  const submit = document.getElementById("submit");

  // 投稿ボタンをクリックした際に実行される
  submit.addEventListener("click", (e) =>{

    // メモ投稿のフォームに入力された情報を送信
    const formData = new FormData(document.getElementById("form"));

    const XHR = new XMLHttpRequest();
// opneメソッドを使用してリクエストの内容を引数へ追記する
    XHR.open("POST", "/posts", true);
// 返却されるデータ形式はJSON
    XHR.responseType = "json";
    XHR.send(formData);

    // HTMLのメモ部分を描画する
    XHR.onload = () => {
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      }
      // itemはレスポンスとして返却されたメモのレコードデータを取得している
      const item = XHR.response.post;
      // listは、HTMLを描画する場所を指定する際に使用する「描画する親要素」のlistの要素を取得
      const list = document.getElementById("list");
      // formTextを取得、メモの入力フォームをりせっとするため
      const formText = document.getElementById("content");
      const HTML = `
        <div class="post" data-id=${item.id}>
          <div class="post-date">
            投稿日時：${item.created_at}
          </div>
          <div class="post-content">
          ${item.content}
          </div>
        </div>`;
      list.insertAdjacentHTML("afterend", HTML);
      formText.value = "";
    };
    e.preventDefault();
  });

}
window.addEventListener("load", memo);