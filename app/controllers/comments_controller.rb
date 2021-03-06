# frozen_string_literal: true

# All commentable models should use this controller to interact with comments
class CommentsController < ApplicationController
  before_action :set_commentable
  before_action :set_comment, only: %i[edit update destroy]

  # POST /comments
  # POST /comments.json
  def create
    @comment = @commentable.comments.new comment_params
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.commentable, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment.commentable }
      else
        format.html { redirect_to @comment.commentable }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @commentable, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @commentable }
      else
        pp @comment.errors
        pp @comment
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
      @comment.commentable = @commentable
    end

    def set_commentable
      resource, id = request.path.split('/')[1, 2]
      @commentable = resource.singularize.classify.constantize.find(id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(
        :content,
        :hidden,
        :flagged,
        :creator_id
      )
    end
end
