class HomesController < ApplicationController
  def index
    
  end

  def aws
    @Users = User.all
  end

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    if user.save
      flash[:notice] = "#{user.title}のコンテンツを作成しました"
      redirect_to '/homes/aws'
    else
      flash[:alert] = "作成に失敗しました"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      flash[:notice] = "#{user.title}のコンテンツを更新しました"
      redirect_to '/homes/aws'
    else
      flash[:alert] = "更新に失敗しました"
      render :edit
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.delete
    redirect_to '/homes/aws', flash: { notice: "「#{@user.title}」の掲示板が削除されました" }
  end

  def user_params
    params.require(:user).permit(:name, :title, :body)
  end

end
