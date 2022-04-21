# frozen_string_literal: true

module Account
  class DashboardController < Account::ApplicationController
    def index
      redirect_to account_teams_path
    end
  end
end
