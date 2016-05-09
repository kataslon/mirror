require 'rails_helper'

describe Voting do
	it { should belong_to(:user) }

end
