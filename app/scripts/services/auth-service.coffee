app.service "authService", authService = ($resource, $q, settings) ->
    resource = $resource(settings.apiHost + "/sessions", {},
      register:
        method: "POST"
        params: {}
        url: settings.apiHost + "/registration"
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
