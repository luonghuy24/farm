class Article
	include Mongoid::Document
	field :title, type: String
	field :description, type: String
	field :types, type: Array
  mount_uploader :photo, ArticlePhotoUploader
end