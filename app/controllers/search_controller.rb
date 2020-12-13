class SearchController < ApplicationController
  def search
    @model = params["search"]["model"]
    @content = params["search"]["content"]
    @datas = search_for(@model, @content)
  end

  private
  def partical(model, content)
    if model == 'user'
      User.designer.where("name LIKE ?", "%#{content}%").page(params[:page]).per(15)
    elsif model == 'product'
      Product.exposed.where("name LIKE ?", "%#{content}%").page(params[:page]).per(15)
    end
  end

  def search_for(model, content)
    partical(model, content)
  end
  
end
