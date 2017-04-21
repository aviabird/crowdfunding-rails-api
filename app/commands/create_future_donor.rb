class CreateFutureDonor
  prepend SimpleCommand

  def initialize(token, amount, user, project)
    @token = token
    @amount = amount.to_i
    @user = user
    @project = project
  end

  def call
    #create a customer to charge at later stage when the project is fully funded
    create_a_customer
    if @customer
      save_customer_to_charge_in_future
      increase_project_funded_amount
    else
      nil
    end
  end

  private

  def create_a_customer
    email = @user.email
    @customer = Stripe::Customer.create(
      :email => email,
      :source => @token,
    )
  end

  def save_customer_to_charge_in_future
    FutureDonor.create(
      customer_id: @customer.id,
      amount: @amount,
      project_id: @project.id,
      user_id: @user.id
    )
  end

  def increase_project_funded_amount
    @project.funded_amount += @amount
    @project.save
  end

end