# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_pk2_session',
  :secret      => '91795420f7038e0ac319c8df9616946cad652a16f63555399ae1cec1e6fab29ca5a574ffa9b5adfd03280b1dcdfb3caecd7224a2f151bd1385dc2a590ef65692'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
