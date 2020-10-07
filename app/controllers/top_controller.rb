class TopController < ApplicationController
    
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
        @current_user = User.find_by(uid: params[:uid], pass: params[:pass])
        if @current_user.nil? 
            render top_error_path
        else
            session[:login_uid] = @current_user
            render top_main_path
        end
    end
    
    def logout
        session.delete(:login_uid)
        @current_user = nil
        redirect_to root_path
    end
end