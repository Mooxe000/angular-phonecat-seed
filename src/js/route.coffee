phonecatApp = angular.module 'phonecatApp', [
  'ngRoute'
  'phonecatAnimations'
  'phonecatControllers'
  'phonecatFilters'
  'phonecatServices'
]

phonecatApp.config [
  '$routeProvider'
  ($routeProvider) ->
    $routeProvider
      .when '/phones',
        templateUrl: './view/phone-list.html'
        controller: 'PhoneListCtrl'
      .when '/phones/:phoneId',
        templateUrl: './view/phone-detail.html'
        controller: 'PhoneDetailCtrl'
      .otherwise
        redirectTo: '/phones'
]