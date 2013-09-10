'use strict';

app.directive('messageBox', (ChannelsService) ->
    templateUrl: '/views/directives/message-box.html'
    restrict: 'EA'
    scope:
      message: '@'
    link: (scope, element, attrs) ->

      # Send a message
      # this method will parse the message to identify if some commands are included
      scope.send = (event) ->

        # Send the message
        ChannelsService.processInput scope.message

        # Clear the messagebox input
        scope.message = ""
        return

      return

  )
