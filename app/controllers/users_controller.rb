# frozen_string_literal :true
class UsersController < ApplicationController
  # before_action :set_user, only: %i[show edit update destroy signup signin]
  # before_action :authenticate, only: %i[signup signin]

  # POST '/sign-up'
  def signup
    user = User.new(user_params)
    if user.valid?
      render json: user, status: :created
    else
      render json: user.errors, status: :bad_request
    end
  end

  # POST '/sign-in'
  def signin
    creds = user_params
    if (user = User.authenticate creds[:username],
                                 creds[:password])
      render json: user, serializer: UserLoginSerializer, root: 'user'
    else
      head :unauthorized
    end
  end

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    # @tasks = @user.tasks
    render json: user
  end

  # GET /users/new
  # def new
  #   @user = User.new
  # end

  # GET /users/1/edit
  # def edit; end

  # POST /users
  # POST /users.json

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url, notice: 'Thank you for signing up!'
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  # def set_user
  #   @user = User.find(params[:id])
  # end
  # removed `require(:user).` after params.
  def user_params
    params.require(:credentials)
          .permit(:username, :password, :password_confirmation)
  end

  private :user_params
end
