require 'rails_helper'

RSpec.describe Character, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should allow_value('Alive').for(:status) }
    it { should allow_value('Deceased').for(:status) }
    it { should allow_value('Presumed dead').for(:status) }
    it { should allow_value('Unknown').for(:status) }
    it { should allow_value(nil).for(:status) }
  end

  describe 'scopes' do
    let!(:alive_character) { create(:character, status: 'Alive') }
    let!(:deceased_character) { create(:character, status: 'Deceased') }
    let!(:breaking_bad_character) { create(:character, category: 'Breaking Bad') }

    it 'returns alive characters' do
      expect(Character.alive).to include(alive_character)
      expect(Character.alive).not_to include(deceased_character)
    end

    it 'returns deceased characters' do
      expect(Character.deceased).to include(deceased_character)
      expect(Character.deceased).not_to include(alive_character)
    end

    it 'returns characters by category' do
      expect(Character.by_category('Breaking Bad')).to include(breaking_bad_character)
    end
  end

  describe 'serialization' do
    let(:character) { create(:character, occupation: ['Teacher', 'Chemist'], appearance: [1, 2, 3]) }

    it 'serializes occupation as array' do
      expect(character.occupation).to be_a(Array)
      expect(character.occupation).to include('Teacher', 'Chemist')
    end

    it 'serializes appearance as array' do
      expect(character.appearance).to be_a(Array)
      expect(character.appearance).to eq([1, 2, 3])
    end
  end
end
