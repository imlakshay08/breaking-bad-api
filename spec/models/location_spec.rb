require 'rails_helper'

RSpec.describe Location, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'scopes' do
    let!(:abq_location) { create(:location, city: 'Albuquerque') }
    let!(:sf_location) { create(:location, city: 'San Francisco') }
    let!(:nm_location) { create(:location, state: 'New Mexico') }
    let!(:ca_location) { create(:location, state: 'California') }

    it 'returns locations by city' do
      expect(Location.by_city('Albuquerque')).to include(abq_location)
      expect(Location.by_city('Albuquerque')).not_to include(sf_location)
    end

    it 'returns locations by state' do
      expect(Location.by_state('New Mexico')).to include(nm_location)
      expect(Location.by_state('New Mexico')).not_to include(ca_location)
    end
  end
end
