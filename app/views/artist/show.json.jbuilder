json.id @artist.id
json.name @artist.name
json.bio @artist.bio
json.facebook @artist.facebook
json.instagram @artist.instagram
json.avatar url_for(@artist.avatar.url(:medium))

json.images @artist.images do |image|
	json.url url_for(image.img.url(:medium))
end