class SofortPayment
  prepend SimpleCommand

  def initialize(token, amount, user, project, reward)
    @token = token
    @amount = amount.to_i
    @user = user
    @project = project
    @reward = reward
  end

  def call
    create_charge
    if @charge && @charge["status"] == "pending"
      increase_project_funded_amount_and_backers
      add_charge_to_funding_transactions
      add_to_project_backers
      increase_reward_backers_count if @reward
      create_notifications_to_donor_and_creator
      send_email_to_donor
    else
      nil
    end
  end

  private

  def create_charge
    amount = @amount * 100
    @charge = Stripe::Charge.create(
      :amount => amount,
      :currency => "eur",
      :description => "Example charge",
      :source => @token,
    )
  end

  def increase_project_funded_amount_and_backers
    @project.funded_amount += @amount
    @project.total_backers += 1
    @project.save
  end

  def add_charge_to_funding_transactions
    charge_id = @charge.id
    status = @charge.status
    amount = @charge.amount
    currency = @charge.currency

    #create a new transaction
    FundingTransaction.create(
      charge_id: charge_id,
      amount: amount,
      currency: currency,
      project_id: @project.id,
      user_id: @user.id,
      charge_status: status
    )
  end

    def increase_reward_backers_count
      @reward.backers_count += 1;
      @reward.save
    end

  def add_to_project_backers
    ProjectBacker.create(
      user_id: @user.id,
      project_id: @project.id
    )
  end

  def create_notifications_to_donor_and_creator
    Notification.create(user_id: @project.user_id, subject: 'Project Funded', description: "Your project was funded with amount #{@amount}")
    Notification.create(user_id: @user.id, subject: 'Project Donation', description: "You have successfully funded the project with the amount #{@amount}")
  end

  def send_email_to_donor
    UserMailer.donation_confirmed(@user, @amount).deliver
  end

end