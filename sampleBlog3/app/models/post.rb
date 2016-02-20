class Post < ActiveRecord::Base

def self.search(search)
	if search	
		self.where("title LIKE ?", "%#{search}%")
	end
end

  validates :title, :presence => true
  has_many :comments

end
