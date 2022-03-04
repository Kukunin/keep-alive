require 'rails_helper'

RSpec.describe Tag, type: :model do

  it { expect(build(:tag)).to be_valid }

end