class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]  # ← 追加

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path, notice: "投稿に成功しました"
    else
      render :new, status: :unprocessable_entity
    end
  end  

  def show
    @comment = Comment.new
  end

  def edit
  end

  def update
    if @prototype.update(prototype_params)
      redirect_to @prototype, notice: "プロトタイプを更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @prototype.destroy
    redirect_to root_path, notice: "プロトタイプを削除しました"
  end

  private

  def prototype_params
    params.require(:prototype)
          .permit(:title, :catch_copy, :concept, :image)
          .merge(user_id: current_user.id)
  end

  def set_prototype
    @prototype = Prototype.find_by!(id: params[:id])
  end

  # 投稿者以外はトップページにリダイレクト
  def authorize_user!
    unless @prototype.user == current_user
      redirect_to root_path, alert: "権限がありません"
    end
  end
end