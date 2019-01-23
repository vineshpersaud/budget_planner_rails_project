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



    $("#new_expense").on('submit',function(e){

        url = this.action
        data = $(this).serialize()
        $.ajax({
          type:"POST",
          url: url,
          data: data,
          success: function(response) {
            let expense = new Expense(response)
             $("#expense_table").append(expense.formatExpenseData())
            // $("#expense_table").append("<tr><td>" +response["name"]+ "</td><td>" +  "$" + parseInt(response["cost"]).toFixed(2) + "</td><td>" +response["quantity"] +
            // "</td><td>$"+(parseInt(response["cost"]) * parseInt(response["quantity"])).toFixed(2) + "</td><td>" +
            // "<a href=\"/users/" + response["event"]["user_id"]+ "/events/"+ response["event"]["id"]+"/expenses/"+ response["id"]+"/edit\">Edit</a>"
            // + "</td><td>" +
            // "<a  data-method=\"delete\", href=\"/users/" + response["event"]["user_id"]+ "/events/"+ response["event"]["id"]+"/expenses/"+ response["id"]+"\">Delete</a>"
            // +"</td></tr>"  )
          }
        })

         e.preventDefault();
    })

    function turnToDollar(amount){
      return(
        parseInt(amount).toFixed(2)
      )
    }

    // Expense constructor
    class Expense{
      constructor(obj) {
        this.name = obj.name
        this.quantity = obj.quantity,
        this.cost = obj.cost,
        this.id = obj.id
        this.user_id = obj.event.user_id,
        this.event_id = obj.event.id
      }
      formatExpenseData(){
        return(`
          <tr>
            <td> ${this.name} </td>
            <td>$${turnToDollar(this.cost)}</td>
            <td> ${this.quantity} </td>
            <td>$${turnToDollar(this.cost * this.quantity)}</td>
            <td><a href="/users/${this.user_id}/events/${this.event_id}/expenses/${this.id}/edit\">Edit</a></td>
            <td><a  data-method="delete", href="/users/${this.user_id}/events/${this.event_id}/expenses/${this.id}">Delete</a></td>
          </tr>
          `)
      }
    }


  });
