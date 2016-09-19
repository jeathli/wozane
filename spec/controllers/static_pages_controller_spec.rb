require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  describe 'about' do
    before { get :about }

    it 'has 200 HTTP code' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders proper view' do
      expect(response).to render_template('about')
    end
  end

  describe 'home' do
    before { get :home }

    it 'has 200 HTTP code' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders proper view' do
      expect(response).to render_template('home')
    end
  end

  describe 'shop' do
    before { get :shop }

    it 'has 200 HTTP code' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders proper view' do
      expect(response).to render_template('shop')
    end
  end

  describe 'welcome' do
    before { get :welcome }

    it 'has 200 HTTP code' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders proper view' do
      expect(response).to render_template('welcome')
    end
  end
end