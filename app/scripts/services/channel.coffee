app.factory 'Channel', ($resource, settings) ->
  $resource( settings.apiPrefix + '/channels' )

