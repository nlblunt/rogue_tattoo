var appControllers = angular.module('appControllers', ['appServices']);

appControllers.controller('homeController', ['$scope', function($scope)
{
	var display = homeFactory.displayImages();
	
	$scope.current_display = "/images/logo.jpg";

	$scope.featured_artist_img = ["/images/logo.jpg","/images/logo.jpg"];
}]);