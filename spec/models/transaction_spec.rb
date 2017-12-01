require 'rails_helper'

RSpec.describe Transaction, type: :model do
    it { should validate_presence_of(:category) }
    it { should validate_presence_of(:price) }
    it { should validate_numericality_of(:price) }
    it { should validate_presence_of(:sq__ft) }
    it { should validate_numericality_of(:sq__ft) }
end


