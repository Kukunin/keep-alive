module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
      logger.add_tags 'ActionCable', "User #{current_user&.id || 'unknown'}"
    end

    protected

    def find_verified_user
      current_user = env['warden'].user
      # return reject_unauthorized_connection unless current_user

      current_user
    end
  end
end
