class MessagesController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]
    before_action :find_message, only: [:show, :edit, :update, :destroy]



    def index
        @messages=Message.all.order("created_at DESC")
    end

    def show
    end

    def new
        @message=current_user.messages.build
    end

    def create
        @message=current_user.messages.build(message_params)
        if @message.save
            redirect_to root_path, notice: 'Message was successfully created.'
        else
            render 'new'
        end
    end

    def find_message
        @message=Message.find(params[:id])

    end
    def edit

    end
    def update
        if @message.update(message_params)
            redirect_to message_path, notice: 'Message was successfully updated.'
        else
            render 'edit'
        end
    end
    def destroy
        @message.destroy
        redirect_to root_path, notice: 'Deleted Successfully'


    end

    private

    def message_params
        params.require(:message).permit(:title,:description)

    end

end
