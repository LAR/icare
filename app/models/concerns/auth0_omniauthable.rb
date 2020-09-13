# frozen_string_literal: true

module Auth0Omniauthable
  extend ActiveSupport::Concern

  included do
    def update_info_from_auth_hash!(auth_hash)
      update(
        email:                   auth_hash.info.email,
        image:                   auth_hash.info.image,
        name:                    auth_hash.info.name,
        access_token:            auth_hash.credentials.token,
        access_token_expires_at: Time.zone.at(auth_hash.credentials.expires_at)
      )
    end
  end
end
