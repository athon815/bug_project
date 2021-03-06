class Assignment < ActiveRecord::Base
	belongs_to :request
	belongs_to :user
	validates :title, presence: true, length: {minimum: 5}
	validates :description, presence: :true
end
