// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
// 넘어가는거
var carousels = $('.carousel');
carousels.each(function() {
  var $obj = $(this);
  var $inner = $obj.find('.carousel-inner');
  
  var id = 'uuid' + new Date().getTime();
  $obj.addClass(id);

  if ($obj.data('shift') === 1) {
    var items = $obj.find('.item > [class*="col-"]'),
        visibleCnt = $obj.find('.item:first [class*="col-"]').length,
        wrapper = "";
    
    // build styles
    var rule_base = '.carousel.' + id + ' .carousel-inner > .item',
        styles = $('<style></style>'),
        rules = [];
        rules[0] = rule_base + '.next {left: ' + (100 / visibleCnt) + '%; transform: none;}';
        rules[1] = rule_base + '.active {left: 0;}';
        rules[2] = rule_base + '.active.left {left: -' + (100 / visibleCnt) + '%; transform: none;}';
        rules[3] = rule_base + '.next.left {left: 0;}';
        rules[4] = rule_base + '.active.right {left: ' + (100 / visibleCnt) + '%; transform: none;}';
        rules[5] = rule_base + '.prev.right {left: 0;}';
        rules[6] = rule_base + '.prev {left: -' + (100 / visibleCnt) + '%; transform: none;}';
    for (var i = 0; i < rules.length; i++) {
      styles.append(rules[i]);
    }
    $obj.prepend(styles);

    // rebuild items
    for (var i = 0; i < $(items).length; i++) {
      var $item = $(items[i]);
      var parent = $item.parent();
      if (parent.hasClass('item')) {
        if (!wrapper.length) {
          wrapper = parent.clone().removeClass('active').html('');
        }
        $item.unwrap();
      }
      
      var itemGroup = [$item];
      for (var x = 1; x < visibleCnt; x++) {
        var a = i + x;
        var next = $(items[a]);
        if (!next.length) {
          next = $(items[(a - $(items).length)]);
        }
        itemGroup[x] = next.clone();
      }
      var newSet = wrapper.clone().html(itemGroup);
      if (i == 0) {
        newSet.addClass('active');
      }
      newSet.appendTo($inner);
    }
  }
});






$(document).ready(function() {
    var overlay = $('.sidebar-overlay');

    $('.sidebar-toggle').on('click', function() {
        var sidebar = $('#sidebar');
        sidebar.toggleClass('open');
        if ((sidebar.hasClass('sidebar-fixed-left') || sidebar.hasClass('sidebar-fixed-right')) && sidebar.hasClass('open')) {
            overlay.addClass('active');
        } else {
            overlay.removeClass('active');
        }
    });

    overlay.on('click', function() {
        $(this).removeClass('active');
        $('#sidebar').removeClass('open');
    });

});

// Sidebar constructor
//
// -------------------
$(document).ready(function() {

    var sidebar = $('#sidebar');
    var sidebarHeader = $('#sidebar .sidebar-header');
    var sidebarImg = sidebarHeader.css('background-image');
    var toggleButtons = $('.sidebar-toggle');

    // Hide toggle buttons on default position
    toggleButtons.css('display', 'none');
    $('body').css('display', 'table');


    // Sidebar position
    $('#sidebar-position').change(function() {
        var value = $( this ).val();
        sidebar.removeClass('sidebar-fixed-left sidebar-fixed-right sidebar-stacked').addClass(value).addClass('open');
        if (value == 'sidebar-fixed-left' || value == 'sidebar-fixed-right') {
            $('.sidebar-overlay').addClass('active');
        }
        // Show toggle buttons
        if (value != '') {
            toggleButtons.css('display', 'initial');
            $('body').css('display', 'initial');
        } else {
            // Hide toggle buttons
            toggleButtons.css('display', 'none');
            $('body').css('display', 'table');
        }
    });

    // Sidebar theme
    $('#sidebar-theme').change(function() {
        var value = $( this ).val();
        sidebar.removeClass('sidebar-default sidebar-inverse sidebar-colored sidebar-colored-inverse').addClass(value)
    });

    // Header cover
    $('#sidebar-header').change(function() {
        var value = $(this).val();

        $('.sidebar-header').removeClass('header-cover').addClass(value);

        if (value == 'header-cover') {
            sidebarHeader.css('background-image', sidebarImg)
        } else {
            sidebarHeader.css('background-image', '')
        }
    });
});

/**
 * Created by Kupletsky Sergey on 08.09.14.
 *
 * Add JQuery animation to bootstrap dropdown elements.
 */

(function($) {
    var dropdown = $('.dropdown');

    // Add slidedown animation to dropdown
    dropdown.on('show.bs.dropdown', function(e){
        $(this).find('.dropdown-menu').first().stop(true, true).slideDown();
    });

    // Add slideup animation to dropdown
    dropdown.on('hide.bs.dropdown', function(e){
        $(this).find('.dropdown-menu').first().stop(true, true).slideUp();
    });
})(jQuery);



(function(removeClass) {

    jQuery.fn.removeClass = function( value ) {
		if ( value && typeof value.test === "function" ) {
			for ( var i = 0, l = this.length; i < l; i++ ) {
				var elem = this[i];
				if ( elem.nodeType === 1 && elem.className ) {
					var classNames = elem.className.split( /\s+/ );

					for ( var n = classNames.length; n--; ) {
						if ( value.test(classNames[n]) ) {
							classNames.splice(n, 1);
						}
					}
					elem.className = jQuery.trim( classNames.join(" ") );
				}
			}
		} else {
			removeClass.call(this, value);
		}
		return this;
	}

})(jQuery.fn.removeClass);