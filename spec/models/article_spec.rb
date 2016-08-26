require 'rails_helper'

RSpec.describe Article, type: :model do
  context "title" do
    it "requires a title" do
      expect(:article, title: nil).to be_invalid
    end
  end
end
