class ItemsController < ApplicationController
  def index
    if params[:query].present?
      sql_query = "category ILIKE :query OR name ILIKE :query"
      @items = Item.where(sql_query, query: "%#{params[:query]}%")
    else
      @items = Item.all
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
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to root_path
  end


private

def item_params
  params.require(:item).permit(:name, :category, :expires, :purchased)
end

end

