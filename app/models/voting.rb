class Voting < ActiveRecord::Base
	belongs_to :user
	has_many :opinions
end
