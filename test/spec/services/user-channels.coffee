'use strict'

describe 'Service: UserChannels', () ->

  # load the service's module
  beforeEach module 'remotelyAngularApp'

  # instantiate service
  UserChannels = {}
  beforeEach inject (_UserChannels_) ->
    UserChannels = _UserChannels_

  it 'should do something', () ->
    expect(!!UserChannels).toBe true;
