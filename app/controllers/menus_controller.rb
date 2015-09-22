class MenusController < ApplicationController

  before_action :get_type, only: [:new, :create]
  before_action :get_size, only: [:new, :create]

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(menu_params)

    if @menu.save
      redirect_to menus_show_path(@menu), notice: 'Menu was successfully created'
    else
      render action: 'new'
    end
  end

  def update
    @menu = Menu.find(params[:id])

    if @menu.update(menu_params)
      redirect_to menus_show_path(@menu), notice: 'Menu was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def edit
    @menu = Menu.find(params[:id])
  end

  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy
    redirect_to menus_index_path, notice: 'Menu was successfully deleted.'
  end

  def index
    @menus = Menu.all
  end

  def show
    @menu = Menu.find(params[:id])

    redirect_to menus_show_path(@menu)
  end

  private 
    def menu_params
      params.require(:menu).permit(:name, :price, :type_id, :size_id)
    end

    def get_type
      @type = Type.find(params[:type_id])
    end

    def get_size
      @size = Size.find(params[:size_id])
    end
end
