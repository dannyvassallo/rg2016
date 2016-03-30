class RutgersClasses::StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def import
    @class = RutgersClass.friendly.find(params[:rutgers_class_id])
    @class.students.import(params[:file])
    redirect_to @class
  end

  def show
    @class = RutgersClass.friendly.find(params[:rutgers_class_id])
    @student = @class.students.friendly.find(params[:id])
  end

  def new
    @class = RutgersClass.friendly.find(params[:rutgers_class_id])
    @student = Student.new
  end

  def create
    @class = RutgersClass.friendly.find(params[:rutgers_class_id])
    @student = @class.students.build(student_params)
    @student.rutgers_class = @class
    if @student.save
      redirect_to @class
    else
      flash[:error] = @student.errors.full_messages
      render :new
    end
  end

  def update
    @class = RutgersClass.friendly.find(params[:rutgers_class_id])
    @student = @class.students.friendly.find(params[:id])
    if @student.update(student_params)
      redirect_to rutgers_class_student_path, notice: "student was saved successfully."
    else
      flash[:error] = @student.errors.full_messages
      render :edit
    end
  end

  def edit
    @class = RutgersClass.friendly.find(params[:rutgers_class_id])
    @student = @class.students.friendly.find(params[:id])
  end

  def destroy
    @class = RutgersClass.friendly.find(params[:rutgers_class_id])
    @student = Student.friendly.find(params[:id])
    @student.destroy
    flash[:notice] = "student deleted"
    redirect_to @class
  end

  private

  def student_params
    params.require(:student).permit(:name, :class_id)
  end
end
