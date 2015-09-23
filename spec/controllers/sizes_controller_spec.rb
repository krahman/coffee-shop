require 'rails_helper'

RSpec.describe SizesController, type: :controller do

  before :each do
    @size = FactoryGirl.create(:size, name: 'Grande')
  end

  describe "GET #new" do
    it "assigns a new size" do
      get :new
      expect(assigns(:size)).to be_a_new(Size)
    end
  end

  describe "POST #create" do
    context 'with valid attributes' do
      it "creates a new size" do
        expect{
          post :create, id: @size, size: FactoryGirl.attributes_for(:size)
        }.to change(Size, :count).by(1)
      end

      it 'redirects to the "show" action for the new size' do
        post :create, id: @size, size: FactoryGirl.attributes_for(:size)
        expect(response).to redirect_to Size.last
      end
    end 
  end

  describe "PUT #update" do
    context 'with valid attributes' do
      it "update the requrested @size" do
        put :update, id: @size, size: FactoryGirl.attributes_for(:size)
        expect(assigns(:size)).to eq(@size)
      end
    end
  end

  describe "GET #edit" do
    it "edit the requested @size" do
      get :edit, {:id => @size}
      expect(assigns(:size)).to eq(@size)
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested size" do
      expect{
        delete :destroy, {:id => @size}
      }.to change(Size, :count).by(-1)
    end

    it 'redirects to the size index page' do
      delete :destroy, {:id => @size}
      expect(response).to redirect_to sizes_path
    end
  end

  describe "GET #index" do
    it "get all size list" do
      get :index
      expect(assigns(:sizes)).to eq(Size.all)
    end
  end

  describe "GET #show" do
    it "show current assigned size" do
      get :show, id: @size
      expect(assigns(:size)).to eq(@size)
    end
  end

end
