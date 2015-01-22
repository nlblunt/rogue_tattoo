json.array!(@images) do |img|
	json.image url_for(img.img.url(:medium))
end