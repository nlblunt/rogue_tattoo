var appControllers = angular.module('appControllers', ['appServices']);

appControllers.controller('homeController', ['$scope', '$interval', 'homeFactory', function($scope, $interval, homeFactory)
{
	//Set page description
	$scope.$root.metadescription = "Rogue Tattoo, a tattoo shop serving the Rogue Valley in Southern Oregon, including Ashland, Medford, Grants Pass, and everywhere in between.  Owner Josh Ludlow."; 
	
	//Set page title
	$scope.$root.display_title = "Rogue Tattoo - Medford and Southern Oregon - Tattoo and Piercings";

	//Get display images for homepage.  Assign to $scope.display
	homeFactory.displayImages().then(function(data)
	{
		$scope.display = data;
	});

	homeFactory.displayNewsposts().then(function(data)
	{
		$scope.newsposts = data;
	});
}]);

appControllers.controller('artistController', ['$scope', 'artistFactory', function($scope, artistFactory)
{
	//Set page description
	$scope.$root.metadescription = "Tattoo Artists currently at Rogue Tattoo.  Serving the Rogue Valley, including Ashland, Medford, and Grants Pass.";
	
	//Set page title
	$scope.$root.display_title = "Rogue Tattoo - Medford and Southern Oregon - Artists";

	//Get the list of artists from '/list.json'
	artistFactory.getArtistList().then(function(data)
	{
		$scope.artists = data;
		console.log(data);
	});
}]);

appControllers.controller('view_artistController', ['$scope', '$routeParams', 'artistFactory', '$analytics', function($scope, $routeParams, artistFactory, $analytics)
{
    
	artistFactory.getArtist($routeParams.id).then(function(data)
	{
		$scope.artist = data;
		$scope.fullsize = data.data.images[0].url;
		
		//Set page description
		$scope.$root.metadescription = "Rogue Tattoo - Medford and Southern Oregon - " + data.data.name + "'s Tattoo Portfolio.";

		//Set page Title
		$scope.$root.display_title = "Rogue Tattoo - Medford and Southern Oregon - " + data.data.name + "'s Tattoo Portfolio";

	});

	$scope.setFullImage = function(url)
	{
		//$analytics.eventTrack('ClickFullImage', {catagory: 'Tattoo'});
		$scope.fullsize = url;
	}
}]);