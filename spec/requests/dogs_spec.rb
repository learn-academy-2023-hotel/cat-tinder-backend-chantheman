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
  

# RSPEC REQUEST
  # THIS IS WITH OUT A NAME
  it "doesn't create a dog without a name" do
    dog_params = {
      dog: {
        age: 2,
        enjoys: 'walking in the park',
        image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
      }
    }
    post '/dogs', params: dog_params

    expect(response.status).to eq 422

    json = JSON.parse(response.body)
    expect(json['name']).to include "can't be blank"
  end


  # THIS IS WITHOUT AN AGE
  it "doesn't create a dog without a age" do
    dog_params = {
      dog: {
        name: 'toto',
        enjoys: 'walking in the park',
        image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
      }
    }
    post '/dogs', params: dog_params

    expect(response.status).to eq 422

    json = JSON.parse(response.body)
    expect(json['age']).to include "can't be blank"
  end
  

 # THIS IS WITHOUT AN ENJOYS
  it "doesn't create a dog without an enjoys" do
    dog_params = {
      dog: {
        name: 'toto',
        age: 4,
        image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
      }
    }
    post '/dogs', params: dog_params

    expect(response.status).to eq 422

    json = JSON.parse(response.body)
    expect(json['enjoys']).to include "can't be blank"
  end


  # THIS IS WITHOUT AN IMAGE
  it "doesn't create a dog without an image" do
    dog_params = {
      dog: {
        name: 'toto',
        age: 4,
        
      }
    }
    post '/dogs', params: dog_params

    expect(response.status).to eq 422

    json = JSON.parse(response.body)
    expect(json['image']).to include "can't be blank"
  end




  #  UPDATE STRETCH
   describe "PATCH /update" do
    it "updates a dog" do
      dog_params = {
        dog:{
          name: "Rocky",
          age: 3,
          enjoys: "hiding on the couch",
          image: 'https://cdn.britannica.com/84/232784-050-1769B477/Siberian-Husky-dog.jpg'
      }
    }
      patch '/dogs', params: dog_params

      dog = Dog.last
      
        dog_params_update = {
          dog:{
            name: "Rocky",
            age: 3,
            enjoys: "running",
            image: 'https://cdn.britannica.com/84/232784-050-1769B477/Siberian-Husky-dog.jpg'
          }
        }
      patch "/dogs/#{dog.id}", params: dog_params_update
      expect(response).to have_http_status 200

      dog = Dog.first
      expect(dog.enjoys).to eq 'running'
    end
  end 
end
