$(function()  {
  // タブのDOM要素を取得し、変数で定義
  let tabs = $(".bought-list__tab-heads--head");

  // クラスの切り替えをtabSwitch関数で定義
  function tabSwitch() {
    // 全てのactiveクラスのうち、最初の要素を削除（"[0]は、最初の要素の意味"）
    $(".okey").removeClass("okey");

    // クリックしたタブにactiveクラスを追加

    $(this).addClass("okey");

    // 何番目の要素がクリックされたかを、配列tabsから要素番号を取得
    const index = tabs.index(this); 

    // クリックしたタブに対応するshowクラスを追加する
    $(".bought-list__contents--content").removeClass("show").eq(index).addClass("show");
  }

  tabs.click(tabSwitch);    
});