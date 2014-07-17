require 'rails_helper'

RSpec.describe PeopleController, :type => :controller do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      expect(response).to be_success
    end
  end

  describe "GET 'create'" do
    it "returns http success" do
      get 'create'
      expect(response).to be_success
    end
  end

  describe "GET 'view'" do
    it "returns http success" do
      get 'view'
      expect(response).to be_success
    end
  end

end
