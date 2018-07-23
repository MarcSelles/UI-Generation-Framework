var numCol = 4;
var breakpoints = [];
// fires on resize of browser


// function numberOfColumns(parent, child, classParent) {
	
// 	var parentWidth = parent.offsetWidth;
// 	var childWidth = child.offsetWidth;

// 	if ($(window).width() > breakpoints[breakpoints.length-1]) {
// 		var index = breakpoints.indexOf($(window).width());
// 		breakpoints.splice(breakpoints.length-1, 1);

// 		console.log("br" + breakpoints)
// 		numCol = numCol + 1
// 		for (var i = 0; i < classParent.length; i++) {
// 			console.log(classParent.length);
// 			var column = 100 / numCol;
// 			classParent[i].style.flexBasis = column + "%";
// 		}
		
// 		return;
// 	}

// 	if ((childWidth + 10) >= parentWidth & !breakpoints.includes($(window).width())) {
//     	breakpoints.push(+$(window).width() + +30);
//     	console.log("Break" + breakpoints)
//     	numCol = numCol - 1;
// 		for (var i = 0; i < classParent.length; i++) {
// 			var column = 100 / numCol;
// 			classParent[i].style.flexBasis = column + "%";
// 		}
// 	}
// }

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

	var test = document.getElementById("minbez");
	var ctx=test.getContext("2d");
	

	console.log("test" + ctx.measureText(txt).width);
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