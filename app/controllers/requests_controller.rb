class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]
  # GET /requests
  # GET /requests.json
  def index
    @requests = Request.all.order(:priority)
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
    @request = Request.find(params[:id])
  end

  # GET /requests/new
  def new
    @request = Request.new

  end

  # GET /requests/1/edit
  def edit
    @request = Request.find(params[:id])
    @assignment = Assignment.new(:request_id => params[:request_id])
  end

  # POST /requests
  # POST /requests.json
  def create
    @request = Request.new(request_params)
    #@assignment = Assignment.new(:request_id => params[:request_id])

    respond_to do |format|
      if @request.save
        if current_user.admin
          format.html { redirect_to new_request_assignment_path(@request), notice: 'Request was successfully created.' }
          format.json { render action: 'show', status: :created, location: @request }
        else
          format.html { redirect_to requests_path, notice: 'Request was successfully created.' }
          format.json { render action: 'show', status: :created, location: @request }
        end 
      else
        format.html { render action: 'new' }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end
  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
    @request = Request.find(params[:id])

    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to @request, notice: 'Request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request.attachment = nil
    @request.save
    @request = Request.find(params[:id])
    
    @request.destroy
    if @request.assignment
    @request.assignment.destroy
  else
    respond_to do |format|
      format.html { redirect_to requests_url }
      format.json { head :no_content }
    end
  end
end

  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:user, :title, :description, :user_id, :kind, :priority, :attachment)
    end
end
