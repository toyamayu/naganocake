class Admin::OrderDetailsController < ApplicationController

    def update
        detail = OrderDetail.find(params[:id])
        count = OrderDetail.where(order_id: detail.order.id).count
        detail.update(detail_params)

        if detail.production_status_before_type_cast == 2
            detail.order.order_status = 2
            detail.order.update(order_params)
        elsif detail.production_status_before_type_cast == 3 && detail.order.order_details.count == count
            detail.order.order_status = 3
            detail.order.update(order_params)
        end
        redirect_to admin_order_path(detail.order)
    end

    private

    def order_params
        params.permit(:order_status)
    end

    def detail_params
        params.require(:order_detail).permit(:production_status)
    end
end
