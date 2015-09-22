require 'rails_helper'

RSpec.describe TypesController, type: :controller do

  before :each do
    @type = FactoryGirl.create(:type, name: 'Coffee')
  end
  
  describe "GET #new" do
    it "assigns a new type to @type" do
      get :new
      expect(assigns(:type)).to be_a_new(Type)
    end
  end

  describe "POST #create" do
    context 'with valid attributes' do
      it 'creates a new type' do
        expect{
          post :create, id: @type, type: FactoryGirl.attributes_for(:type)
        }.to change(Type, :count).by(1)
      end
      it 'redirects to the "show" action for the new type' do
        post :create, id: @type, type: FactoryGirl.attributes_for(:type)
        expect(response).to redirect_to types_show_path(Type.last)
      end
    end
  end

  describe "PUT #update" do
    context 'with valid attributes' do
      it "update the requrested @type" do
        put :update, id: @type, type: FactoryGirl.attributes_for(:type)
        expect(assigns(:type)).to eq(@type)
      end
    end
  end

  describe "GET #edit" do
    it "edit the requested @type" do
      get :edit, {:name => 'Tea', :id => @type}
      expect(assigns(:type)).to eq(@type)
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested type" do
      expect{
        delete :destroy, {:name => 'Coffee', :id => @type}
        }.to change(Type, :count).by(-1)
      end

      it 'redirects to the type index page' do
        delete :destroy, {:name => 'Coffee', :id => @type}
        expect(response).to redirect_to types_index_path
      end
    end

    describe "GET #index" do

      it "get all type list" do
        get :index
        expect(assigns(:types)).to eq(Type.all)
      end


      it "redirects to type index page" do
        get :index
        expect(response).to redirect_to types_index_path
      end
    end

    describe "GET #show" do
      it "show current assigned type" do
        get :show, id: @type
        expect(assigns(:type)).to eq(@type)
      end

      it 'redirects to current type page' do
        get :show, id: @type
        expect(response).to redirect_to types_show_path(@type)
      end
    end

  end
