require 'rails_helper'

describe User do
	it { should have_many(:votings) }
	it { should have_many(:opinions) }
	
end
