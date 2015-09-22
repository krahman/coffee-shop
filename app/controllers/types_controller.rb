class TypesController < ApplicationController
  def new
    @type = Type.new
  end

  def create
    @type = Type.new(type_params)

    if @type.save
      redirect_to types_show_path(@type), notice: 'Type was successfully created.'
    else 
      render action: 'new'
    end

  end

  def update
    @type = Type.find(params[:id])

    if @type.update(type_params)
      redirect_to types_show_path(@type), notice: 'Type was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def edit
    @type = Type.find(params[:id])
  end

  def destroy
    @type = Type.find(params[:id])
    @type.destroy
    redirect_to types_index_path, notice: 'Type was succesfully deleted.'
  end

  def index
    @types = Type.all
    redirect_to types_index_path
  end

  def show
    @type = Type.find(params[:id])
    redirect_to types_show_path(@type)
  end

  private
    def type_params
      params.require(:type).permit(:name)
    end

end
