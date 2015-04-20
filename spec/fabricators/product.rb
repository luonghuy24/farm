Fabricator(:product) do
	product_name { Faker::Commerce.product_name  }
	product_code { ("A".."Z").to_a.sample(3).join + ("0".."9").to_a.sample(5).join}	
	description { Faker::Lorem.sentence }
	standard 'GAP'
	type { %w(rau\ sạch củ quả thịt hạt hạt\ giống gia\ vị  ).sample(3) }
  price { Faker::Commerce.price } 
  image { File.open(File.join(Rails.root, 'app', 'assets', 'images', 'item'+(1..8).to_a.sample.to_s+'.png'))}
end
