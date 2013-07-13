class Transaction < ActiveRecord::Base
  # attr_accessible :title, :body

  def make_payment
    binding.pry
    if valid?
    customer = Stripe::Customer.create(description:email, plan: plan_id, card: stripe_card_token)
    self.stripe_customer_token = customer.id
    save!
  end
rescue Stripe::InvalidRequestError => e
  logger.error "Stripe error while creating customer: #{e.mesage}"
  errors.add :base, "There was a problem with your credit card."
  end
end
