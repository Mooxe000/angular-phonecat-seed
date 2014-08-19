angular.module('phonecatFilters', []).filter('checkmark', function() {
  return function(input) {
    if (input) {
      return '\u2713';
    } else {
      return '\u2718';
    }
  };
});
