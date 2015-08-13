function editProfile()
{	
	var button = document.getElementsByClassName('profileeditbutton');
	for (var k =0; k<button.length; k++) 
	{
	    button[k].addEventListener("click", nextClickListener);
        var sibling_form = button[k].parentNode.parentNode.childNodes[3].childNodes[0];
        if(!sibling_form.value){
            button[k].value = "Add";
        }
        

	}

}
function nextClickListener()
{
	var s = this.parentNode.parentNode.childNodes[3].childNodes[0];
	s.disabled=false;
	placeCaretAtEnd(s);

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