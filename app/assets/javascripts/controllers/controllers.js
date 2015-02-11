var appControllers = angular.module('appControllers', ['appServices']);

appControllers.controller('homeController', ['$scope', '$interval', 'homeFactory', function($scope, $interval, homeFactory)
{

	//Get display images for homepage.  Assign to $scope.display
	homeFactory.displayImages().then(function(data)
	{
		$scope.display = data;
	});
}]);

appControllers.controller('artistController', ['$scope', 'artistFactory', function($scope, artistFactory)
{
	//Get the list of artists from '/list.json'
	artistFactory.getArtistList().then(function(data)
	{
		$scope.artists = data;
		console.log(data);
	});
}]);