'use strict'

describe 'Directive: channelItem', () ->

  # load the directive's module
  beforeEach module 'remotelyApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<channel-item></channel-item>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the channelItem directive'
