var numCol = 4;
var breakpoints = [];
var custom = [];
var changedElement = [];
var removeVertical = [];

var coll = document.getElementsByClassName("collapsible");
var i;

// Determine the number of columns of a multiplicity. 
// If the screensize changes, the number of columns will also be changed to the right fit. 
function numberOfColumns(parent, child, marginChild, classParent) {
	var parentWidth = parent.offsetWidth;
	// Width of the first child in the container. Assuming that every child has the same width
	var childWidth = child.offsetWidth;
	var numCol;

	var childStyle = window.getComputedStyle(child),
		childMinWidth = parseInt(childStyle.getPropertyValue('min-width')),
		childMaxWidth = parseInt(childStyle.getPropertyValue('max-width'));

	// If all elements fit the screen, the number of columns equals the number of elements
	// If not, the number of columns will be the width of the whole container / minimum width of a child + margin
	if(childMaxWidth * classParent.length < parent.parentElement.offsetWidth) {
		numCol = classParent.length;
	} else {numCol = parent.parentElement.offsetWidth / (childMinWidth + marginChild)}

	// Set width of each column in %
	var column = 100 / parseInt(numCol);

	// For each column, use flexbasis to set the width
	for (var i = 0; i < classParent.length; i++) {
		classParent[i].style.flexBasis = column + "%";
	}
}

// When a UI component does not fit its container, the font-size will be reduced
// When the original UI component still does not fit, this UI component will be transformed into a custom one.
function originalOrCustom(parent, child, marginChild) {
	var parentWidth = parent.offsetWidth;
	var childWidth = child.offsetWidth;

	// Get start font-size
	var originalFontSizeChild = window.originalFontSizes.find(function(i) {
		return child === i[0]
	});

	// Get the importance "number" of the child to change. All child elements with this number need to be changed.
	var importance = $.grep(child.className.split(" "), function(v, i){
       return v.indexOf('importance') === 0;
   }).join();

	// Change font-size
	var childFontSize = originalFontSizeChild[1]
	var minFontsize;
	if($( child).hasClass('mainScaling')){minFontsize = 0.8};
	if($( child).hasClass('noScaling')){minFontsize = 1};

	// Change the font-size for all children if the width of the child (+ margin) > width of the parent AND the fontsize > min fontsize
	if(changedElement.includes(child) || childWidth + marginChild > parentWidth && childFontSize > minFontsize * originalFontSizeChild[1]){

		// First, adjust the font-size to original
		$( parent.parentElement).find('p.' + importance + ',' + 'span.' + importance).each(function( index ) {
			if(!$(this).hasClass('custom')){
				$(this).css( "font-size", originalFontSizeChild[1] );
			}
		});
		// Then, adjust the font-size until it fits or reach the min fontsize
		while ( childWidth + marginChild > parentWidth && childFontSize > minFontsize * originalFontSizeChild[1]) {
			$( parent.parentElement).find('p.' + importance + ',' + 'span.' + importance).each(function( index ) {
				var newFontSize = childFontSize - 0.5;
				$(this).css( 'font-size', newFontSize);
			});
			childWidth = child.offsetWidth;
			childFontSize -= 0.5;

			if(!changedElement.includes(child)){
				changedElement.push(child);
			};
		};
	};

	// Transform original UI component into custom UI component if the fontsize == min-fontsize AND the width of the child (+ margin) > width of the parent
	if (childFontSize <= minFontsize * originalFontSizeChild[1] && childWidth + marginChild > parentWidth) {
		for (var i=0, max=20; i < max; i++) {
			if($( child).hasClass(importance)) {
				if ($ (parent.parentElement).find('.' + importance + '.original').css( "display") == "inline") {
					custom.push([$(window).width(), parent]);
				};
				
				// Hide the original UI component
				$( parent.parentElement).find('.' + importance + '.original').each(function( index ) {
					$(this).css( "display", "none" );
					if($(this.parentElement).is("button")){
						$(this.parentElement).css( "display", "none" );
					}
				});

				// Show the custom UI component
				$( parent.parentElement).find('.' + importance + '.custom').each(function( index ) {
					$(this).css( "display", "inline" );
				});
			};
		};
	}
};

// Change the custom UI component back to the original UI component
function returnToOriginal(parent){
	// Show the original UI component
	$( parent.parentElement).find('.original').each(function( index ) {
		$(this).css( "display", "inline" );
		if($(this.parentElement).is("button")){
			$(this.parentElement).css( "display", "inline" );
		}
	});
	// Hide the custom UI component
	$( parent.parentElement).find('.custom').each(function( index ) {
		$(this).css( "display", "none" );
	});
};
	
// Hide or show elements due to a change in the height of the window
function heightOfScreen(element){
	var $el = $(element)
	// Height of the content of the screen
	var bottom = $el.offset().top + $el.outerHeight(true);

	// If height of the content < height of the window, show all elements
	if(bottom < $(window).height()) {
		var removeContent = $(removeVertical[0]).parent()
		$(removeContent).parent().removeClass("collapseContent")
		$(removeContent).parent().attr('style', '');
		$(".collapsible" + removeVertical[0]).remove();
		removeVertical.shift()
	}

	// If height of the content < height of the window, hide elements
	if (bottom > $(window).height()){
		// Find the node with the highest importance "number" to hide
		for(var i=10, min=0; i > min; i--){
			if($(".importance" + i).length > 0 ){
				// Give the element the class "collapseContent" to hide the element and create a button to show them
				var content = $(".importance" + i).parent()
				if(!$(content).parent().hasClass("collapseContent")){
					$(content).parent().addClass("collapseContent");
					$( "<button class='collapsible " + "importance" + i + "'>&#x25BC;</button>" ).insertAfter( ".collapseContent" );
					removeVertical.unshift(".importance" + i)
				}
				break;
			}
		}
	}
	
	var coll = document.getElementsByClassName("collapsible");
	var i;

	// Show the UI components if the button is clicked
	for (i = 0; i < coll.length; i++) {
	  coll[i].addEventListener("click", function() {
	    this.classList.toggle("active");
	    var content = this.previousElementSibling;
	    if (content.style.display === "block") {
	      content.style.display = "none";
	      this.innerHTML = "&#x25BC";
	    } else {
	      content.style.display = "block";
	      this.innerHTML = "&#x25B2";
	    }
	  });
	}
};

window.onload = function() {
	// Determine the number of columns
	if (!document.getElementById('firstParent') == 0) {
		var bezetting = document.getElementById('firstParent');
		var member = document.getElementById('firstChild');
		var classBezetting = document.getElementsByClassName('columns');

		numberOfColumns(bezetting, member, 20, classBezetting)

		if($(bezetting).parent().hasClass('oneRow')){
			$(".oneRow").css("height", $(bezetting).height())
		}
	}

	// Get all p & span elements, containing text
	var all = document.querySelectorAll("p,span");
	
	// Store all original font-sizes of all p & span elements
	window.originalFontSizes = [];
	for (var i=0, max=all.length; i < max; i++) {
		var fontSize = parseInt(window.getComputedStyle(all[i]).getPropertyValue("font-size"));
		window.originalFontSizes.push([all[i],fontSize]);
	}

	// For all p & span elements, check if font-size/UI component needs to be adjusted
	for (var i=0, max=all.length; i < max; i++) {
		if(!$(all[i]).hasClass("memberFontSize")){
			originalOrCustom(all[i].parentElement, all[i], 60);
			// Transform custom UI component back into original UI component if needed
			if(!custom.length == 0){
				for (var i=0, max=custom.length; i < max; i++) {
				     if ($(window).width() > custom[i][0]){
				     	returnToOriginal(custom[i][1].parentElement);
				     	custom.splice(i, 1);
				     };
				};
			};
		}
	};
	heightOfScreen(document.getElementById('content'))
};


window.onresize = function(event) {
	// Determine the number of columns
	if (!document.getElementById('firstParent') == 0) {
		var bezetting = document.getElementById('firstParent');
		var member = document.getElementById('firstChild');
		var classBezetting = document.getElementsByClassName('columns');

		numberOfColumns(bezetting, member, 20, classBezetting);

		if($(bezetting).parent().hasClass('oneRow')){
			$(".oneRow").css("height", $(bezetting).height());
		};
	};

	// Get all p & span elements, containing text
	var all = document.querySelectorAll("p,span");

	// For all p & span elements, check if font-size/UI component needs to be adjusted
	for (var i=0, max=all.length; i < max; i++) {
		if(!$(all[i]).hasClass("memberFontSize")){
			originalOrCustom(all[i].parentElement, all[i], 60);
		    // Transform custom UI component back into original UI component if needed
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
	heightOfScreen(document.getElementById('content'))
}