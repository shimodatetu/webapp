App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server
  received: (data) ->
    console.log(data["message"])
    $('#posts').append data['message']


  speak: (message, group)->
    @perform 'speak',message: message, group_id: group


$(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
  if event.keyCode is 13 # return = send
    #App.room.speak event.target.value, $('#group').val()
    translate event.target.value, $('#group').val()
    event.target.value = ''
    event.preventDefault()


translate=(words,group_id) ->
  # getToken= ->
  defer = $.Deferred()
  $.ajax
    url: 'https://api.cognitive.microsoft.com/sts/v1.0/issueToken'
    type: 'POST'
    headers: {
      'Content-Type': 'application/json'
      'Accept': 'application/jwt'
      'Ocp-Apim-Subscription-Key': 'd0d8d178e5f54dcaab373fe9896fdb3a'
    }
    async: false
  .done (data) ->
    # alert("doneまで実行")
    token = data
    defer.resolve(token)

    key = 'Bearer ' + token
    text = words
    response = $.ajax
      url: 'https://api.microsofttranslator.com/v2/http.svc/Translate'
      type: 'GET'
      data: {
        'appid': key
        'Accept': 'application/xml'
        'text': text
        'to': 'ja'
      }
      async: false



    data = response.responseText

    translation = data.replace(/<("[^"]*"|'[^']*'|[^'">])*>/g, '')
    App.room.speak translation, group_id


    return defer.promise()

  .fail (response) ->
    #処理が失敗した時の処理
    alert 'fail'



  # $.when(getToken).done(token) ->
  #   alert("asd");
  #
  #   key = 'Bearer ' + token;
  #   text = words
  #   response = $.ajax
  #     url: 'https://api.microsofttranslator.com/v2/http.svc/Translate'
  #     type: 'GET'
  #     data: {
  #       'appid': key
  #       'Accept': 'application/xml'
  #       'text': text
  #       'to': 'en'
  #     }
  #     async: false
  #
  #
  #
  #   data = response.responseText;
  #
  #   translation = data.replace(/<("[^"]*"|'[^']*'|[^'">])*>/g, '');
  #
  #   App.room.speak words, group_id
