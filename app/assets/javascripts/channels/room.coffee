App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server
  received: (data) ->
    # alert data['message']
    $('#posts').append data['message']


  speak: (message, group)->
    alert group
    @perform 'speak',message: message, group_id: group


$(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
  if event.keyCode is 13 # return = send
    App.room.speak event.target.value, $('#group').val()
    event.target.value = ''
    event.preventDefault()
