class ChargeCustomer
  prepend SimpleCommand

  def initialize(customer)
    @customer = customer
  end

  def call
    charge_customer
    if @charge && @charge["status"] == "succeeded"
      add_charge_to_funding_transactions
      add_to_project_backers
      delete_a_customer
    else
      nil
    end
  end

  public

  def charge_customer
    amount = @customer.amount * 100
    @charge = Stripe::Charge.create(
      :amount => amount,
      :currency => "usd",
      :customer => @customer.customer_id,
    )
    rescue Stripe::CardError => e
      puts e.message
  end


  def add_charge_to_funding_transactions
    charge_id = @charge.id
    charge_status = @charge.status
    amount = @charge.amount
    currency = @charge.currency
    project_id = @customer.project_id
    user_id = @customer.user_id

    #create a new transaction
    FundingTransaction.create(
      charge_id: charge_id,
      amount: amount,
      currency: currency,
      project_id: project_id,
      user_id: user_id,
      charge_status: charge_status
    )
  end

  def add_to_project_backers
    project_id = @customer.project_id
    user_id = @customer.user_id

    ProjectBacker.create(
      user_id: user_id,
      project_id: project_id
    )
  end

  #Delete a customer so that it cannot be charged again
  def delete_a_customer
    @customer.delete
  end

end