# frozen_string_literal: true

# DO NOT SET SENSITIVE DATA HERE!
# USE ENVIRONMENT VARIABLES OR 'local.rb' INSTEAD

# OVERRIDE THESE DEFAULTS IN A PROPER ENVIRONMENT CONFIGURATION FILE
# SET SENSITIVE DATA ONLY IN 'local.rb'

SimpleConfig.for :application do
  set :app_name, 'LAR icare'
  set :repository_url, 'https://github.com/diowa/icare'

  set :advertising, false
  set :demo_mode, false
  set :base_url, 'localhost:3000'
  set :single_process_mode, true

  set :currency, '.00 £'
  set :fuel_consumption, 0.12
  set :fuel_currency, '£'

  set :costs_calculation_service_link, 'http://servizi.aci.it/CKInternet/'

  set :google_analytics_id, nil
  set :google_maps_api_key, nil

  group :auth0 do
    set :domain, 'AUTH0_DOMAIN'
    set :client_id, 'AUTH0_CLIENT_ID'
    set :client_secret, 'AUTH0_CLIENT_SECRET'
    set :scope, 'openid profile email'
    set :cache_expiry_time, 7.days
  end

  group :airbrake do
    set :project_id, nil
    set :project_key, nil
    set :host, nil
  end

  group :map do
    # defaults to Riseholme
    set :center, [53.268457, -0.529620]
    # [41.87194, 12.567379999999957]
    set :zoom, 8
  end

  group :itineraries do
    # Enable this option if you want to restrict itineraries inside a geographic area
    set :geo_restricted, false

    # Island of Ischia boundaries as Line String, in [lng, lat] format
    # Create one at https://www.gmapgis.com/
    set :bounds, [
      [13.85861, 40.77019],
      [13.97695, 40.74631],
      [13.97463, 40.69827],
      [13.86784, 40.6822],
      [13.8335, 40.72306]
    ]
  end

  group :mailer do
    set :from, 'kumo@lincoln.ac.uk'
    set :host, 'lincoln.ac.uk'

    group :smtp_settings do
      set :address, 'mailslot.lincoln.ac.uk'
      set :port, 25
      #set :authentication, :plain
      set :domain, 'lincoln.ac.uk'

      set :user_name, 'mhanheide'
      set :password, 'test'
    end
  end

  group :redis do
    set :url, 'redis://127.0.0.1:6379'
  end
end
