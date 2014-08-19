var phonecatControllers;

phonecatControllers = angular.module('phonecatControllers', []);

phonecatControllers.controller('PhoneListCtrl', [
  '$scope', 'Phone', function($scope, Phone) {
    $scope.phones = Phone.query();
    return $scope.orderProp = 'age';
  }
]);

phonecatControllers.controller('PhoneDetailCtrl', [
  '$scope', '$routeParams', 'Phone', function($scope, $routeParams, Phone) {
    $scope.phone = Phone.get({
      phoneId: $routeParams.phoneId
    }, function(phone) {
      return $scope.mainImageUrl = phone.images[0];
    });
    return $scope.setImage = function(imageUrl) {
      return $scope.mainImageUrl = imageUrl;
    };
  }
]);
