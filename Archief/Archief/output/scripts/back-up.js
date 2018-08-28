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