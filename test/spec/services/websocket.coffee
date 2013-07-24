'use strict'

describe 'Service: websocket', () ->

  # load the service's module
  beforeEach module 'remotelyAngularApp'

  # instantiate service
  websocket = {}
  beforeEach inject (_websocket_) ->
    websocket = _websocket_

  it 'should do something', () ->
    expect(!!websocket).toBe true;
