class Admin::CommentsController < AdminController
  def index
    @comments = Comment.all
  end

  
  def destroy
    comment = Comment.find_by(id: params[:id])
    if comment
      comment.destroy
      flash[:notice] = "コメントを削除しました。"
    else
      flash[:alert] = "コメントが見つかりませんでした。"
    end
    redirect_to admin_recipe_path
  end
end
