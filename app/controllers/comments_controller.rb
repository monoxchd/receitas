#encoding: UTF-8
class CommentsController < ApplicationController
  def create
    @category = Category.find(params[:category_id])
    @recipe = Recipe.find(params[:recipe_id])
    @comment = Comment.new(params[:comment])

    flash[:notice] = 'Comentário enviado com sucesso' if @comment.save
    redirect_to category_recipe_path(@category, @recipe)
  end

  def delete
  end
end