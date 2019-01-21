$( document ).on('turbolinks:load', function() {
   $("#eventBrief").on("click", function(e) {
     e.preventDefault();
     url = this.href
     $.ajax({
       method: "GET",
       url: url,
       datatype: "json",
       success: function (response) {
          debugger
       }
     })
   })

  });
