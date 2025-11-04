class CommentsController < ApplicationController
  before_action :authenticate_user!  # ログイン必須
  before_action :set_prototype        # どのプロトタイプに対するコメントかを取得

  def create
    @comment = @prototype.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @prototype, notice: "コメントを投稿しました"
    else
      redirect_to @prototype, alert: "コメントを入力してください"
    end
  end

  private

  def set_prototype
    @prototype = Prototype.find(params[:prototype_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end