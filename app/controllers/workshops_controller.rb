# == Schema Information
#
# Table name: workshops
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  description :text
#  url         :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class WorkshopsController < ApplicationController
  authorize_resource

  before_action :authenticate_user!
  before_action :set_workshop

  # GET /workshops
  def index
    @workshops = Workshop.all
  end

  # GET /workshops/1
  def show
  end

  def synthesis
    @projects = @workshop.projects
    @fields = Field.all
  end

  # GET /workshops/new
  def new
    @workshop = Workshop.new
  end

  # GET /workshops/1/edit
  def edit
  end

  # POST /workshops
  def create
    @workshop = Workshop.new(workshop_params)

    if @workshop.save
      redirect_to @workshop, notice: 'Workshop was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /workshops/1
  def update
    if @workshop.update(workshop_params)
      redirect_to @workshop, notice: 'Workshop was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /workshops/1
  def destroy
    @workshop.destroy
    redirect_to workshops_url, notice: 'Workshop was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workshop
      @workshop = Workshop.find params[:id] if params.include? :id
      @workshop = Workshop.find params[:workshop_id] if params.include? :workshop_id
    end

    # Only allow a trusted parameter "white list" through.
    def workshop_params
      params.require(:workshop).permit(:name, :description, :url)
    end
end
