class Admin::CategoriesController < ApplicationController
  before_action :check_if_admin
  
  before_action :find_categories
  before_action :find_category, only: [:show, :edit, :update, :destroy]
    
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
    unless @category
      render text: "не найдена категория с id=#{params[:id]}"
    end
  end
  
  def new
    @category = Category.new
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
    @category = Category.new(category_params)
    if @category.save
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
    if @category.update(category_params)
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
          set_error_notice_to_json_response "Тут надо описать ошибку при обломе сохранения изменений категории"
          add_to_json_response_replace Shop_selectors::ADMIN_CONTENT_WRAPPER, (render_to_string "edit.html.erb")
          render_json_response
        end
      end
    end
  end
  
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    respond_to do |format|
      format.html 
      format.json do
        simple_json_response_with_replace(Shop_selectors::ADMIN_CONTENT_WRAPPER, (render_to_string "index.html.erb") )
      end
    end
  end

  private
  
  def category_params
    params.require(:category).permit(:caption, :parent_id, :order)
  end
  
  def find_category
    @category = Category.find_by_id(params[:id])
  end
  
  def find_categories
    @categories = Category.all.order(:parent_id, :order)
  end
    
end
