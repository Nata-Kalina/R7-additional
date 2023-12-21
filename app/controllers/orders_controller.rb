class OrdersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :catch_not_found
    before_action :set_order, only: %i[ show edit update destroy ]

    def index
        @orders = Order.all
    end

    def show   
    end

    def new
        @order = Order.new
    end

    def create
        @order = Order.new(order_params)
        if @order.save
            flash.notice = "The order record was created successfully."
            redirect_to @order
        else
            render :new, status: :unprocessable_entity
        end
    end

    def update
        if @order.update(order_params)
            flash.notice = "The order record was updated successfully."
            redirect_to @order
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @order.destroy

        respond_to do |format|
            format.html { redirect_to customers_path, notice: "Order was successfully deleted." }
            format.json { head :no_content }
          end
    end

    private
    def order_params
        params.require(:order).permit(:product_name, :product_count, :customer_id)
    end
    def set_order
        @order = Order.find(params[:id])
    end    
    def catch_not_found(e)
        Rails.logger.debug("We had a not found exception.")
        flash.alert = e.to_s
        redirect_to orders_path
    end
end


