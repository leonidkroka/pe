class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    return if current_user.available?

    scope = Devise::Mapping.find_scope!(current_user)
    warden.user(scope: scope, run_callbacks: false)

    warden.logout(scope)
    warden.clear_strategies_cache!(scope: scope)
    instance_variable_set(:"@current_#{scope}", nil)
    render 'devise/sessions/wait'
  end
end
