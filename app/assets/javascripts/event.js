
  $(function () {
    $("#allEvents").on("click",function(e){
      e.preventDefault()

      url = this.href


      $.ajax({
        method: "GET",
        url: url,
        datatype: "json",
        success: function (response) {
          let events = response.map(event=> "<tr>"+ "<td>" + event["name"] +"</td>" +"</tr>")
          $("#showEvents").append("<table>" + events.join(' ') + "</table>")
          debugger
        }
      })
    })
  });
