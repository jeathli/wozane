require 'rails_helper'

RSpec.describe Blog::ArticlesController, type: :controller do
  let(:article) { FactoryGirl.create(:article) }

  describe "GET #index" do
    before { get :index }

    it "returns 200 OK" do
      expect(response).to have_http_status(:ok)
    end

    xit "orders DESC" do
      article = FactoryGirl.create(:article, :title =>"Foobar")
      article = FactoryGirl.create(:article, :title => "Barfoo")

      get :index
      expect(article.ordered("created_at DESC")).to eql(["Barfoo", "Foobar"])
    end
  end

  describe "GET #show" do
    before do
      get :show, params: {id: article.to_param}
    end

    it "assigns the requested article as @article" do
      expect(assigns(:article)).to eq(article)
    end

    it "renders the show template" do
      expect(response).to render_template("show")
    end
  end

  describe "GET #new" do
    before do
      @admin = FactoryGirl.create(:admin)
      sign_in @admin
      get :new
    end

    xit "renders the new template" do
      expect(response).to render_template("new")
    end
  end
end