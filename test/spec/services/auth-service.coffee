'use strict'

describe 'Service: authService', () ->

  # load the service's module
  beforeEach module 'remotelyAngularApp'

  # instantiate service
  authService = {}
  beforeEach inject (_authService_) ->
    authService = _authService_

  it 'should do something', () ->
    expect(!!authService).toBe true;
