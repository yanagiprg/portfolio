class Post < ApplicationRecord
  # has_many :posts

  def user
    return User.find_by(id: self.user_id)
  end

end
