class VisitorsController < ApplicationController
    layout 'cart'
    def index
        @products = Product.order(:name)
        @order_item = current_order.order_items.new
    end
end
