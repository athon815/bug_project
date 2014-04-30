class Request < ActiveRecord::Base
	has_one :assignment
	belongs_to :user
	has_many :comments, dependent: :destroy
	validates :title, presence: true, length: {minimum: 5}
	validates_presence_of :user

end
