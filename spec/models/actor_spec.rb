require 'rails_helper'

RSpec.describe Actor do
  describe 'relationships' do
    it { should have_many :actor_movies }
    it { should have_many(:movies).through(:actor_movies) }
  end

  describe 'model methods' do
    before do
      @actor1 = Actor.create!(name: "Actor 1", age: 11)
      @actor2 = Actor.create!(name: "Actor 2", age: 22)
      @actor3 = Actor.create!(name: "Actor 3", age: 33)
    end

    it 'orders actors by age' do
      expect(Actor.order_by_age).to eq([@actor1, @actor2, @actor3])
    end

    it 'calcs average actor age' do
      expect(Actor.average_age).to eq(22)
    end
  end
end
