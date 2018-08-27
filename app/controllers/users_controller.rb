class UsersController < ApplicationController
  # before_action :set_user, only: [:show, :update, :destroy]
  before_action :authenticate, only: %i[signup signin]

  # POST '/sign-up'
  def signup
    user = User.create(user_params)
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
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:credentials).permit(:username, :password_digest)
    end

    private :user_params
end
