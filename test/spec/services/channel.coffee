'use strict'

describe 'Service: channel', () ->

  # load the service's module
  beforeEach module 'remotelyAngularApp'

  # instantiate service
  channel = {}
  beforeEach inject (_channel_) ->
    channel = _channel_

  it 'should do something', () ->
    expect(!!channel).toBe true;
