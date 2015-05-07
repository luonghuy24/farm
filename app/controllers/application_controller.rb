class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

	def after_sign_in_path_for(resource_or_scope)
		current_cart = Cart.find_or_create_by(user: current_user)
		current_cart.items = nil
	end
  
  def deliver_contact_form
    captcha_message = "The data you entered for the CAPTCHA wasn't correct.  Please try again"
    if verify_recaptcha()
      ContactMailer.contact_email(params).deliver     
      respond_to do |format|
        format.html { redirect_to root_path }
      end
    else
      redirect_to '/about'
      flash[:danger] = captcha_message
    end
  end
end
