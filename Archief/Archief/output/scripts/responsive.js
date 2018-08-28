var numCol = 4;
var breakpoints = [];


function numberOfColumns(parent, child, marginChild, classParent) {
	var parentWidth = parent.offsetWidth;
	var childWidth = child.offsetWidth;
	var numCol;

	var childStyle = window.getComputedStyle(child),
		childMinWidth = parseInt(childStyle.getPropertyValue('min-width')),
		childMaxWidth = parseInt(childStyle.getPropertyValue('max-width'));

	console.log(parseInt(childMinWidth));

	if(childMaxWidth * classParent.length < parent.parentElement.offsetWidth) {
		console.log("chi" + childMaxWidth)
		numCol = classParent.length;
		console.log(numCol);
	} else {numCol = parent.parentElement.offsetWidth / (childMinWidth + marginChild)}
	 

	console.log(parseInt(numCol))

	var column = 100 / parseInt(numCol);

	for (var i = 0; i < classParent.length; i++) {
		classParent[i].style.flexBasis = column + "%";
	}
	console.log(parent.offsetHeight);
}


window.onload = function() {
	var bezetting = document.getElementById('firstParent');
	var member = document.getElementById('firstChild');
	var classBezetting = document.getElementsByClassName('columns');

	numberOfColumns(bezetting, member, 30, classBezetting)
}


window.onresize = function(event) {
	// code goes here
	var bezetting = document.getElementById('firstParent');
	var member = document.getElementById('firstChild');
	var classBezetting = document.getElementsByClassName('columns');

	numberOfColumns(bezetting, member, 30, classBezetting)
};