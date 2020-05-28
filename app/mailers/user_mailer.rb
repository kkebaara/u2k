class UserMailer < ActionMailer::Base
  default from: "Team USA2Kenya <notifications@usa2kenya.com>"

  def welcome_email(user)
    @user = user
    @url = 'http://www.usa2kenya.com'
    attachments.inline['u2k-banner-logo.png'] = File.read(Rails.root.join('app/assets/images/u2k-banner-logo.png'))
    mail(to: @user.email, subject: 'Karibu! Welcome To USA2Kenya!')
  end
  def hq_email_upon_signup(user)
    @user = user
    mail(to: 'signups@usa2kenya.com', :subject => 'New user signed up at U2K!')
  end
end
