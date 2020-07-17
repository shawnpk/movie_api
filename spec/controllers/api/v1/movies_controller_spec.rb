require 'rails_helper'

RSpec.describe Api::V1::MoviesController, type: :controller do
  let(:valid_attributes) do
    {
      title: 'American Pie',
      plot: 'Teen comedy',
      release_date: '09-06-1999'
    }
  end

  let(:invalid_attributes) do
    { release_date: nil }
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index, params: {}

      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      movie = create(:movie)
      get :show, params: { id: movie.to_param }

      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    let(:create_movie) { post :create, params: { movie: valid_attributes } }

    context 'with valid params' do
      it 'creates a new movie' do
        expect { create_movie }.to change(Movie, :count).by 1
        # expect do
        #   post :create, params: { movie: valid_attributes }
        # end.to change(Movie, :count).by 1
      end

      it 'returns a 201 status code' do
        post :create, params: { movie: valid_attributes }

        expect(response).to have_http_status :created
      end
    end

    context 'with invalid params' do
      let(:create_movie) { post :create, params: { movie: invalid_attributes } }

      it 'does not create a new movie' do
        expect { create_movie }.not_to change(Movie, :count)
      end

      it 'returns a 422 status code' do
        post :create, params: { movie: invalid_attributes }

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        {
          title: 'American Pie 2',
          release_date: '06-08-2001'
        }
      end

      it 'updates the requested movie' do
        movie = create(:movie)
        put :update, params: { id: movie.to_param, movie: new_attributes }
        movie.reload

        expect(movie.attributes).to include("title" => "American Pie 2")
      end

      it 'returns a 200 status code' do
        movie = create(:movie)
        put :update, params: { id: movie.to_param, movie: valid_attributes }

        expect(response).to have_http_status :no_content
      end
    end

    context 'with invalid params' do
      it 'returns a 422 status code' do
        movie = create(:movie)
        put :update, params: { id: movie.to_param, movie: invalid_attributes }

        expect(response).to have_http_status :unprocessable_entity
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:movie) { create(:movie) }
    let(:destroy_movie) { delete :destroy, params: { id: movie.to_param } }
    it 'destroys the requested movie' do
      expect { destroy_movie }.to change(Movie, :count).by -1
    end
  end
end
