require 'rails_helper'

RSpec.describe Article, type: :model do
  context "validates presence of params" do
    it { is_expected.to validate_presence_of(:title) }
  end
end
