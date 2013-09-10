'use strict';

app.directive('channelItem', () ->
    templateUrl: '/views/directives/channel-item.html'
    restrict: 'EA'
    scope:
      channel: '='
    link: (scope, element, attrs) ->
      # element.text 'this is the channelItem directive'
  )
