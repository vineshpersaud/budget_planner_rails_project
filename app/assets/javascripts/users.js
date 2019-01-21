$( document ).on('turbolinks:load', function() {
   $("#eventBrief").on("click", function(e) {
     e.preventDefault();
     alert("click hijacked")
   })
  });
