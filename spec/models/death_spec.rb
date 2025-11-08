require 'rails_helper'

RSpec.describe Death, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:death) }
    it { should validate_presence_of(:cause) }
  end

  describe 'scopes' do
    let!(:season1_death) { create(:death, season: 1) }
    let!(:season2_death) { create(:death, season: 2) }
    let!(:walter_kill) { create(:death, responsible: 'Walter White') }
    let!(:hank_kill) { create(:death, responsible: 'Hank Schrader') }

    it 'returns deaths by season' do
      expect(Death.by_season(1)).to include(season1_death)
      expect(Death.by_season(1)).not_to include(season2_death)
    end

    it 'returns deaths by responsible person' do
      expect(Death.by_responsible('Walter White')).to include(walter_kill)
      expect(Death.by_responsible('Walter White')).not_to include(hank_kill)
    end
  end
end
