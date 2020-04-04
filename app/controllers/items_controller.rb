class ItemsController < ApplicationController
before_action :set_items
before_action :find_user

  def index
    if params[:query].present?
      sql_query = "category ILIKE :query OR name ILIKE :query"
      @items = Item.where(user_id: @user)
      @items = Item.where(sql_query, query: "%#{params[:query]}%")
    else
      @items = Item.where(user_id: @user)
      # @data = Item.group(:category).count
      @items = @items.order(:created_at).reverse
    end
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
     if @item.save
      flash[:notice] = "Thanks! Your item has been added."
      redirect_to items_path
    else
      render :new
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    flash[:notice] = "Your item has been removed!"
    redirect_to root_path
  end

private
  def find_user
    @user = current_user
  end

  def set_items
    @items = Item.where(user_id: @user)
  end

  def item_params
    params.require(:item).permit(:name, :category, :expires, :purchased)
  end
end

