class Voting < ActiveRecord::Base
	belongs_to :user
	has_many :opinions

	validates :polls_count, numericality: { greater_than: 4 }
end
