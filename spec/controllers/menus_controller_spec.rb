require 'rails_helper'

RSpec.describe MenusController, type: :controller do

  before :each do
    @type = FactoryGirl.create(:type, name: 'Coffee')
    @size = FactoryGirl.create(:size, name: 'Grande')
    @menu = FactoryGirl.create(:menu, name: 'Espresso', price: 4.80, type_id: @type, size_id: @size)
  end

  describe "GET #new" do
    it "assigns a new menu" do
      get :new, {:type_id => @type, :size_id => @size, :id => @menu}
      expect(assigns(:menu)).to be_a_new(Menu)
    end
  end

  describe "POST #create" do
    context 'with valid attributes' do
      it "creates a new menu" do
        expect{
          post :create, type_id: @type, size_id: @size, id: @menu, menu: FactoryGirl.attributes_for(:menu)
        }.to change(Menu, :count).by(1)
      end

      it "redirects to the 'show' action for the new menu" do
        post :create, type_id: @type, size_id: @size, id: @menu, menu: FactoryGirl.attributes_for(:menu)
        expect(response).to redirect_to menus_show_path(Menu.last)
      end
    end 
  end

  describe "PUT #update" do
    context 'with valid attributes' do
      it "update the requrested @menu" do
        put :update, type_id: @type, size_id: @size, id: @menu, menu: FactoryGirl.attributes_for(:menu)
        expect(assigns(:menu)).to eq(@menu)
      end
    end
  end

  describe "GET #edit" do
    it "edit the requested @menu" do
      get :edit, {:type_id => @type, :size_id => @size, :id => @menu}
      expect(assigns(:menu)).to eq(@menu)
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested menu" do
      expect{
        delete :destroy, {:id => @menu}
      }.to change(Menu, :count).by(-1)
    end

    it 'redirects to the menu index page' do
      delete :destroy, {:id => @menu}
      expect(response).to redirect_to menus_index_path
    end
  end

  describe "GET #index" do
    it "get all menu list" do
      get :index, id: @menu
      expect(assigns(:menus)).to eq(Menu.all)
    end
  end

  describe "GET #show" do
    it "show current assigned menu" do
      get :show, id: @menu
      expect(assigns(:menu)).to eq(@menu)
    end

    it 'redirects to current menu page' do
      get :show, id: @menu
      expect(response).to redirect_to menus_show_path(@menu)
    end
  end

end
