require 'rails_helper'

RSpec.describe Episode, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:season) }
    it { should validate_presence_of(:episode) }
    it { should validate_numericality_of(:season).only_integer.is_greater_than(0) }
    it { should validate_numericality_of(:episode).only_integer.is_greater_than(0) }
    
    it 'validates uniqueness of season scoped to episode' do
      create(:episode, season: 1, episode: 1)
      duplicate = build(:episode, season: 1, episode: 1)
      expect(duplicate).not_to be_valid
      expect(duplicate.errors[:season]).to be_present
    end
  end

  describe 'scopes' do
    let!(:s1e1) { create(:episode, season: 1, episode: 1) }
    let!(:s1e2) { create(:episode, season: 1, episode: 2) }
    let!(:s2e1) { create(:episode, season: 2, episode: 1) }

    it 'returns episodes by season ordered by episode' do
      expect(Episode.by_season(1)).to eq([s1e1, s1e2])
    end

    it 'returns episodes ordered by season and episode' do
      expect(Episode.ordered).to eq([s1e1, s1e2, s2e1])
    end
  end

  describe 'serialization' do
    let(:episode) { create(:episode, characters: ['Walter White', 'Jesse Pinkman']) }

    it 'serializes characters as array' do
      expect(episode.characters).to be_a(Array)
      expect(episode.characters).to include('Walter White', 'Jesse Pinkman')
    end
  end
end
