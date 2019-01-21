
  $(function () {
    $("#allEvents").on("click",function(e){


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
            "<a href=\"/users/"+ event["user"]["id"] +"/events/"+ event["id"]+ "\">Link</a>" +
            "</td></tr>")
          $("#showEvents").append("<table>" + events.join(' ') + "</table>")
        }
      })
        e.preventDefault()
    })


  });
