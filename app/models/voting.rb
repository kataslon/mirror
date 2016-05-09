class Voting < ActiveRecord::Base
	belongs_to :user
	has_many :opinions

	# validates :description, presence: true
end
