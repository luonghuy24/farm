class ContactMailer < ApplicationMailer
	def contact_email(params)
    @email = params[:contact][:email]
    @message = params[:contact][:message]
    mail(from: @email, to: 'cesc1104@gmail.com', subject: "#{@email}", sent_on: Time.now)
  end
end
