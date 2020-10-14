class TopController < ApplicationController
    
    
    def new
       @user = User.new 
    end
    
    
    def create
        @user = User.new(uid: params[:user][:uid], pass: BCrypt::Password.create(params[:user][:pass]))
        if @user.save
            redirect_to root_path
        else
            render 'top/new'
        end
    end
    
    def destroy
        log_out if login?
        redirect_to root_url
    end
    
    def main
        if session[:login_uid] == nil
            render top_login_path
        else
            render top_main_path
        end
    end
    
    def login
        
    end
    
    def login_check
        @current_uid = params[:uid]
        @input_pass = params[:pass]
        @user = User.find_by(uid: @current_uid)
        
        if @user.nil?
            render top_error_path
        elsif BCrypt::Password.new(@user.pass) == @input_pass
            session[:login_uid] = @user
            render top_main_path
        else
            render top_error_path
        end
    end
    
    def logout
        session.delete(:login_uid)
        @current_user = nil
        redirect_to root_path
    end
    private
    
    def user_params
       params.require(:user).permit(:uid, :pass)
    end
    
end