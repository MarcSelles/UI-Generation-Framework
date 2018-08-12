var numCol = 4;
var breakpoints = [];
var custom = [];
var changedElement = [];

// Depends the number of columns of a multiplicity. If the screensize changes, the number of columns will also be changed to the right fit. 
function numberOfColumns(parent, child, marginChild, classParent) {
	var parentWidth = parent.offsetWidth;
	var childWidth = child.offsetWidth;
	var numCol;

	var childStyle = window.getComputedStyle(child),
		childMinWidth = parseInt(childStyle.getPropertyValue('min-width')),
		childMaxWidth = parseInt(childStyle.getPropertyValue('max-width'));

	if(childMaxWidth * classParent.length < parent.parentElement.offsetWidth) {
		numCol = classParent.length;
	} else {numCol = parent.parentElement.offsetWidth / (childMinWidth + marginChild)}

	var column = 100 / parseInt(numCol);

	for (var i = 0; i < classParent.length; i++) {
		classParent[i].style.flexBasis = column + "%";
	}
}

// When an element does not fit its containter, the custom-made solution for this element will be visable.
function originalOrCustom(parent, child, marginChild) {
	var parentWidth = parent.offsetWidth;
	var childWidth = child.offsetWidth;

	var originalFontSizeChild = window.originalFontSizes.find(function(i) {
		return child === i[0]
	});

	var importance = $.grep(child.className.split(" "), function(v, i){
       return v.indexOf('importance') === 0;
   }).join();

	var childFontSize = originalFontSizeChild[1]

	if(changedElement.includes(child) || childWidth + marginChild > parentWidth && childFontSize > 0.8 * originalFontSizeChild[1]){

		$( parent.parentElement).find('p.' + importance + ',' + 'span.' + importance).each(function( index ) {
			$(this).css( "font-size", originalFontSizeChild[1] );
		});

		while ( childWidth + marginChild > parentWidth && childFontSize > 0.8 * originalFontSizeChild[1]) {
			$( parent.parentElement).find('p.' + importance + ',' + 'span.' + importance).each(function( index ) {
				var newFontSize = childFontSize - 0.5;
				$(this).css( 'font-size', newFontSize);
			});
			childWidth = child.offsetWidth;
			childFontSize -= 0.5;
			// console.log(child in changedElement)
			if(!changedElement.includes(child)){
				changedElement.push(child);
			};
		};
	};

	if (childFontSize <= 0.8 * originalFontSizeChild[1] && childWidth + marginChild > parentWidth) {
		for (var i=0, max=20; i < max; i++) {
			if($( child).hasClass('importance' + i)) {
				if ($ (parent.parentElement).find('.' + importance + '.original').css( "display") == "inline") {
					custom.push([$(window).width(), parent]);
				};
				
				$( parent.parentElement).find('.' + importance + '.original').each(function( index ) {
					$(this).css( "display", "none" );
				});
				$( parent.parentElement).find('.' + importance + '.custom').each(function( index ) {
					$(this).css( "display", "inline" );
				});
			};
		};
	}
};

// Change the custom back to the original
function returnToOriginal(parent){
	$( parent.parentElement).find('.original').each(function( index ) {
		$(this).css( "display", "inline" );
	});
	$( parent.parentElement).find('.custom').each(function( index ) {
		$(this).css( "display", "none" );
	});
}


window.onload = function() {
	if (!document.getElementById('firstParent') == 0) {
		var bezetting = document.getElementById('firstParent');
		var member = document.getElementById('firstChild');
		var classBezetting = document.getElementsByClassName('columns');

		numberOfColumns(bezetting, member, 20, classBezetting)
	}
	

	// Change font-size or element
	var all = document.querySelectorAll("p,span");
	
	window.originalFontSizes = [];

	for (var i=0, max=all.length; i < max; i++) {
		var fontSize = parseInt(window.getComputedStyle(all[i]).getPropertyValue("font-size"));
		window.originalFontSizes.push([all[i],fontSize]);
	}
	for (var i=0, max=all.length; i < max; i++) {
		originalOrCustom(all[i].parentElement, all[i], 60);
			

	     // Do something with the element here
		if(!custom.length == 0){
			for (var i=0, max=custom.length; i < max; i++) {
			     if ($(window).width() > custom[i][0]){
			     	returnToOriginal(custom[i][1].parentElement);
			     	custom.splice(i, 1);
			     };
			};
		};
	};
};


window.onresize = function(event) {
	// Number of Columns
	if (!document.getElementById('firstParent') == 0) {
		var bezetting = document.getElementById('firstParent');
		var member = document.getElementById('firstChild');
		var classBezetting = document.getElementsByClassName('columns');

		numberOfColumns(bezetting, member, 20, classBezetting)
	}

	// Change font-size or element
	var all = document.querySelectorAll("p,span");

	for (var i=0, max=all.length; i < max; i++) {
		originalOrCustom(all[i].parentElement, all[i], 60);

	     // Do something with the element here
		if(!custom.length == 0){
			for (var i=0, max=custom.length; i < max; i++) {
			     if ($(window).width() > custom[i][0]){
			     	returnToOriginal(custom[i][1].parentElement)
			     	custom.splice(i, 1);
			     }
			};
		};
	}
}