
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

$(document).ready(function(){
  setTimeout(function(){
    $("#flash").fadeTo(500, 0).slideUp(500, function()
{
$(this).remove();
});
}, 3000);
 })


formValidate();