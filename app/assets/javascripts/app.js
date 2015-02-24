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
		//$locationProvider.html5Mode(true);
		$locationProvider.hashPrefix('!');

		$routeProvider
		.when('/',
		{
			templateUrl: "html/index.html",
			controller: "homeController",

		})
		.when('/artists',
		{
			templateUrl: "html/artists.html",
			controller: "artistController"
		})
		.when('/view_artist/:id',
		{
			templateUrl: "html/artist.html",
			controller: "view_artistController"
		})
		.otherwise({
			redirectTo: '/#!'
		});
	}]);

})();