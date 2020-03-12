$(document).ready(function () {
            $("#p-para").mouseup(function (e) {
                saveSelectionText();
            });
});

function saveSelectionText() {
	var textarea = document.getElementById("p-para");
	var selection = window.getSelection();
	var range = selection.getRangeAt(0);

    var txt = window.getSelection().toString();
	var start = window.getSelection().anchorOffset; //开始位置
	var end = window.getSelection().focusOffset;  //结束位置

    var selectAnchorNode = selection.anchorNode;
    var nodebegin = selection.anchorOffset;
    var selectFocusNode = selection.focusNode;
    console.log(selectAnchorNode);
	var begin = 0;
    var nodelist = textarea.childNodes;
    for (var i = 0;i < nodelist.length;i++){
        var templength = nodelist[i].textContent.length;

        console.log(nodelist[i].textContent);

        console.log(nodelist[i].contains(selectAnchorNode));
    	if(nodelist[i].contains(selectAnchorNode) ){
    	    var nodeindex = nodelist[i].textContent.indexOf(selectAnchorNode.textContent);
            begin = begin + nodeindex + nodebegin;
            console.log("-----");
            console.log(begin);
            break;
		}
        begin += templength;
	}
}
