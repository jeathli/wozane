require 'rails_helper'

RSpec.describe Blog::ArticlesController, type: :controller do
  describe "GET #index" do
    let!(:older_article) { FactoryGirl.create(:article, created_at: 1.hour.ago) }
    let!(:newer_article) { FactoryGirl.create(:article) }

    before { get :index }

    it "returns 200 OK" do
      expect(response).to have_http_status(:ok)
    end

    it "renders the index template" do
      expect(response).to render_template("index")
    end

    it "returns sortered results" do
      expect(assigns(:articles)).to eq([newer_article, older_article])
    end
  end

  describe "GET #show" do
    let!(:article) { FactoryGirl.create(:article) }

    before do
      get :show, params: {id: article.id}
    end

    it "returns 200 OK" do
      expect(response).to have_http_status(:ok)
    end

    it "renders the show template" do
      expect(response).to render_template("show")
    end

    it "assigns the requested article as @article" do
      expect(assigns(:article)).to eq(article)
    end
  end

  describe "GET #new" do
    context "unlogged user" do
      before do
        get :new
      end

      it "redirects to login page" do
        expect(response).to redirect_to(login_path)
      end
    end

    context "logged user" do
      before do
        session[:admin] = true
        get :new
      end

      it "returns 200 OK" do
        expect(response).to have_http_status(:ok)
      end

      it "assigns the requested as @article" do
        expect(assigns(:article)).to be_a_new(Article)
      end

      it "renders the new template" do
        expect(response).to render_template("new")
      end
    end
  end

  describe "POST #create" do
    context "unlogged user" do
      before do
        post :create
      end

      it "redirects to login page" do
        expect(response).to redirect_to(login_path)
      end
    end

    context "valid params" do
      before do
        session[:admin] = true
        post :create, params: { article: {
          title: "Testbar",
          text: "feel the love",
          img_url: 'http://example.com/image.jpg'
        } }
      end

      it "redirects to created_article" do
        expect(response).to redirect_to(blog_articles_path)
      end
    end

    context "invalid params" do
      before do
        session[:admin] = true
        post :create, params: { article: {
          title: "Foo",
          text: "feel the love",
          img_url: 'http://example.com/image.jpg'
        } }
      end

      it "re-renders the 'new' template" do
        expect(response).to render_template(:new)
      end

      it "raises error" do
        expect { Article.new.foo }.to raise_error
      end
    end
  end

  describe "PUT #update" do
    let(:article) { FactoryGirl.create(:article) }

    context "valid params" do
      let(:new_article) { {
        title: "Testbar",
        text: "feel the love",
        img_url: 'http://example.com/image.jpg'
      }}

      before do
        session[:admin] = true
        put :update, params: { article: {
          title: "Foobar"
        } }
      end

      it "assigns the requested article as @article" do
        expect(assigns(:article)).to eq(article)
      end

      xit "renders edit template" do
        expect(response).to render_template(:edit)
      end
    end
  end
end