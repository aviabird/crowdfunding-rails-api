class CreateCharge
  prepend SimpleCommand

  def initialize(token, amount, user, project)
    @token = token
    @amount = amount.to_i
    @user_id = user.id
    @project = project
  end

  def call
    create_charge
    if @charge && @charge["status"] == "succeeded"
      increase_project_funded_amount_and_backers
      add_charge_to_funding_transactions
      add_to_project_backers
      create_notification
    else
      nil
    end
  end

  private

  def create_charge
    amount = @amount * 100 # since stripe accepts amount in lowest denomination
    @charge = Stripe::Charge.create(
      :amount => amount,
      :currency => "usd",
      :description => "Example charge",
      :source => @token,
    )

    rescue Stripe::CardError => e
      errors.add :card_error, e.message 
  end

  def increase_project_funded_amount_and_backers
    @project.funded_amount += @amount
    @project.total_backers += 1
    @project.save
  end

  def add_charge_to_funding_transactions
    charge_id = @charge.id
    amount = @charge.amount
    currency = @charge.currency
    
    #create a new transaction
    FundingTransaction.create(
      charge_id: charge_id,
      amount: amount,
      currency: currency,
      project_id: @project.id,
      user_id: @user_id
    )
  end

  def add_to_project_backers
    ProjectBacker.create(
      user_id: @user_id,
      project_id: @project.id
    )
  end

  def create_notification
    Notification.create(user_id: @project.user_id, subject: 'Project Funded', description: "Your project was funded with amount #{@amount}")
  end

end