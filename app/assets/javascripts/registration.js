$(function() {
  var current = new Date();
  var year_val = current.getFullYear();
  var month_val = current.getMonth() + 1;
  var day_val = current.getDate();
  $('select[name=year] option[value=' + year_val + ']').prop('selected', true);
  $('select[name=month] option[value=' + month_val + ']').prop('selected', true);
  $('select[name=day] option[value=' + day_val + ']').prop('selected', true);
  setDay();  
  $('select[name=year], select[name=month]').change(function() {
    setDay();
  });
  function setDay()
  {
    year_val = $('select[name=year]').val();
    month_val = $('select[name=month]').val();

    var t = 31;
    if (month_val == 2) {
      if (Math.floor(year_val%4) == 0 && Math.floor(year_val%100) != 0 || Math.floor(year_val%400) == 0) {
        t = 29;
      }  else {
        t = 28;
      }
    } else if (month_val == 4 || month_val == 6 || month_val == 9 || month_val == 11) {
      t = 30;
    }
    $('select[name=day] option').remove();
    for (var i = 1; i <= t; i++){
      $('select[name=day]').append('<option value="' + i + '">' + i + '</option>');
    }
  }
});