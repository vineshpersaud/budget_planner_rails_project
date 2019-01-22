//https://stackoverflow.com/questions/36110789/rails-5-how-to-use-document-ready-with-turbo-links
// sloves turbolinks ready error
$( document ).on('turbolinks:load', function() {

    $("#allEvents").on("click",function(e){
       e.preventDefault();

      url = this.href
      $.ajax({
        method: "GET",
        url: url,
        datatype: "json",
        success: function (response) {
          $("#showEvents table").empty()
            let events = response.map(event=>
            "<tr> <td>"
            + event["name"] +
            "</td> <td>" +
            event["budget"]+
            "</td>  <td>" +
            "<a href=\"/users/"+ event["user"]["id"] +"/events/"+ event["id"]+ "\">More Info</a>" +
            "</td></tr>")
          $("#showEvents").append("<table>" + "<tr><th>Event name</th><th>Budget</th><th></th></tr>" + events.join(' ') + "</table>")
          //$("#allEvents").attr('id','hideEvents')
          //$("#hideEvents").text("Hide Events")
        }
      })
    })

    // $("#hideEvents").on("click",function(e){
    //
    //     alert("hello")
    //      $("#showEvents table").empty()
    //      $("#hideEvents").text("Show Events")
    //      $("#hideEvents").attr('id','allEvents')
    //      e.preventDefault();
    // });

    $("#new_expense").on("submit",function(e){
       e.preventDefault();
        alert("hijacked new expense")
    })

  });
