require 'rails_helper'

describe Voting do
	it { should belong_to(:user) }
	it { should have_many(:opinions) }
	it { should validate_numericality_of(:polls_count).is_greater_than(4) }
end
