class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :find_message
  before_action :find_comment, only: [:edit, :update, :destroy]
    def create
        @comment = @message.comments.build(comment_params)
       if @comment.user_id = current_user.id
    
        if @comment.save
          redirect_to message_path(@message), notice: 'Comment was successfully created.'
        else
          render 'messages/show'
        end 
      end
      end
    

      def edit
      end
      def update
        if @comment.update(comment_params)
            redirect_to message_path(@message), notice: 'Comment was successfully updated.'
        else
            render 'edit'
        end
      end
      def show 
      end


      def destroy
        @comment.destroy
        redirect_to message_path(@message)

      end


    
      private
    
      def comment_params
        params.require(:comment).permit(:content)
      end
      def find_message
        @message=Message.find(params[:message_id])

      end
      def find_comment
        @comment=@message.comments.find(params[:id])


      end





end
