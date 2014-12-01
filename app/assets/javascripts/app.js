(function()
{
	var roguetattoo = angular.module('roguetattoo',
		[
			'templates',
			'ngRoute',
			'ngResource',
			'appControllers',
			'appServices',
			'appDirectives'
		]);

	roguetattoo.config(['$routeProvider', '$locationProvider', function($routeProvider, $locationProvider)
	{
		$locationProvider.html5Mode(true);

		$routeProvider
		.when('/',
		{
			templateUrl: "index.html",
			controller: "homeController"
		})
		.otherwise({
			redirectTo: '/'
		});
	}]);

})();