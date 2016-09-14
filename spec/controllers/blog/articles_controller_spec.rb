require 'rails_helper'

RSpec.describe Blog::ArticlesController, type: :controller do
  let(:article) { FactoryGirl.create(:article) }

  describe "GET #index" do
    let!(:footest_article) { FactoryGirl.create(:article, title: "footest") }
    let!(:bartest_article) { FactoryGirl.create(:article, title: "bartest") }

    before { get :index }

    it "returns 200 OK" do
      expect(response).to have_http_status(:ok)
    end

    it "returns sortered results" do
      expect(assigns(:articles)).to eq([bartest_article, footest_article])
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
      get :new
    end

    it "renders the new template" do
      expect(response).to render_template("new")
    end
  end
end