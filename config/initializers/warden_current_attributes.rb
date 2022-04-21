# frozen_string_literal: true

Warden::Manager.after_authentication do |user, _auth, _options|
  Current.user = user
end

Warden::Manager.before_logout do |_user, _auth, _options|
  Current.user = nil
end
