Fabricator(:product) do
	product_name { Faker::Commerce.product_name  }
	product_code { ("A".."Z").to_a.sample(3).join + ("0".."9").to_a.sample(5).join}	
	description { Faker::Lorem.sentence }
	standard 'GAP'
  price { Faker::Commerce.price } 
end
