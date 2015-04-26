class GalleryController < ApplicationController
	layout :false
  def index
  	@cars_gallery= Store.all
  end

  def search
        @cars_gallery= Store.find_by_sql ["Select * from stores WHERE product_name like ? or brand like ? or color like ? or description like ?",params[:search],params[:search],params[:search],params[:search]]	  
  end

  def checkout
  end
end
