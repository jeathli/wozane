require 'rails_helper'

RSpec.describe PhotosController, type: :controller do
  describe "GET #index" do
    let!(:older_photo) { FactoryGirl.create(:photo, created_at: 1.hour.ago) }
    let!(:newer_photo) { FactoryGirl.create(:photo) }

    before { get :index }

    it "returns 200 OK" do
      expect(response).to have_http_status(:ok)
    end

    it "renders the index template" do
      expect(response).to render_template("index")
    end

    it "returns sortered results" do
      expect(assigns(:photos)).to eq([newer_photo, older_photo])
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

      it "assigns the requested as @photo" do
        expect(assigns(:photo)).to be_a_new(Photo)
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
        post :create, params: { photo: {
          title: "Testbar",
          text: "feel the love",
          img_url: 'http://example.com/image.jpg'
        } }
      end

      it "redirects to created_photo" do
        expect(response).to redirect_to(photos_path)
      end
    end

    context "invalid params" do
      before do
        session[:admin] = true
        post :create, params: { photo: {
          title: "Foo",
          text: "feel the love",
          img_url: 'http://example.com/image.jpg'
        } }
      end

      it "renders the 'new' template" do
        expect(response).to render_template(:new)
      end

      it "raises error" do
        expect { Photo.new.Foo }.to raise_error
      end
    end
  end

  describe "PUT #update" do
    let(:photo) { FactoryGirl.create(:photo) }

    context "valid params" do
      let(:new_photo) { {
        title: "Testbar",
        text: "feel the love",
        img_url: 'http://example.com/image.jpg'
      }}

      before do
        session[:admin] = true
        process :update, method: :put, params: {
          title: "Foobar"
        }
      end

      it "assigns the requested photo as @photo" do
        expect(assigns(:photo)).to eq(photo)
      end

      it "renders edit template" do
        expect(response).to render_template(:edit)
      end
    end
  end
end