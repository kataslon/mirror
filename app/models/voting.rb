class Voting < ActiveRecord::Base
  belongs_to :user
  has_many :opinions
  has_many :inviteds

  validates :polls_count, numericality: { greater_than: 4 }

  accepts_nested_attributes_for :opinions

  def belongs_to_initiator?(user)
    user_id == user.id if user
  end

  def in_opinions_stage?
    opinions.count < polls_count * 7
  end

end
