function editProfile()
{	
	var x = document.getElementsByClassName('profileeditbutton');
	for (var k =0; k<x.length; k++) 
	{
	    x[k].addEventListener("click", nextClickListener);



	}

	document.getElementById("updateprofile").addEventListener("click", updateProfile);
}
function nextClickListener()
{
	var s = this.parentNode.parentNode.childNodes[3].childNodes[0];
	s.disabled=false;
	placeCaretAtEnd(s);

}


function updateProfile()
{
	var request = new XMLHttpRequest(); 
	request.onload = callback; 
	request.open("post", "http://localhost:3000/request"); 
	request.setRequestHeader("Content-Type", "application/json"); 
	request.send('{"my_data":"back to basics"}');
}

function placeCaretAtEnd(el) {
    el.focus();
    if (typeof window.getSelection != "undefined"
            && typeof document.createRange != "undefined") {
        var range = document.createRange();
        range.selectNodeContents(el);
        range.collapse(false);
        var sel = window.getSelection();
        sel.removeAllRanges();
        sel.addRange(range);
    } else if (typeof document.body.createTextRange != "undefined") {
        var textRange = document.body.createTextRange();
        textRange.moveToElementText(el);
        textRange.collapse(false);
        textRange.select();
    }
}

editProfile();