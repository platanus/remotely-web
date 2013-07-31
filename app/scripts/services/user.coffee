app.factory 'User', ($resource, settings) ->
  $resource( settings.apiPrefix + '/users' )
