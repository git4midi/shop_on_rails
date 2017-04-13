class Admin::UsersController < ApplicationController
  before_action :check_if_admin
  
  before_action :find_users
  before_action :find_user, only: [:show, :edit, :update, :destroy]
    
  layout :get_admin_html_or_json_layout
    
  def index
    respond_to do |format|
      format.html 
      format.json do
        simple_json_response_with_replace(Shop_selectors::ADMIN_CONTENT_WRAPPER, (render_to_string "index.html.erb") )
      end
    end
  end

  def show
    unless @user
      render text: "не найдена категория с id=#{params[:id]}"
    end
  end
  
  def new
    @user = User.new
    respond_to do |format|
      format.html
      format.json do
        simple_json_response_with_replace(Shop_selectors::ADMIN_CONTENT_WRAPPER, (render_to_string "new.html.erb") )
      end
    end
  end
  
  def edit
    respond_to do |format|
      format.html 
      format.json do
        simple_json_response_with_replace(Shop_selectors::ADMIN_CONTENT_WRAPPER, (render_to_string "edit.html.erb") )
      end
    end
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      respond_to do |format|
        format.html { render 'index' }
        format.json do
          simple_json_response_with_replace(Shop_selectors::ADMIN_CONTENT_WRAPPER, (render_to_string "index.html.erb") )
        end
      end
    else
      respond_to do |format|
        format.html { render 'new' }
        format.json do
          simple_json_response_with_replace(Shop_selectors::ADMIN_CONTENT_WRAPPER, (render_to_string "new.html.erb") )
        end
      end
    end
  end
  
  def update
    if @user.update(user_params)
      respond_to do |format|
        format.html { render 'index' }
        format.json do
          set_success_notice_to_json_response "Изменения сохранены успешно"
          add_to_json_response_replace Shop_selectors::ADMIN_CONTENT_WRAPPER, (render_to_string "index.html.erb")
          render_json_response
        end
      end
    else
      respond_to do |format|
        format.html { render 'edit' } 
        format.json do
          set_error_notice_to_json_response "Тут надо описать ошибку при обломе сохранения изменений о пользователе"
          add_to_json_response_replace Shop_selectors::ADMIN_CONTENT_WRAPPER, (render_to_string "edit.html.erb")
          render_json_response
        end
      end
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path
  end

  private
  
  def user_params
    params.require(:user).permit(:user_name, :joomla_user_id)
  end
  
  def find_user
    @user = User.find_by_id(params[:id])
  end
  
  def find_users
    @users = User.all.order(:user_name)
  end
end
