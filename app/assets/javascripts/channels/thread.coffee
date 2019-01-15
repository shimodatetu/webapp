App.thread = App.cable.subscriptions.create "ThreadChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    local = '/thread/index/'+data['id']
    $('#groups').append data['message']
    location.href=local
    # Called when there's incoming data on the websocket for this channel
  make: (title, message) ->
    alert "ok"
    @perform 'make',title: title, message: message

$(document).on 'submit', '[class~=make_thread]', (event) ->
    App.thread.make $('#title').val(), $('#message').val()
    event.preventDefault()
