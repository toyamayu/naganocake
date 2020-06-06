class Public::CartItemsController < ApplicationController

    def create

        cart_item = CartItem.new(cart_params)
 	    cart_item.end_user_id = current_end_user.id
 	    if current_end_user.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
 		cart =current_end_user.cart_items.find_by(item_id: params[:cart_item][:item_id])
 		#エンドユーザーのカートアイテム中に商品が同じものitem_id:を確認、左がわの中に入っっている右側のものを引き出してpresentで確認
		amount = cart.amount + cart_item.amount
	    cart.update(amount: amount)
	    redirect_to public_cart_items_path
	    else
 	    cart_item.save!
        redirect_to public_cart_items_path
        end

    end

    def index
        @cartitems = current_end_user.cart_items

    end

    def update
        @cartitem = CartItem.find(params[:id])
        if @cartitem.update(cart_params)
        redirect_to public_cart_items_path
        else
            @cartitems = current_end_user.cart_items
            render :index
        end
    end

    def destroy
        cartitem = CartItem.find(params[:id])
        cartitem.delete
        redirect_to public_cart_items_path
    end
    
    def cleare
        cartitems = CartItem.all
        cartitems.delete_all
        redirect_to root_path
    end

    private
    def cart_params
        params.require(:cart_item).permit(:item_id, :end_user_id, :amount)
    end

end
