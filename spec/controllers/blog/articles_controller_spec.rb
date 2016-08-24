require 'rails_helper'

RSpec.describe Blog::ArticlesController, type: :controller do
  let(:artcle) { FactoryGirl.create(:article) }

  describe "GET #index" do
    before { get :index }

    it "returns 200 OK" do
      expect(response).to have_http_status(:ok)
    end

    it "orders DESC" do
      article = FactoryGirl.create(:article, :title =>"Foobar")
      article = FactoryGirl.create(:article, :title => "Barfoo")

      get :index
      expect(article.ordered("created_at DESC")).to eql(["Barfoo", "Foobar"])
    end
  end
end