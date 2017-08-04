module RequestSpecHelper

  include Warden::Test::Helpers

  def self.included(base)
    base.before(:each) { Warden.test_mode! }
    base.after(:each) { Warden.test_reset! }
  end

  def sign_in
    Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
    user = User.find_for_omniauth(OmniAuth.config.mock_auth[:google_oauth2])
    login_as(user, scope: :user)
  end

  def sign_out
    logout(:user)
  end

end