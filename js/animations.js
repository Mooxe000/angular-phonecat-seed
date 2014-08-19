var phonecatAnimations;

phonecatAnimations = angular.module('phonecatAnimations', ['ngAnimate']);

phonecatAnimations.animation('.phone', function() {
  var animateDown, animateUp;
  animateUp = function(element, className, done) {
    if (className !== 'active') {
      return;
    }
    element.css({
      position: 'absolute',
      top: 500,
      left: 0,
      display: 'block'
    });
    jQuery(element).animate({
      top: 0
    }, done);
    return function(cancel) {
      if (cancel) {
        return element.stop();
      }
    };
  };
  animateDown = function(element, className, done) {
    if (className !== 'active') {
      return;
    }
    element.css({
      position: 'absolute',
      top: 0,
      left: 0
    });
    jQuery(element).animate({
      top: -500
    }, done);
    return function(cancel) {
      if (cancel) {
        return element.stop();
      }
    };
  };
  return {
    addClass: animateUp,
    removeClass: animateDown
  };
});
