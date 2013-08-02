app.factory 'Message', ['$resource', 'settings', ($resource, settings) ->
  $resource( settings.apiPrefix + '/users/:user_id/channels/:channel_id/messages', user_id: '@user_id', channel_id: '@channel_id' )
]
