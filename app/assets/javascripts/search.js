$(function() {
    function buildChildHTML(child){
      var html =`<a class="child_category" id="${child.id}" 
                  href="#">${child.name}</a>`;
      return html;
    }
  
    $(".parent_category").on("mouseover", function() {
      var id = this.id
      $(".now-selected-red").removeClass("now-selected-red")
      $('#' + id).addClass("now-selected-red");
      $(".child_category").remove();
      $(".grand_child_category").remove();
      $.ajax({
        type: 'GET',
        url: '/tops/json',
        data: {parent_id: id},
        dataType: 'json'
      }).done(function(children) {
        children.forEach(function (child) {
          var html = buildChildHTML(child);
          $(".children_list").append(html);
        })
      });
    });
  
    
    function buildGrandChildHTML(child){
      var html =`<a class="grand_child_category" id="${child.id}"
                 href="">${child.name}</a>`;
      return html;
    }
  
    $(document).on("mouseover", ".child_category", function () {
      var id = this.id
      $(".now-selected-gray").removeClass("now-selected-gray");
      $('#' + id).addClass("now-selected-gray");
      $.ajax({
        type: 'GET',
        url: '/tops/json',
        data: {parent_id: id},
        dataType: 'json'
      }).done(function(children) {
        children.forEach(function (child) {
          var html = buildGrandChildHTML(child);
          $(".grand_children_list").append(html);
        })
        $(document).on("mouseover", ".child_category", function () {
          $(".grand_child_category").remove();
        });
      });
    }); 
    $(document).on("mouseover", ".grand_child_category", function(){
      let id = this.id
      $(".now-selected-gray-gray").removeClass("now-selected-gray-gray");
      $('#' + id).addClass("now-selected-gray-gray");
    }) 
    $(".multilevel--categolize--categolyseachs").hover(function(){
      $(".parents_list").css("display", "block");
      },
      function(){
        $(".now-selected-red").removeClass("now-selected-red")
        $(".parents_list").css("display", "none");
        $(".children_list").css("display", "none");
        $(".grand_children_list").css("display", "none");
    })
    $(".parents_list").on("mouseover",function(){
      $(".children_list").css("display", "block");
      $(".grand_children_list").css("display", "block");
    });
  });