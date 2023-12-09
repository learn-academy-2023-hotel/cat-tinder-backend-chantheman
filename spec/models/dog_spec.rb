require 'rails_helper'

RSpec.describe Dog, type: :model do

  it "should validate name" do
    dog = Dog.create(age: 5, enjoys: 'Walks in the park', image: 'https://images.unsplash.com/photo-1612774412771-005ed8e861d2?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D')
    expect(dog.errors[:name]).to_not be_empty
  end

  it "enjoys should be at least ten character long" do 
    dog = Dog.create(age:4, name:'frank', image:'https://images.unsplash.com/photo-1612774412771-005ed8e861d2?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D')
    expect(dog.errors[:enjoys]).to include("is too short (minimum is 10 characters)")
  end

end



end