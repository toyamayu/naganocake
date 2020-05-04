class Public::ItemsController < ApplicationController

    def show
        @item = Item.find(params[:id])
        @cart = CartItem.new
    end

    def create
        @cart = CartItem.new(cart_params)
        if @cart.save
            redirect_to public_cart_items_path
        else
            @item = Item.find(params[:id])
            render :show
        end
    end

    def index
        @items = Item.all
    end

    private
    def cart_params
        params.require(:cart_item).permit(:amount)
    end
end
