(function() {
  $(function() {
    return $('#pins').imagesLoaded(function() {
      return $('#pins').masonry({
        itemSelector: '.box',
        isFitWidth: true,
        columnWidth: function( containerWidth ) {
          return containerWidth / 5;
        }
      });
    });
  });

}).call(this);
