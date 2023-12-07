require 'rails_helper'

RSpec.describe "Dogs", type: :request do
  describe "GET /index" do
    it "gets a list of dogs" do
      Dog.create(
        name: 'NOLA',
        age: 4,
        enjoys: 'walks in the park',
        image: 'https://images.unsplash.com/photo-1612774412771-005ed8e861d2?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D' 
      )

      get '/dogs'

      dog = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(dog.length).to eq 1
    end
  end

  describe "POST /create" do
    it "creates a dog" do 
      dog_params = {
        dog: {
          name: 'Ziggy',
          age: 5,
          enjoys: 'running in the park',
          image: 'https://images.unsplash.com/photo-1612774412771-005ed8e861d2?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D' 
        }
      }

      post '/dogs', params: dog_params

      expect(response).to have_http_status(200)

      dog = Dog.first

      expect(dog.name).to eq 'Ziggy'
    end 
  end

  describe "PATCH /update" do 
    it "updates a dog" do

      dog_params = {
        dog: {
          name: 'Ziggy',
          age: 5,
          enjoys: 'running in the park',
          image: 'https://images.unsplash.com/photo-1612774412771-005ed8e861d2?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D' 
        }
      }
      post '/dogs' , params: dog_params
      dog = Dog.first 

      updated_params = {
        dog: {
          name: 'Kiwi',
          age: 5,
          enjoys: 'running in the park',
          image: 'https://images.unsplash.com/photo-1612774412771-005ed8e861d2?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
        }
      }

      patch "/dogs/#{dog.id}", params: updated_params

      updated_dog = Dog.find(dog.id)
      expect(response).to have_http_status(200)
      expect(updated_dog.name).to eq 'Kiwi'
    end
  end

  describe "DELETE /destroy" do
    it " deletes a dog" do

      dog = Dog.create(
        name: 'Kiwi',
        age: 5,
        enjoys: 'running in the park',
        image: 'https://images.unsplash.com/photo-1612774412771-005ed8e861d2?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
      )

      delete "/dogs/#{dog.id}"
      expect(response).to have_http_status(200)
      delete_dog = Dog.find_by(id: dog.id)
      expect(delete_dog).to be_nil
    end
  end
   








end
