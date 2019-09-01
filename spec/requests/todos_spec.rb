# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Todos', type: :request do
  describe 'POST /todos' do
    let(:params) { { todo: { title: 'title' } } }

    it 'returns 201' do
      post '/todos', params: params
      expect(response).to have_http_status(:created)
    end
  end

  describe 'GET /todos' do
    let(:todo) { FactoryBot.create(:todo) }

    before do
      todo
    end

    it 'returns 200' do
      get '/todos'
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /todos/:id' do
    let(:todo) { FactoryBot.create(:todo) }

    before do
      todo
    end

    it 'returns 200' do
      get "/todos/#{todo.id}"
      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'PATCH /todos/:id' do
    let(:todo) { FactoryBot.create(:todo) }
    let(:params1) { { todo: { title: 'title' } } }
    let(:params2) { { todo: { done: true } } }

    before do
      todo
    end

    it 'returns updated title' do
      patch "/todos/#{todo.id}", params: params1
      expect(JSON.parse(response.body)['title']).to eq params1[:todo][:title]
    end

    it 'returns updated done' do
      patch "/todos/#{todo.id}", params: params2
      expect(JSON.parse(response.body)['done']).to eq params2[:todo][:done]
    end
  end

  describe 'DELETE /todos/:id' do
    let(:todo) { FactoryBot.create(:todo) }

    before do
      todo
    end

    it 'returns 204' do
      delete "/todos/#{todo.id}"
      expect(response).to have_http_status(:no_content)
    end
  end
end
