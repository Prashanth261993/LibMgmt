
$(document).ready(function(){


	//alert("ok");
	//$.get($("#books_search").attr("action"), $("#books_search").serialize(), null, 'script') false );

	//alert("hi");
  $('#books_search_input').keyup(
    function()
    {
  $.ajax({
  	url: '/books/live_search',
  	data: {
  		search: $("#books_search_input").val()
  	},
  	error: function(){
  		$('#bookresults_div').append.html('<p>Error occured</p>');
  	},
  	dataType: 'json',

    success: function(data) { 

      //debugger
      //alert(JSON.stringify(data));
      $('#bookresults_div').html(" <table class='booktable' id = 'booktable'><tr class='tablehead'><th>Title</th><th>Author</th><th>Price</th><th>Return</th></tr>");

      for( obj in data)
      {
        //alert(JSON.stringify(data[obj]));
        var $available = $('<td>');
        var $row = $('<tr>');
      	var $title = $('<td>').text(data[obj].title);
        var $author = $('<td>').text(data[obj].author);
        var $price = $('<td>').text(data[obj].price);
        if (data[obj].user_id == 0){
          //var $available = $('input').attr("type","checkbox").attr("name","activated[]").attr("id","activated_").attr("value",data[obj].id);
            $available.append($('<input>').attr({
              type:"checkbox",
              name:"activated[]",
              id:"activated_",
              value:data[obj].id}));
        }
        else
        {
           $available.append($('<span>').text("Can't be removed now"));
        }
        $row.append($title).append($author).append($price).append($available);
      	$('#booktable').append($row);
      }
    }, 
      type: 'POST'

  });});



	});