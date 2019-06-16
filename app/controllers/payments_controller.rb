class PaymentsController < ApplicationController
  def create
    current_user.generate_pin # create pin and save into db
    current_user.send_pin # send generated pin to user .
  end
  def verify
    if current_user.verify(params[:pin])
      # user gets email with product details after successfull Payments
      SendCustomerMailer.order_details(current_user,current_order.order_items).deliver_now  # send email to user upon successfull purchase
      # updates each order to user 
      total = current_order.order_items.pluck(:total_price).inject(:+)
      current_order.save
      current_order.update({ user: current_user, total: total })
      session[:order_id] = nil
    end
  end
end
