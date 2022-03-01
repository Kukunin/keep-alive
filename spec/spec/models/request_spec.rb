RSpec.describe Request do
  it { expect(build(:request)).to be_valid }

  describe 'contacts validation' do
    let(:contact_fields) { %i[address phone telegram skype] }
    let(:empty_contacts) { contact_fields.index_with { nil } }

    it { expect(build(:request, empty_contacts)).not_to be_valid }
    it { expect(build(:request, empty_contacts.merge(phone: '123'))).to be_valid }
    it { expect(build(:request, empty_contacts.merge(address: '123'))).to be_valid }
    it { expect(build(:request, empty_contacts.merge(telegram: '123'))).to be_valid }
    it { expect(build(:request, empty_contacts.merge(skype: '123'))).to be_valid }
  end

  it { expect(build(:request, viber: true, phone: nil)).not_to be_valid }
  it { expect(build(:request, viber: false, phone: nil, address: '123')).to be_valid }
end
