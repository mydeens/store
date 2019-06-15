class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :phone_number, presence: true
  validates :country_code, presence: true

  has_many :orders

  def generate_pin
    self.otp = rand(0000..9999).to_s.rjust(4, "0")
    save
 end
 
 def send_pin
   begin
      phone = "+" + country_code + phone_number unless country_code.match("\\+")
      twilio_client.messages.create( to: phone, from: "+15005550006", body: "Your PIN is #{otp}")
   rescue Exception => e
     result = AuthyJob.perform_now(phone_number, country_code, email)
     update({authy_id: result[1]["user"]["id"]})
     Authy::API.request_sms(:id => authy_id, :force => true).ok?
    end
  end
 def twilio_client
   Twilio::REST::Client.new(Rails.application.secrets.twilio_key, Rails.application.secrets.twilio_secret_token)
 end
 def verify(entered_pin)
    if self.otp == entered_pin or Authy::API.verify(:id => authy_id, :token => entered_pin, :force => true).ok?
      update_columns(otp_verified: true)
    end
  end
end
