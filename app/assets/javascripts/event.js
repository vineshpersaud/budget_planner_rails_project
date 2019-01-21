//https://stackoverflow.com/questions/36110789/rails-5-how-to-use-document-ready-with-turbo-links
// sloves turbolinks ready error
$( document ).on('turbolinks:load', function() {
  if (window.jQuery){
    console.log("hello")
  }

    $("#allEvents").on("click",function(e){
       e.preventDefault();

      url = this.href
      $.ajax({
        method: "GET",
        url: url,
        datatype: "json",
        success: function (response) {
          $("#showEvents").empty()
            let events = response.map(event=>
            "<tr> <td>"
            + event["name"] +
            "</td> <td>" +
            event["budget"]+
            "</td>  <td>" +
            "<a href=\"/users/"+ event["user"]["id"] +"/events/"+ event["id"]+ "\">More Info</a>" +
            "</td></tr>")
          $("#showEvents").append("<table>" + "<tr><th>Event name</th><th>Budget</th><th></th></tr>" + events.join(' ') + "</table>")
        }
      })
    })
  });
