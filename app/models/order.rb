class Order < ActiveRecord::Base
  include AASM
  has_paper_trail
  belongs_to :user
  has_many :sales

  after_create :send_welcome_email
  def send_welcome_email
    OrderMailer.order_email(self).deliver
    OrderMailer.hq_email_upon_order(self).deliver
  end

  aasm column: 'status' do
    state :pending, initial: true # we have tracking # from customer, enroute to USA address, "danger orange"
    state :processing # arrived at USA2Kenya address, being processed, "warning purple"
    state :en_route # on the way to Kenya offices of USA2Kenya, "info blue"
    state :ready # it's delivered to the U2K location in Kenya, awaiting pickup "success green"
    state :picked_up # order completed, customer picked up their package

    event :receive do # -- email upon order creation
                      # -- email upon receiving order in USA
      transitions from: :pending, to: :processing
    end

    event :ship do
      transitions from: :processing, to: :en_route
    end

    event :deliver do # -- email upon order ready for pickup
      transitions from: :en_route, to: :ready
    end

    event :finish do # -- email upon (@sales.state == "finished")
      transitions from: :ready, to: :picked_up
    end
  end
end
