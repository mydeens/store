class SendCustomerMailer < ApplicationMailer

    # Subject can be set in your I18n file at config/locales/en.yml
    # with the following lookup:
    #
    #   en.send_customer_mailer.order_details.subject
    #
    def order_details(current_user, ordered_items)
      @current_user = current_user
      @ordered_items = ordered_items
      mail(to: current_user.email,
           subject: "Your order on e-Store!"
          )
    end
  end
  