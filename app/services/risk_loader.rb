require "singleton"

class RiskLoader
  include Singleton

  def cert_handler
    @cert_handler ||= RiskConnector::AuthCertHandler.new(
      Rails.root.join("certs"),
      Rails.root.join("certs", "public.pem"),
      Rails.application.credentials[Rails.env.to_sym].try(:[], :identity_server)
    )
  end

  def jwt_handler
    @jwt_handler ||= RiskConnector::AuthJwtHandler.new(
      cert_handler.get_public_key
    )
  end

  def session_helper
    @session_helper ||= RiskConnector::SessionHelper.new(
      env_variables[:identity_server],
      env_variables[:identity_server_key],
      jwt_handler
    )
  end

  private

    def env_variables
      @env_variables ||= Rails.application.credentials[Rails.env.to_sym]
    end
end
