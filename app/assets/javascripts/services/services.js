var appServices = angular.module('appServices', ['ngResource', 'angularFileUpload']);

appServices.factory('homeFactory', ['$resource', '$http', '$q', function($resource, $http, $q)
{
	var self = {};

	self.displayImages = function()
	{
		var deferred = $q.defer();

		$http({method: 'GET', url: '/display_images.json', format: 'json'})
		.then(
			function(data)
			{
				deferred.resolve(data);
			},
			function()
			{
				deferred.reject("Error");
			});
		return deferred.promise;
	};

	return self;
}]);

appServices.factory('artistFactory', ['$http', '$q', function($http, $q)
{
	var self = {};

	self.getArtistList = function()
	{
		var deferred = $q.defer();

		$http({method: 'GET', url: '/list.json', format: 'json'})
		.then(
			function(data)
			{
				deferred.resolve(data);
			},
			function()
			{
				deferred.reject("Error getting artist list");
			});
		return deferred.promise;
	};

	return self;
}])