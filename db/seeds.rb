# if there is no OAuth application created, create them
if Doorkeeper::Application.count.zero?
  Doorkeeper::Application.create(name: "Test client", redirect_uri: "urn:ietf:wg:oauth:2.0:oob", scopes: "")
  # Doorkeeper::Application.create(name: "iOS client", redirect_uri: "urn:ietf:wg:oauth:2.0:oob", scopes: "")
  # Doorkeeper::Application.create(name: "Android client", redirect_uri: "urn:ietf:wg:oauth:2.0:oob", scopes: "")
  # Doorkeeper::Application.create(name: "React", redirect_uri: "urn:ietf:wg:oauth:2.0:oob", scopes: "")
end
