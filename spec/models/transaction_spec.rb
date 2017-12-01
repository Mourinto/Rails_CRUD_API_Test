require 'rails_helper'

RSpec.describe Transaction, type: :model do
  it { is_expected.to validate_presence_of :category }
  it { is_expected.to validate_presence_of :price }
  it { is_expected.to validate_numericality_of :price }
  it { is_expected.not_to allow_value(100.5).for(:price) }
  it { is_expected.to validate_presence_of :sq__ft }
  it { is_expected.to validate_numericality_of :sq__ft }
  it { is_expected.to allow_value(100.5).for(:sq__ft) }
end


