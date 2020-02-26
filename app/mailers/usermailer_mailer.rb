class UsermailerMailer < ApplicationMailer
default from: 'marimanohar1997@gmail.com'
   
   def welcome_email(user)
      @user = user
      @url  = 'http://www.gmail.com'
      mail(to: @user.email, subject: 'Welcome to My Awesome Site')
   end

   def forgot_password_link_send(user)
 	@user = user
    @url  = 'http://www.gmail.com'
    mail(to: @user.email, subject: 'Forgot Password')
   end


end
