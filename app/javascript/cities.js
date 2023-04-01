(function() {
  jQuery.fn.animateAuto = function() {
    return this.each(function(i, el) {
      var elem, width;
      el = jQuery(el);
      elem = el.clone().css({
        'width': 'auto'
      }).appendTo(el.parent());
      width = elem.css('width');
      elem.remove();
      el.animate({
        'width': width
      });
    });
  };

  jQuery.fn.hoverToggle = function(a, b) {
    var cb;
    cb = function() {
      [b, a][this._tog ^= 1].call($(this));
    };
    return this.hover(cb);
  };

  jQuery(function() {
    return $('.weather-col').hoverToggle(function() {
      return $(this).find('.forecast').animateAuto();
    }, function() {
      return $(this).find('.forecast').animate({
        width: '0%'
      });
    });
  });

}).call(this);