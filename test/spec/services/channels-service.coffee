'use strict'

describe 'Service: channelsService', () ->

  # load the service's module
  beforeEach module 'remotelyApp'

  # instantiate service
  channelsService = {}
  beforeEach inject (_channelsService_) ->
    channelsService = _channelsService_

  it 'should do something', () ->
    expect(!!channelsService).toBe true
