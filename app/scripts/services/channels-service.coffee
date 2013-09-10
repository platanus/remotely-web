'use strict';

app.service 'ChannelsService', (settings, $resource) ->
  resource = $resource( settings.apiPrefix + '/users/1/channels' )

  # Send a message to the active channel
  sendMessageToActive = (message) ->
    console.log "Sending message: #{message}"
    return

  executeCommand = (commandString) ->
    console.log "Executing command: #{commandString}"

  # This resource is used to make api calls
  resource: resource

  # This is the currently active channel
  active: null

  # All the suscribed channels
  channels: []

  # Join the channel and set it as active
  join: (name) ->
    console.log "I will join to the ##{name} channel"
    this.setActive "theNewChannelId"
    return

  # Set a channel as the currently active one
  setActive: (channelId) ->
    console.log "The new active channel is ##{channelId}"

  # Determine whether the input value is a message or a command
  processInput: (value) ->
    if (value.indexOf "/", 0) == 0
      executeCommand value
    else
      sendMessageToActive value

  # Get all the channels
  resolve: () ->
    this.channels = resource.query()
    return


