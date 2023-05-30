# frozen_string_literal: true

class AuthenticatedController < ApplicationController
  acts_as_token_authentication_handler_for Player, fallback: :none
  before_action :authenticate_player!

end
