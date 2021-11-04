class CommentsController < ApplicationController
    def new
        @comment = Comment.new
        @image = Image.find(params[:id])
    end

    def create
        @image = Image.find(params[:comment][:image_id])
        @comment = Comment.create(comment_params)
        @comment.save
        @image.comments.append(@comment)
        @image.save
        redirect_to root_path
    end

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_to root_path
    end

    def edit
        @comment = Comment.find(params[:id])
    end

    def update
        @comment = Comment.find(params[:id])
        if @comment.update(comment_params)
          redirect_to root_path
        else
          render :edit
        end
    end

    private

    def comment_params
      params.require(:comment).permit(:comment, :image_id)
    end
end
