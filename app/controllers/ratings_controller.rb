class RatingsController < ApplicationController
    before_action :logged_in_user
  
    def index
      @themes = Theme.all
    end
  
    def load_image
      @image = Image.where(theme_id: params[:theme_id]).first
      image_path = ActionController::Base.helpers.asset_path("pictures/#{@image.file}")
      render json: { image_url: image_path, image_id: @image.id, ave_value: @image.ave_value || I18n.t('ratings_index.not_rated') }
    end
  
    def prev_image
      @image = Image.where(theme_id: params[:theme_id]).where('id < ?', params[:current_image_id]).last || Image.where(theme_id: params[:theme_id]).last
      image_path = ActionController::Base.helpers.asset_path("pictures/#{@image.file}")
      render json: { image_url: image_path, image_id: @image.id, ave_value: @image.ave_value || I18n.t('ratings_index.not_rated') }
    end
  
    def next_image
      @image = Image.where(theme_id: params[:theme_id]).where('id > ?', params[:current_image_id]).first || Image.where(theme_id: params[:theme_id]).first
      image_path = ActionController::Base.helpers.asset_path("pictures/#{@image.file}")
      render json: { image_url: image_path, image_id: @image.id, ave_value: @image.ave_value || I18n.t('ratings_index.not_rated') }
    end
  
    def rate_image
      @value = Value.new(user_id: current_user.id, image_id: params[:image_id], value: params[:value])
      if @value.save
        @image = Image.find(params[:image_id])
        ave_value = Value.where(image_id: @image.id).average(:value).to_f
        @image.update(ave_value: ave_value)
        render json: { ave_value: ave_value }
      else
        head :unprocessable_entity
      end
    end
  
    private
  
    def logged_in_user
      unless logged_in?
        redirect_to login_url
      end
    end
  end
  