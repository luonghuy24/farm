class Article
	include Mongoid::Document
	field :title, type: String
	field :description, type: String
  mount_uploader :photo, ArticlePhotoUploader
end