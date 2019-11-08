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
    if (files_array.length == 5){
      $(".dropzone-area2").css({
        'display':'block'
      })
      $(".dropzone-area").css({
        'display':'none'
      })
    }
    if(files_array.length == 4){
      $(".dropzone-area2").css({
        'display':'none'
      })
      $(".dropzone-area").css({
        'display':'block',
        
      })
    }
    
  });
  $('form').on('change', ".senbei", function(e) {
    e.preventDefault();
    var file = e.target.files[0];
        reader = new FileReader();
        files_array.push(file);
    reader.onload = (function(file) {
      
      return function(e) {
        $('ul.preview2').append(buildImage(e.target.result))
      };  
    })(file);

    reader.readAsDataURL(file);
    if (files_array.length == 10){
      $(".dropzone-area2").css({
        'display':'none'
      })
    }
  });
  $('.dropzone-area').on('dragover',function(e){
    e.preventDefault();
});
$('.dropzone-area').on('drop',function(event){
  event.preventDefault();
  files = event.originalEvent.dataTransfer.files;
  console.log(files);
  for (var i=0; i<files.length; i++) {
    files_array.push(files[i]);
    var fileReader = new FileReader();
    fileReader.onload = function( event ) {
    var loadedImageUri = event.target.result;
    $(buildImage(loadedImageUri,)).appendTo(".preview").trigger("create");
    
    };
    fileReader.readAsDataURL(files[i]);
  }

  if (files_array.length == 5){
    $(".dropzone-area2").css({
      'display':'block'
    })
    $(".dropzone-area").css({
      'display':'none'
    })
  }
  if(files_array.length == 4){
    $(".dropzone-area2").css({
      'display':'none'
    })
    $(".dropzone-area").css({
      'display':'block',
      
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
  $(buildImage(loadedImageUri,)).appendTo(".preview2").trigger("create");
  
  };
  fileReader.readAsDataURL(files[i]);
}

if (files_array.length == 10){
  $(".dropzone-area2").css({
    'display':'none'
  })
}

});
$(document).on('click','a.imgexhibit__akumonbuttom--delete', function(){
  var index = $(".imgexhibit__akumonbuttom--delete").index(this);
  $(".imgexhibit__catfish").eq(index).remove();
  files_array.splice(index - 1, 1);
  if (files_array.length == 5){
    $(".dropzone-area2").css({
      'display':'block'
    })
    $(".dropzone-area").css({
      'display':'none'
    })
  }
  if(files_array.length == 4){
    $(".dropzone-area2").css({
      'display':'none'
    })
    $(".dropzone-area").css({
      'display':'block',
      
      
    })
  }
  if (files_array.length == 9){
    $(".dropzone-area2").css({
      'display':'block'
    })
  }
});

});

