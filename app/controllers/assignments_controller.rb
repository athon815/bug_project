class AssignmentsController < ApplicationController
  before_action :set_assignment, only: [:show, :edit, :update, :destroy]

  # GET /assignments
  # GET /assignments.json
  def index
    # @request = Request.find(params[:request_id])
    @assignments = Assignment.all
  end

  # GET /assignments/1
  # GET /assignments/1.json
  def show
    @request = Request.find(params[:request_id])
  end

  # GET /assignments/new
  def new
    @request = Request.find(params[:request_id])
    @assignment = Assignment.new(:request_id => params[:request_id])
  end

  # GET /assignments/1/edit
  def edit
    @request = Request.find(params[:request_id])
  end

  # POST /assignments
  # POST /assignments.json
  def create
    @request = Request.find(params[:request_id])
    @assignment = Assignment.new(assignment_params)

    respond_to do |format|
      if @assignment.save
        format.html { redirect_to request_assignments_path(@request), notice: 'Assignment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @assignment }
      else
        format.html { render action: 'new' }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assignments/1
  # PATCH/PUT /assignments/1.json
  def update
    respond_to do |format|
      if @assignment.update(assignment_params)
        format.html { redirect_to request_assignments_path, notice: 'Assignment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assignments/1
  # DELETE /assignments/1.json
  def destroy
    @request = Request.find(params[:request_id])
    @assignment.destroy
    respond_to do |format|
      format.html { redirect_to request_assignments_path(@request) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assignment
      @assignment = Assignment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assignment_params
      params.require(:assignment).permit(:title, :description, :user_id, :request_id, :status)
    end
end
