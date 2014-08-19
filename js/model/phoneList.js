$('#search-input input').attr('ng-model', 'query');

$('#search-input select').attr('ng-model', 'orderProp');

$('#search-result ul li').attr('ng-repeat', 'phone in phones | filter:query | orderBy:orderProp');

$('#search-result ul li a').attr('href', '#phones/{{phone.id}}');

$('#search-result ul li a img').attr('ng-src', '{{phone.imageUrl}}');

$('#search-result ul li a:eq(1)').attr('ng-bind', 'phone.name');

$('#search-result ul li p').attr('ng-bind', 'phone.snippet');
