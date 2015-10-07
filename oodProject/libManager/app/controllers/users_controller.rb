class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :right_user, only: [:edit, :update, :show]
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  def signUp
    @user = User.new
  end
  # GET /users/1
  # GET /users/1.json
  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Library"
      redirect_to @user
    else
      render action: "signUp"
    end
  end

  #for displaying books home page
  def books
    #@books = Book.all
  end

  #for obtaining complete list of users
  def full
    @users = User.all
  end

  #for obtaining complete list of users
  def makeAdmin
    @users = User.all
  end

  #for obtaining complete list of users
  def removeAdmin
    @users = User.all
  end

  def toggle
    @user = User.find(params[:id])
    @user.update_attribute(:ty, 1)
    @user.save
    redirect_to user_path(@user)
    flash[:notice] = 'Successfully made as admin.'
  end



  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
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
    User.find(params[:id]).destroy
    flash[:notice] = "Admin successfully deleted"
    redirect_to(:back)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :ty)
  end
end
