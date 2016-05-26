class Opinion < ActiveRecord::Base
  belongs_to :user
  belongs_to :voting

  # validates :description, presence: true
end
