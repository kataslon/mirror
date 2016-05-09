require 'rails_helper'

describe Opinion do
	it { should belong_to(:user) }
	it { should belong_to(:voting) }
	it { should validate_presence_of(:description) }
end
