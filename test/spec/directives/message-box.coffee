'use strict'

describe 'Directive: messageBox', () ->

  # load the directive's module
  beforeEach module 'remotelyApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<message-box></message-box>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the messageBox directive'
