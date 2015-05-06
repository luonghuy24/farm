class ContactMailer < ApplicationMailer
	def contact_email(params)
    @email = 'cesc1104@gmail.com'
    @message = params[:contact][:message]
    mail(from: @email, to: 'cesc1104@gmail.com', subject: "#{@email}", sent_on: Time.now)
  end
end
