class AssignmentsController < ApplicationController
  def index
    @assignments = Assignment.all
  end

  def show
    @assignment = Assignment.friendly.find(params[:id])
  end

  def new
    @assignment = Assignment.new
  end

  def create
    @assignment = Assignment.new(assignment_params)
    if @assignment.save
      redirect_to assignments_path, notice: "assignment was saved successfully."
    else
      flash[:error] = @assignment.errors.full_messages
      render :new
    end
  end

  def update
    @assignment = Assignment.friendly.find(params[:id])
    if @assignment.update(assignment_params)
      redirect_to assignments_path, notice: "assignment was saved successfully."
    else
      flash[:error] = @assignment.errors.full_messages
      render :edit
    end
  end

  def edit
    @assignment = Assignment.friendly.find(params[:id])
  end

  def destroy
    @assignment = Assignment.friendly.find(params[:id])
    @assignment.destroy
    flash[:notice] = "assignment deleted"
    redirect_to assignments_path
  end

  private

  def assignment_params
    params.require(:assignment).permit(:name)
  end
end
