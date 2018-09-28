# frozen_string_literal: true

# == Schema Information
#
# Table name: todos
#
#  id         :bigint(8)        not null, primary key
#  title      :string(255)      default(""), not null
#  done       :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

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
