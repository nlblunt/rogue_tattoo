var appServices = angular.module('appServices', ['ngResource', 'angularFileUpload']);

appServices.factory('homeFactory', ['$resource', '$http', '$q', function($resource, $http, $q)
{
	var self = {};

	self.displayImages = function()
	{
		var deferred = $q.defer();

		$http('/display_images', {format: 'json'})
		.$promise.then(
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
