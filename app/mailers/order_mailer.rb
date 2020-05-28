class OrderMailer < ActionMailer::Base
  default from: "Team USA2Kenya <orders@usa2kenya.com>"

  def order_email(order)
    @order = order
    @url = order_path(order)
    attachments.inline['u2k-banner-logo.png'] = File.read(Rails.root.join('app/assets/images/u2k-banner-logo.png'))
    mail(to: order.user.email, subject: 'Your USA2KENYA.com order was created')
  end
  def hq_email_upon_order(order)
    @order = order
    mail(to: 'orders@usa2kenya.com', :subject => 'New order created at U2K!')
  end
end
