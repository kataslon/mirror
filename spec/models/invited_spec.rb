require 'rails_helper'

describe Invited do
	it {should belong_to(:voting) }
end
