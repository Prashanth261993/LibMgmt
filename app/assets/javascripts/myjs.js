
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


showSignUp();
showSignIn();