require 'rails_helper'

RSpec.describe Quote, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:quote) }
    it { should validate_presence_of(:author) }
  end

  describe 'scopes' do
    let!(:walter_quote) { create(:quote, author: 'Walter White') }
    let!(:jesse_quote) { create(:quote, author: 'Jesse Pinkman') }

    it 'returns quotes by author' do
      expect(Quote.by_author('Walter White')).to include(walter_quote)
      expect(Quote.by_author('Walter White')).not_to include(jesse_quote)
    end

    it 'returns a random quote' do
      expect(Quote.random.first).to be_a(Quote)
    end
  end
end
