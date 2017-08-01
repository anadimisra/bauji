module ControllerMacros
  def login_admin
    before(:each) do
      Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
      Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
      admin = User.find_for_omniauth(OmniAuth.config.mock_auth[:google_oauth2])
      admin.add_role "admin"
      sign_in admin
    end
  end

  def login_user
    before(:each) do
      Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
      Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
      user = User.find_for_omniauth(OmniAuth.config.mock_auth[:google_oauth2])
      sign_in user
    end
  end

end