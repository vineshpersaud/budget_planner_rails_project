$( document ).on('turbolinks:load', function() {
   $("#eventBrief").on("click", function(e) {
     e.preventDefault();
     url = this.href
     $.ajax({
       method: "GET",
       url: url,
       datatype: "json",
       success: function (response) {
         let expenses = response["expenses"].map(expense =>
           "<tr> <td>"
           + expense["name"] +
           "</td> <td>"
           + expense["cost"] +
           "</td><td>"
           + expense["quantity"] +
           "</td>  <tr>"
         )

          $("#briefedEvent"+response['id']).append(expenses.join(''))
       }
     })
   })

  });
