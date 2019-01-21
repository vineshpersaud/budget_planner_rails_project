$( document ).on('turbolinks:load', function() {
   $(".eventBrief").on("click", function(e) {
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
          $event =$("#briefedEvent"+response['id'])
          $event.empty()
          $event.append( "<tr><th>Name</th><th>Cost</th><th>Quantity</th></tr>"+ expenses.join(''))
          $event.attr('class','data_block')
       }
     })
   })

  });
