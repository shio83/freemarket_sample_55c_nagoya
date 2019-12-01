$(function(){
  function buildImage(loadedImageUri){
    var html =  `<li class="imgexhibit__catfish">
                      <figure class="greenday">
                        <img src= "${loadedImageUri}">
                      </figure>
                      <div class="imgexhibit__akumonbuttom">
                        <a class="imgexhibit__akumonbuttom--edit">
                          編集
                        </a>
                        <a class="imgexhibit__akumonbuttom--delete">
                          削除
                        </a>
                      </div>
                    </li>`;
            return html;
  };

  var files_array = [];
  $('form').on('change',".onigiri", function(e) {
    e.preventDefault();
    var file = e.target.files[0];
        reader = new FileReader();
        files_array.push(file);
    reader.onload = (function(file) {
      
      return function(e) {
        $('.preview').append(buildImage(e.target.result))
      };  
    })(file);
    reader.readAsDataURL(file);
    if(files_array.length == 10){
      $(".dropzone-area2").css({
        'display':'none'
      })
      $(".dropzone-area").css({
        'display':'none'
      })
      $(".sell-form-container").css({
        'height':'490px'
      })
    }
    if(files_array.length == 9){
      $(".dropzone-area2").css({
        'display':'block',
        'width':'20%'
      })
      $(".dropzone-area").css({
        'display':'none'
      })
      $(".sell-form-container").css({
        'height':'490px'
      })
    }
    if(files_array.length == 8){
      $(".dropzone-area2").css({
        'display':'block',
        'width':'40%'
      })
      $(".dropzone-area").css({
        'display':'none'
      })
      $(".sell-form-container").css({
        'height':'490px'
      })
    }
    if(files_array.length == 7){
      $(".dropzone-area2").css({
        'display':'block',
        'width':'60%'
      })
      $(".dropzone-area").css({
        'display':'none'
      })
      $(".sell-form-container").css({
        'height':'490px'
      })
    }
    if(files_array.length == 6){
      $(".dropzone-area2").css({
        'display':'block',
        'width':'80%'
      })
      $(".dropzone-area").css({
        'display':'none'
      })
      $(".sell-form-container").css({
        'height':'490px'
      })
    }
    if (files_array.length == 5){
      $(".dropzone-area2").css({
        'display':'block'
      })
      $(".dropzone-area").css({
        'display':'none'
      })
      $(".sell-form-container").css({
        'height':'490px'
      })
    }
    if(files_array.length == 4){
      $(".dropzone-area").css({
        'display':'block',
        'width':'20%'
      })
    }
    if(files_array.length == 3){
      $(".dropzone-area").css({
        'display':'block',
        'width':'40%'
      })
    }
    if(files_array.length == 2){
      $(".dropzone-area").css({
        'display':'block',
        'width':'60%'
      })
      
    }
    if(files_array.length == 1){
      $(".dropzone-area").css({
        'display':'block',
        'width':'80%'
      })
    }
    
  });
  $('.dropzone-area').on('dragover',function(e){
    e.preventDefault();
});
$('.dropzone-area').on('drop',function(event){
  event.preventDefault();
  files = event.originalEvent.dataTransfer.files;
  for (var i=0; i<files.length; i++) {
    files_array.push(files[i]);
    var fileReader = new FileReader();
    fileReader.onload = function( event ) {
    var loadedImageUri = event.target.result;
    $(buildImage(loadedImageUri,)).appendTo(".preview").trigger("create");
    
    };
    fileReader.readAsDataURL(files[i]);
  }
  if(files_array.length == 10){
    $(".dropzone-area2").css({
      'display':'none'
    })
    $(".dropzone-area").css({
      'display':'none'
    })
    $(".sell-form-container").css({
      'height':'490px'
    })
  }
  if(files_array.length == 9){
    $(".dropzone-area2").css({
      'display':'block',
      'width':'20%'
    })
    $(".dropzone-area").css({
      'display':'none'
    })
    $(".sell-form-container").css({
      'height':'490px'
    })
  }
  if(files_array.length == 8){
    $(".dropzone-area2").css({
      'display':'block',
      'width':'40%'
    })
    $(".dropzone-area").css({
      'display':'none'
    })
    $(".sell-form-container").css({
      'height':'490px'
    })
  }
  if(files_array.length == 7){
    $(".dropzone-area2").css({
      'display':'block',
      'width':'60%'
    })
    $(".dropzone-area").css({
      'display':'none'
    })
    $(".sell-form-container").css({
      'height':'490px'
    })
  }
  if(files_array.length == 6){
    $(".dropzone-area2").css({
      'display':'block',
      'width':'80%'
    })
    $(".dropzone-area").css({
      'display':'none'
    })
    $(".sell-form-container").css({
      'height':'490px'
    })
  }
  if (files_array.length == 5){
    $(".dropzone-area2").css({
      'display':'block'
    })
    $(".dropzone-area").css({
      'display':'none'
    })
    $(".sell-form-container").css({
      'height':'490px'
    })
  }
  if(files_array.length == 4){
    $(".dropzone-area").css({
      'display':'block',
      'width':'20%'
    })
  }
  if(files_array.length == 3){
    $(".dropzone-area").css({
      'display':'block',
      'width':'40%'
    })
  }
  if(files_array.length == 2){
    $(".dropzone-area").css({
      'display':'block',
      'width':'60%'
    })
    
  }
  if(files_array.length == 1){
    $(".dropzone-area").css({
      'display':'block',
      'width':'80%'
    })
  }
  
});
$('.dropzone-area2').on('dragover',function(e){
  e.preventDefault();
});
$('.dropzone-area2').on('drop',function(event){
event.preventDefault();
files = event.originalEvent.dataTransfer.files;

for (var i=0; i<files.length; i++) {
  files_array.push(files[i]);
  var fileReader = new FileReader();
  fileReader.onload = function( event ) {
  var loadedImageUri = event.target.result;
  $(buildImage(loadedImageUri,)).appendTo(".preview").trigger("create");
  
  };
  fileReader.readAsDataURL(files[i]);
}
if(files_array.length == 10){
  $(".dropzone-area2").css({
    'display':'none'
  })
  $(".dropzone-area").css({
    'display':'none'
  })
  $(".sell-form-container").css({
    'height':'490px'
  })
}
if(files_array.length == 9){
  $(".dropzone-area2").css({
    'display':'block',
    'width':'20%'
  })
  $(".dropzone-area").css({
    'display':'none'
  })
  $(".sell-form-container").css({
    'height':'490px'
  })
}
if(files_array.length == 8){
  $(".dropzone-area2").css({
    'display':'block',
    'width':'40%'
  })
  $(".dropzone-area").css({
    'display':'none'
  })
  $(".sell-form-container").css({
    'height':'490px'
  })
}
if(files_array.length == 7){
  $(".dropzone-area2").css({
    'display':'block',
    'width':'60%'
  })
  $(".dropzone-area").css({
    'display':'none'
  })
  $(".sell-form-container").css({
    'height':'490px'
  })
}
if(files_array.length == 6){
  $(".dropzone-area2").css({
    'display':'block',
    'width':'80%'
  })
  $(".dropzone-area").css({
    'display':'none'
  })
  $(".sell-form-container").css({
    'height':'490px'
  })
}
if (files_array.length == 5){
  $(".dropzone-area2").css({
    'display':'block'
  })
  $(".dropzone-area").css({
    'display':'none'
  })
  $(".sell-form-container").css({
    'height':'490px'
  })
}
if(files_array.length == 4){
  $(".dropzone-area").css({
    'display':'block',
    'width':'20%'
  })
}
if(files_array.length == 3){
  $(".dropzone-area").css({
    'display':'block',
    'width':'40%'
  })
}
if(files_array.length == 2){
  $(".dropzone-area").css({
    'display':'block',
    'width':'60%'
  })
  
}
if(files_array.length == 1){
  $(".dropzone-area").css({
    'display':'block',
    'width':'80%'
  })
}
});
$(document).on('click','a.imgexhibit__akumonbuttom--delete', function(){
  var index = $(".imgexhibit__akumonbuttom--delete").index(this);
  $(".imgexhibit__catfish").eq(index).remove();
  files_array.splice(index - 1, 1);
  if(files_array.length == 10){
    $(".dropzone-area2").css({
      'display':'none'
    })
    $(".dropzone-area").css({
      'display':'none'
    })
    $(".sell-form-container").css({
      'height':'490px'
    })
  }
  if(files_array.length == 9){
    $(".dropzone-area2").css({
      'display':'block',
      'width':'20%'
    })
    $(".dropzone-area").css({
      'display':'none'
    })
    $(".sell-form-container").css({
      'height':'490px'
    })
  }
  if(files_array.length == 8){
    $(".dropzone-area2").css({
      'display':'block',
      'width':'40%'
    })
    $(".dropzone-area").css({
      'display':'none'
    })
    $(".sell-form-container").css({
      'height':'490px'
    })
  }
  if(files_array.length == 7){
    $(".dropzone-area2").css({
      'display':'block',
      'width':'60%'
    })
    $(".dropzone-area").css({
      'display':'none'
    })
    $(".sell-form-container").css({
      'height':'490px'
    })
  }
  if(files_array.length == 6){
    $(".dropzone-area2").css({
      'display':'block',
      'width':'80%'
    })
    $(".dropzone-area").css({
      'display':'none'
    })
    $(".sell-form-container").css({
      'height':'490px'
    })
  }
  if (files_array.length == 5){
    $(".dropzone-area2").css({
      'display':'block',
      'width':'100%'
    })
    $(".dropzone-area").css({
      'display':'none'
    })
    $(".sell-form-container").css({
      'height':'490px'
    })
  }
  if(files_array.length == 4){
    $(".dropzone-area").css({
      'display':'block',
      'width':'20%'
    })
    $(".dropzone-area2").css({
      'display':'none'
    })
    $(".sell-form-container").css({
      'height':'308px'
    })
  }
  if(files_array.length == 3){
    $(".dropzone-area").css({
      'display':'block',
      'width':'40%'
    })
  }
  if(files_array.length == 2){
    $(".dropzone-area").css({
      'display':'block',
      'width':'60%'
    })
    
  }
  if(files_array.length == 1){
    $(".dropzone-area").css({
      'display':'block',
      'width':'80%'
    })
  }
  if(files_array.length == 0){
    $(".dropzone-area").css({
      'width':'100%'
    })
  }
});
// $(".btn-red-red").click('submit', function(e){
//   e.preventDefault();
//   // そのほかのform情報を以下の記述でformDataに追加
//   var formData = new FormData($(this).get(10));

//       // formData = $("product[name]").val();
//   // console.log(this)
//   // ドラッグアンドドロップで、取得したファイルをformDataに入れる。
//   files_array.forEach(function(file){
//    formData.append("image[images][]" , file);
//    formData.append("product[name]" , $('input#product_name[name="product[name]"]').val());
//    formData.append("product[description]" , $('textarea[name="product[description]"]').val());
//    formData.append("product[category_id]" , $('select#grandchild_category[name="product[category_id]"]').val());
//    formData.append("product[size]" , $('select#product_size.selects[name="product[size]"]').val());
//    formData.append("product[brand]" , $('input#product_brand[name="product[brand]"]').val());
//    formData.append("product[state]" , $('select#product_state.select-box[name="product[state]"]').val());
//    formData.append("product[shipping_fee]" , $('select#product_shipping_fee[name="product[shipping_fee]"]').val());
//    formData.append("product[shipping_region]" , $('select#product_shipping_region[name="product[shipping_region]"]').val());
//    formData.append("product[shipping_date]" , $('select#product_shipping_date[name="product[shipping_date]"]').val());
//    formData.append("product[price]" , $('input#product_price[name="product[price]"]').val());
   
//   console.log(formData.get("product[name]"));
//   console.log(formData.get("product[description]"));
//   console.log(formData.get("product[category_id]"));
//   console.log(formData.get("product[size]"));
//   console.log(formData.get("product[brand]"));
//   console.log(formData.get("product[state]"));
//   console.log(formData.get("product[shipping_fee]"));
//   console.log(formData.get("product[shipping_region]"));
//   console.log(formData.get("product[shipping_date]"));
//   console.log(formData.get("product[price]"));
  

//   });
//   $.ajax({
//     url:         '/items',
//     type:        "POST",
//     data:        formData,
//     contentType: false,
//     processData: false,
//     dataType:   'json'
//   })
//   .done(function(data){
    
//     alert('出品に成功しました！');
//   })
//   .fail(function(XMLHttpRequest, textStatus, errorThrown){
//     alert('出品に失敗しました！');
//   });
// });
});

