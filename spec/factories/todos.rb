# frozen_string_literal: true

FactoryBot.define do
  factory :todo do
    title { 'todo' }
    done { false }
  end
end
