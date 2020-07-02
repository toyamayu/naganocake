class Admin::OrdersController < ApplicationController
    def index
        @orders = Order.all
    end

    def show
        @order = Order.find(params[:id])
        @orders = @order.order_details 
        @total_price = 0
        @orders.each do |order|
            @total_price += (order.price * order.total_order * 1.1).round
        end
    end

    def update
        order = Order.find(params[:id])
        order.update(order_params)
        if order.order_status_before_type_cast == 1
            order.order_details.each do |order_detail|
                order_detail.production_status = 1
                order_detail.update(detail_params)
            end
        end
        redirect_to admin_order_path(order)
    end

    private

    def order_params
        params.require(:order).permit(:order_status)
    end


    def detail_params
        params.permit(:production_status)
    end
end
