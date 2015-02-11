(function()
{
	var roguetattoo = angular.module('roguetattoo',
		[
			'templates',
			'ngRoute',
			'ngResource',
			'appControllers',
			'appServices',
			'appDirectives',
			'ngDropdowns'
		]);

	roguetattoo.config(['$routeProvider', '$locationProvider', function($routeProvider, $locationProvider)
	{
		$locationProvider.html5Mode(true);

		$routeProvider
		.when('/',
		{
			templateUrl: "html/index.html",
			controller: "homeController"
		})
		.when('/artists',
		{
			templateUrl: "html/artists.html",
			controller: "artistController"
		})
		.otherwise({
			redirectTo: '/'
		});
	}]);

})();