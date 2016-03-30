class RutgersClassesController < ApplicationController
  def index
    @classes = RutgersClass.all
  end

  def show
    @class = RutgersClass.friendly.find(params[:id])
  end

  def new
    @class = RutgersClass.new
  end

  def create
    @class = RutgersClass.new(class_params)
    if @class.save
      redirect_to rutgers_classes_path, notice: "Class was saved successfully."
    else
      flash[:error] = @class.errors.full_messages
      render :new
    end
  end

  def update
    @class = RutgersClass.friendly.find(params[:id])
    if @class.update(class_params)
      redirect_to rutgers_classes_path, notice: "Class was saved successfully."
    else
      flash[:error] = @class.errors.full_messages
      render :edit
    end
  end

  def edit
    @class = RutgersClass.friendly.find(params[:id])
  end

  def destroy
    @class = RutgersClass.friendly.find(params[:id])
    @class.destroy
    flash[:notice] = "class deleted"
    redirect_to rutgers_classes_path
  end

  private

  def class_params
    params.require(:rutgers_class).permit(:class_name)
  end
end
