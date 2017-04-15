class AuthenticateUser
  prepend SimpleCommand

  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    user = authenticated_user
    if user
      if !user.email_confirmed
        errors.add :user_authentication, 'Please activate your account by following the instructions in the account confirmation email you received to proceed'
        return nil
      end
      token = JsonWebToken.encode(user_id: user.id)
      { auth_token: token, user: user }
    else
      nil
    end      
  end

  private

  attr_reader :email, :password

  def authenticated_user
    user = User.find_by_email(email)
    return user if user && user.authenticate(password)

    errors.add :user_authentication, 'invalid credentials'
    nil
  end

end