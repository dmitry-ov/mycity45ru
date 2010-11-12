# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_mycity45ru_session',
  :secret      => '7b17efcd5c989920879aa1a9957efe17097d6b52ba79c2c00adf734c0a0a20da85ca4ef0f594e8e773d61b8a129bd66920694b445c2420dc8f543f5f6d41257f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
