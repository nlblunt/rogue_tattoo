json.array!(@artists) do |artist|
	json.id artist.id
	json.name artist.name
	json.bio artist.bio
	json.avatar url_for(artist.avatar.url(:medium))

	json.images artist.images.last(10) do |image|
		json.url url_for(image.img.url(:medium))
	end
end