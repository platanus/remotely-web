idleTime = 0

timerIncrement = () ->
  idleTime = idleTime + 1
  window.location.reload() if idleTime > 3

$(document).ready ->
  idleInterval = setInterval(timerIncrement, 1000)
  $(this).mousemove (e) ->
    idleTime = 0

  $(this).keypress (e) ->
    idleTime = 0

