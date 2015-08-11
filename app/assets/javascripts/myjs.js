
function showSignUp()
{
document.getElementById("signupshow").addEventListener("click", function(){

			
		document.getElementById("signindiv").style.display="none";

		document.getElementById("signupdiv").style.display="inline-block";


	});
}

function showSignIn()
{
document.getElementById("signinshow").addEventListener("click", function(){

	
		document.getElementById("signupdiv").style.display="none";

		document.getElementById("signindiv").style.display="inline-block";


	});
}

function formValidate()
{
	
	var a = document.getElementById("password1");	
	a.addEventListener("input",function(){

		if(a.value.length <= 6)
		document.getElementById("passerror").style.display="block";
		else
			document.getElementById("passerror").style.display="none";
	});

	var b = document.getElementById("age1");	
	b.addEventListener("input",function(){

		if(isNaN(b.value))
		document.getElementById("ageerror").style.display="block";
		else
			document.getElementById("ageerror").style.display="none";
	});

	var c = document.getElementById("mobile1");	
	c.addEventListener("input",function(){

		if(isNaN(c.value) || (c.value.length != 10) )
		document.getElementById("mobileerror").style.display="block";
		else
			document.getElementById("mobileerror").style.display="none";
	});

	var d = document.getElementById("email1");	
	document.getElementById("signupsubmit").addEventListener("click",function(e)
	{
		if(a.value == "" || c.value == "" || d.value == "" )
		{
			document.getElementById("submiterror").style.display="block";
			e.preventDefault();
		}	

	});

}
/*function searchList()
{
	//alert("1");
	$("#search_input").bind("keyup", function() {
		//alert("2");

  //$("#big-search-box").addClass("loading"); // show the spinner
  var form = $("#books_search"); // grab the form wrapping the search bar.
  //var form = document.getElementById("books_search")
  var url = "/books/search"; // live_search action.   
  var formData = form.serialize(); // grab the data in the form 
  //alert(formData);
  //console.log("hi " + formData.innerHTML);
  $.post(url, formData, function(html) { // perform an AJAX get

    //$("#big-search-box").removeClass("loading"); // hide the spinner

    //$("#render_form").html("#render_form"); // replace the "results" div with the results

  });

	//form.submit();

}); 
}*/

//searchList();

formValidate();
showSignUp();
showSignIn();
//formValidate();
//searchList();