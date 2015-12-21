var appControllers = angular.module('appControllers', ['appServices']);

appControllers.controller('homeController', ['$scope', '$interval', 'homeFactory', function($scope, $interval, homeFactory)
{
	var current_display = [];
	var reserve_display = [];
	var change_timer;
	
	//Set page description
	$scope.$root.metadescription = "Rogue Tattoo, a tattoo shop serving the Rogue Valley in Southern Oregon, including Ashland, Medford, Grants Pass, and everywhere in between.  Owner Josh Ludlow."; 
	
	//Set page title
	$scope.$root.display_title = "Rogue Tattoo - Medford and Southern Oregon - Tattoo and Piercings";

	function shuffleArray(array) 
	{
    for (var i = array.length - 1; i > 0; i--) {
        var j = Math.floor(Math.random() * (i + 1));
        var temp = array[i];
        array[i] = array[j];
        array[j] = temp;
    }
    return array;
	}

	//Get display images for homepage.  Assign to $scope.display
	homeFactory.displayImages().then(function(data)
	{
		//$scope.display = data;
		
		//Randomize the list of display images
		reserve_display = shuffleArray(data.data);
		console.log(reserve_display);
		for(var i = 0; i < 9; i++)
		{
			current_display.push(reserve_display[0]);
			reserve_display.push(reserve_display[0]);
			reserve_display.shift();
			
		}
		console.log(reserve_display);
		console.log(current_display);
		//$scope.display = shuffleArray(data.data);
		$scope.display = current_display;
	});

	change_timer = $interval(function()
	{
		//Picture change
		//Choose a random slot to change
		var slot = Math.floor((Math.random() * 9));
		//Change to next reserve_display
		$scope.display[slot] = reserve_display[0];
		console.log($scope.display);
		//Shift reserve display
		reserve_display.push(reserve_display[0]);
		reserve_display.shift();
	},7500);
	
	$scope.$on('destroy', function()
	{
		if(angular.isDefined(change_timer))
		{
			$interval.cancel(change_timer);
			change_timer = undefined;
		}
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