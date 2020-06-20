class Public::OrdersController < ApplicationController
    def new

        session[:order] = Order.new()
        @order = Order.new
        @order_detail = OrderDetail.new
        @orders = Order.all

    end

    def create_session
        session[:order]["end_user_id"] = current_end_user.id
        session[:order]["pay_way"] = params[:order][:pay_way].to_i
        session[:order]["address_option"] = params[:order][:address_option].to_i

        if params[:order][:address_option].to_i == 0
            session[:order]["address"] = current_end_user.address
            session[:order]["postal_code"] = current_end_user.postal_code
            session[:order]["address_user_name"] = "#{current_end_user.last_name} #{current_end_user.first_name}" 

        elsif params[:order][:address_option].to_i == 1
            order = Order.find(params[:order][:id])
            session[:order]["postal_code"] = order.postal_code
            session[:order]["address"] = order.address
            session[:order]["address_user_name"] = order.address_user_name

        elsif params[:order][:address_option].to_i == 2
            session[:order]["postal_code"] = params[:order][:postal_code]
            session[:order]["address"] = params[:order][:address]
            session[:order]["address_user_name"] = params[:order][:address_user_name]
        end

        redirect_to public_order_check_path
    end

    def check
        @cart_items = current_end_user.cart_items
        @total_price = 0
        @cart_items.each do |cart|
            @total_price += cart.item.notax_price * cart.amount
        end
    end

    def done
    end

    def create
        order = Order.create!(session[:order])
        cart_items = current_end_user.cart_items
        cart_items.each do |cart|
            OrderDetail.create!(order_id: order.id,item_id: cart.item.id, name: cart.item.name, price: cart.item.notax_price, total_order: cart.amount )
        end
        
        session[:order].clear
        cart_items.delete_all
        redirect_to public_order_done_path
    end

    


    private
    def order_params
        params.require(:order).permit(:postal_code, :address, :address_user_name)
    end
end
