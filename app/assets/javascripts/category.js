$(function(){
  function appendOption(category){
    var html = `<option value="${category.name}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }

  function appendSizeOption(size){
    let html = `<option value="${size.size}">${size.size}</option>`;
    return html;
  }

  function appendChildrenBox(insertHTML){
    var childSelectHTML= '';
    childSelectHTML = ` <div class='selebobo' id= 'children_wrapper'>
                          <select class= 'selects' id="child_category" name="category_id">
                          <option value="---" data-category="---">---</option>
                          ${insertHTML}
                        <select>
                        <i aria-hidden="ture" class="fa fa-chevron-right fa-rotate-90 kitui"></i>
                      </div>
                    </div>`;
    $(".selebobobo").append(childSelectHTML); 
  }
  function appendGrandchidrenBox(insertHTML){
    var grandchildSelectHTML = '';
    grandchildSelectHTML = ` <div class='selebobo' id= 'grandchildren_wrapper'>
                              <select class= 'selects' id="grandchild_category" name="category_id">
                                <option value="---" data-category="---">---</option>
                                ${insertHTML}
                              <select>
                              <i aria-hidden="ture" class="fa fa-chevron-right fa-rotate-90 kitui"></i>
                            </div>
                          </div>`; 
    $(".selebobobo").append(grandchildSelectHTML); 
  }

  function appendSizeBox(insertHTML){
    var sizeSelectHtml = '';
    sizeSelectHtml = `<div class="products-to-box-form2" id = 'size_wrapper'>
                        <label class="products-to-box-form2-condition" for= "サイズ">
                          サイズ
                        <span class="span">
                          必須
                        </span>
                        </label>
                       <div class='selebobo'>
                        <select class= 'selects' id="size" name="size_id">
                        <option value="---">---</option>
                        ${insertHTML}
                       <select>
                         <i aria-hidden="ture" class="fa fa-chevron-right fa-rotate-90 kitui"></i>
                      </div>
                      </div>`; 
    $(".selebobobo").append(sizeSelectHtml);
  }

  function appendBrandBox(){
    var brandSizeHtml = '';
    brandSizeHtml = `<div class="products-to-box-form2" id = 'brand_wrapper'>
                    <label class="products-to-box-form2-condition">
                    ブランド
                    <span class="free">
                    任意
                    </span>
                    </label>
                    <div class='selebobo'>
                    <input type="text" class="selects" placeholder="例) シャネル">
                    </div>
                    </div>`;
    $(".selebobobo").append(brandSizeHtml);           
  }

  

  $("#parent_category").on("change", function(){
    var parentCategory = document.getElementById('parent_category').value;
    if (parentCategory != "---"){
      $.ajax ({
        url: '/products/get_category_children',
        type: "GET",
        data: { parent_name: parentCategory},
        dataType: "json"
      })
      .done(function(children){
        $('#children_wrapper').remove(); 
        $('#grandchildren_wrapper').remove();
        $('#size_wrapper').remove();
        $('#brand_wrapper').remove();
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child)
        });
        appendChildrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#children_wrapper').remove(); 
      $('#grandchildren_wrapper').remove();
      $('#size_wrapper').remove();
      $('#brand_wrapper').remove();
    }
  });

  $(document).on("change", '#child_category', function(){
    var childId = $('#child_category option:selected').data('category'); 
    if (childId != "---"){ 
      $.ajax({
        url: '/products/get_category_grandchildren',
        type: 'GET',
        data: { child_id: childId },
        dataType: 'json'
      })
      .done(function(grandchildren){
        if (grandchildren.length != 0) {
          $('#grandchildren_wrapper').remove(); 
          $('#size_wrapper').remove();
          $('#brand_wrapper').remove();
          var insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOption(grandchild);
          });
          appendGrandchidrenBox(insertHTML);
        }
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#grandchildren_wrapper').remove(); 
      $('#size_wrapper').remove();
      $('#brand_wrapper').remove();
    }
  });

  $(document).on("change", "#grandchild_category", function(){
    var grandchildId =  $('#grandchild_category option:selected').data('category'); 
    if (grandchildId != "---") {
      $.ajax({
        url: '/products/get_size',
        type: 'GET',
        data: { grandchild_id: grandchildId },
        dataType: 'json'
      })
      .done(function(sizes){
        $('#size_wrapper').remove(); 
        $('#brand_wrapper').remove();
        if (sizes.length != 0) {
        var insertHTML = '';
          sizes.forEach(function(size){
            insertHTML += appendSizeOption(size);
          });
          appendSizeBox(insertHTML);
          appendBrandBox();
        }
      })
      .fail(function(){
        alert('サイズ取得に失敗しました');
      })
    }else{
      $('#size_wrapper').remove(); 
      $('#brand_wrapper').remove();
    }
  })
})