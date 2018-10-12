class Post < ApplicationRecord

	validates :author, presence: true, length: { maximum: 50 }
	validates :content, presence: true, length: { maximum: 500 }


end
