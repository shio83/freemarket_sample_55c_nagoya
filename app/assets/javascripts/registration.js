(function(){
  //日付範囲決定
  function calcDays(){
    $('#day').empty();
    var current = new Date();
    var y = $('#year').val();
    var m = $('#month'). val();

    if (m == "" || y == "") { //年か月が選択されていない時は31日まで表示
      var last = 31;
    } else if (m == 2 && ((y % 400 == 0) || ((y % 4 == 0) && (y % 100 != 0)))) {
      var last = 29; //うるう年判定
    } else {
      var last = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31)[m-1];
    }

    $('#day');
    for (var i = 1; i <= last; i++) {
      if (d == i) { //日がすでに選択されている場合はその値が選択された状態で表示
        $('#day').append('<option value="' + i + '" selected>' + i + '</option>');
      } else {
        $('#day').append('<option value="' + i + '">' + i + '</option>');
      }
    }
  }

  var d = 0;
  $(function(){
    $('#day').change(function(){
      d = $(this).val();
    });
    //年か月が変わるごとに日数を計算
    $('#year').change(calcDays);
    $('#month').change(calcDays);
  });
})();