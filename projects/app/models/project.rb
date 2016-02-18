class Project < ActiveRecord::Base
  def self.search(search)
    if search
      self.where("title LIKE ?", "%#{search}%")
    else
      self.all
  end
end
end