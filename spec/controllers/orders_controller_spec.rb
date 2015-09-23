require 'rails_helper'

RSpec.describe OrdersController, type: :controller do

  before :each do
    @type = FactoryGirl.create(:type, name: 'Coffee')
    @size = FactoryGirl.create(:size, name: 'Grande')
    @menu = FactoryGirl.create(:menu, name: 'Espresso', price: 4.80, type_id: @type, size_id: @size)
    @order = FactoryGirl.create(:order, qty: 1, menu: @menu)
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #update" do
    it "returns http success" do
      get :update
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

end
