class Comment < ActiveRecord::Base
  belongs_to :request
  belongs_to :user
  validates :commenter, presence: :true
  validates :body, presence: :true
end
