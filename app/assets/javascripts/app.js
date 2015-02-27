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
			'angulartics',
			'angulartics.google.analytics'
		]);

	roguetattoo.config(['$routeProvider', '$locationProvider', function($routeProvider, $locationProvider)
	{
		$locationProvider.html5Mode(true);
		//$locationProvider.hashPrefix('!');

		$routeProvider
		.when('/',
		{
			templateUrl: "html/index.html",
			controller: "homeController",
    redirectTo: function(current, path, search)
    {
      if(search.goto){
         return "/" + search.goto
}
else{
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