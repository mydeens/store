class PaymentsController < ApplicationController
  def create
    current_user.generate_pin # create pin and save into db
    current_user.send_pin # send generated pin to user .
  end
  def verify
    if current_user.verify(params[:pin])
      # user gets email with product details after successfull Payments
      SendEmailMailer.welcome(current_user,current_order.order_items).deliver_now! rescue nil # send email to user upon successfull purchase
      # updates each order to user 
      current_order.order_items.each do |each_order|
        order = current_user.orders.create(product_id: each_order.product_id, user: current_user)
        order.update({total_price: each_order.total_price, quantity: each_order.quantity})
      end
      current_order = nil
    end
  end
end
