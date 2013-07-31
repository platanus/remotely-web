app.service "authService", authService = ($resource, $q, settings) ->
    resource = $resource(settings.apiPrefix + "/sessions", {},
      register:
        method: "POST"
        params: {}
        url: settings.apiPrefix + "/registration"
        withCredentials: true

      login:
        method: "POST"
        params: {}
        withCredentials: true

      status:
        method: "GET"
        params: {}
        withCredentials: true

      logout:
        method: "DELETE"
        params: {}
        withCredentials: true
    )

    # Public API here
    resource: resource
    user: {}
