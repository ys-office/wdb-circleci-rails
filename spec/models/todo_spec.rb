# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Todo, type: :model do
  describe 'Validate' do
    it 'passes validation' do
      todo = FactoryBot.build(:todo)
      expect(todo).to be_valid
    end

    it 'fails to pass validation when title is nil' do
      todo = FactoryBot.build(:todo, title: nil)
      expect(todo).to be_invalid
    end

    it 'fails to pass validation when done is nil' do
      todo = FactoryBot.build(:todo, done: nil)
      expect(todo).to be_invalid
    end
  end
end
