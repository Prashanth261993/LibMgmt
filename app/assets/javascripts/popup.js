function toggle(div_id) 
{

	var el = document.getElementById(div_id);

	if ( el.style.display == 'none' ) 
		{	
			el.style.display = 'block';
		}

	else 
		{
			el.style.display = 'none';
		}


}

function popup(windowname) {
	
	toggle('blanket');
	toggle(windowname);		
}

$(function(){
      $("#popUpDiv").load("http://localhost:3000/userdbs/sign_up"); 
      //$("#popUpDiv").html('<a href="#" onclick="popup('popUpDiv')" >Click to Close CSS Pop Up</a>');
    });

