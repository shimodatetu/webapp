App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server
  received: (data) ->
    alert("asd");
    console.log data
    $('#posts').append data['message']

  speak: (mes_base,mes_jp,mes_en, group)->
    alert mes_base+"/"+mes_jp+"/"+mes_en+"/"+group
    @perform 'speak',content_base: mes_base,content_jap: mes_jp,content_eng: mes_en, group_id: group


$(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
  if event.keyCode is 13 # return = send
    #App.room.speak event.target.value, $('#group').val()
    translate_jp event.target.value, $('#group').val()
    event.target.value = ''
    event.preventDefault()


translate_jp=(words,group_id) ->
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
    translate_en words,translation,group_id
    return defer.promise()

translate_en=(words,words_jp,group_id) ->

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
        'to': 'en'
      }
      async: false
    data = response.responseText
    translation = data.replace(/<("[^"]*"|'[^']*'|[^'">])*>/g, '')
    App.room.speak words,words_jp,translation, group_id
    return defer.promise()
