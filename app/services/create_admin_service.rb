class CreateAdminService
  def call
    user = User.find_or_create_by!(
      name: Rails.application.secrets.admin_name, 
      email: Rails.application.secrets.admin_email, 
      is_admin: true,
      country_code: '971',
      phone_number: '529141782') do |user|
      user.password = Rails.application.secrets.admin_password
      user.password_confirmation = Rails.application.secrets.admin_password
    end
  end
end
