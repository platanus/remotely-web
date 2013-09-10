'use strict'

app.controller 'SidebarCtrl', ($scope, ChannelsService) ->

  # Set joined channels in the scope to be able to show them
  $scope.channels = ChannelsService.channels

  # Create or join into a new channel
  $scope.joinChannel = (name) ->
    ChannelsService.join name
    return

  # Change the active channel
  $scope.setActiveChannel = (channel) ->
    ChannelsService.setActive channel.label
    return

  return
