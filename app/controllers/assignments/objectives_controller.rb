class Assignments::ObjectivesController < ApplicationController
  def index
    @objectives = Objective.all
  end

  def import
    @assignment = Assignment.friendly.find(params[:assignment_id])
    @assignment.objectives.import(params[:file])
    redirect_to @assignment
  end

  def show
    @assignment = Assignment.friendly.find(params[:assignment_id])
    @objective = @assignment.objectives.friendly.find(params[:id])
  end

  def new
    @assignment = Assignment.friendly.find(params[:assignment_id])
    @objective = Objective.new
  end

  def create
    @assignment = Assignment.friendly.find(params[:assignment_id])
    @objective = @assignment.objectives.build(objective_params)
    @objective.assignment = @assignment
    if @objective.save
      redirect_to @assignment
    else
      flash[:error] = @objective.errors.full_messages
      render :new
    end
  end

  def update
    @assignment = Assignment.friendly.find(params[:assignment_id])
    @objective = @assignment.objectives.friendly.find(params[:id])
    if @objective.update(objective_params)
      redirect_to assignment_objective_path, notice: "objective was saved successfully."
    else
      flash[:error] = @objective.errors.full_messages
      render :edit
    end
  end

  def edit
    @assignment = Assignment.friendly.find(params[:assignment_id])
    @objective = @assignment.objectives.friendly.find(params[:id])
  end

  def destroy
    @assignment = Assignment.friendly.find(params[:assignment_id])
    @objective = objective.friendly.find(params[:id])
    @objective.destroy
    flash[:notice] = "objective deleted"
    redirect_to @assignment
  end

  private

  def objective_params
    params.require(:objective).permit(:name, :assignment_id)
  end
end
