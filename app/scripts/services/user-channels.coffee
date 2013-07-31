app.factory 'UserChannels', ['$resource', 'settings', ($resource, settings) ->
  $resource( settings.apiPrefix + '/users/:user_id/channels', user_id: '@user_id' )
]
