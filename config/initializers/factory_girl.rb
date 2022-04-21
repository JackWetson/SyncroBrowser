# frozen_string_literal: true

if defined?(FactoryBot)

  module ActiveSupport
    class TestCase
      include FactoryBot::Syntax::Methods
    end
  end

end
