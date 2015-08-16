var appServices = angular.module('appServices', ['ngResource', 'ngFileUpload']);

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

	self.displayNewsposts = function()
	{
		var deferred = $q.defer();

		$http({method: 'GET', url: '/news_articles.json', format: 'json'})
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

	//Get a list of all the artists
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

	//Get the artist info to display on the page
	self.getArtist = function(id)
	{
		var deferred = $q.defer();

		$http({method: 'GET', url: '/show_artist/' + id + '.json', format: 'json'})
		.then(
			function(data)
			{
				deferred.resolve(data);
			},
			function(data)
			{
				deferred.reject(data)
			});
		return deferred.promise;
	};

	return self;
}])