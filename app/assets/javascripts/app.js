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
			controller: "homeController",
			redirectTo: function(current, path, search){
          	if(search.goto)
          	{
            // if we were passed in a search param, and it has a path
            // to redirect to, then redirect to that path
            return "/" + search.goto
          	}
          	else
          	{
            // else just redirect back to this location
            // angular is smart enough to only do this once.
            return "/"
          	}
        	}
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
			redirectTo: '/'
		});
	}]);

})();