RSpec.describe User do
  it { expect(build(:user)).to be_valid }

  describe '#username' do
    it 'generates username' do
      expect(build(:user, first_name: 'Сергій', last_name: 'Поліщук').username)
        .to eq('Сергій П')
    end

    it { expect(build(:user, first_name: 'Сергій', last_name: nil).username).to eq('Сергій') }
  end
end
