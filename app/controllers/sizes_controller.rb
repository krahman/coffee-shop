class SizesController < ApplicationController
  def new
    @size = Size.new
  end

  def create
    @size = Size.new(size_params)

    if @size.save
      redirect_to sizes_show_path(@size), notice: 'Size was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    @size = Size.find(params[:id])

    if @size.update(size_params)
      redirect_to sizes_show_path(@size), notice: 'Size was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def edit
    @size = Size.find(params[:id])
  end

  def destroy
    @size = Size.find(params[:id])
    @size.destroy
    redirect_to sizes_index_path, notice: 'Size was succesfully deleted.'
  end

  def index
    @sizes = Size.all
  end

  def show
    @size = Size.find(params[:id])
    redirect_to sizes_show_path(@size)
  end

  private
    def size_params
      params.require(:size).permit(:name)
    end

end
