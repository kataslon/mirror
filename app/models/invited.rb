class Invited < ActiveRecord::Base
	belongs_to :voting

	validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
end
