Fabricator(:article) do
	title { Faker::Lorem.sentence }
	description { Faker::Lorem.paragraph(2) }
	types { ["khuyến mại", "tin tức", "thông báo", "báo chí"].sample((1..4).to_a.sample) }
  photo { File.open(File.join(Rails.root, 'app', 'assets', 'images', 'item'+(1..8).to_a.sample.to_s+'.png'))}
end
