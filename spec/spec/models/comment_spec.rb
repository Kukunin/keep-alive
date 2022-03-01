RSpec.describe Comment do
  it { expect(build(:comment)).to be_valid }

  it { expect(build(:comment, username: nil, user_id: nil)).not_to be_valid }
  it { expect(build(:comment, username: 'імя', user_id: nil)).to be_valid }
  it { expect(build(:comment, username: nil, user: create(:user))).to be_valid }
end
