class ItemsController < ApplicationController
  def index
    if params[:query].present?
      sql_query = "category ILIKE :query OR name ILIKE :query"
      @items = @items.where(sql_query, query: "%#{params[:query]}%")
    else
      @items = Item.all
    end
  end
end
