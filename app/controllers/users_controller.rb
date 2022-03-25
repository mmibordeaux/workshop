# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  first_name             :string
#  last_name              :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  project_id             :integer
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  admin                  :boolean          default(FALSE)
#  diploma_year           :integer
#

class UsersController < ApplicationController
  authorize_resource

  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /users
  def index
    @users = User.where.not(admin: true).all
  end

  def diploma
    @year = params[:year]
    @promotion = Promotion.where(diploma_year: @year).first
    @users = @promotion.users.order(:last_name, :first_name)
    @workshops = Workshop.all.order(created_at: :desc)
  end

  def without_diploma
    @users = User.where.not(admin: true).where('(diploma_year=0 or diploma_year IS NULL)').order(:last_name, :first_name).all
  end

  def me
    @user = current_user
  end

  def update_me
    @user = current_user
    @user.update params.require(:user).permit(:first_name, :last_name, :promotion_id)
    redirect_to users_path
  end

  # GET /users/1
  def show
    @fields = Field.all
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :project_id, :admin, :diploma_year, :promotion_id, project_ids: [])
    end
end
