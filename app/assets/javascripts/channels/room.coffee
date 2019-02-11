App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server
  received: (data) ->
    $(".group_"+data["group_id"]+' #posts').append data["message"]

  speak: (lang,mes_jp,mes_en, group)->
    @perform 'speak',lang: lang,content_jap: mes_jp,content_eng: mes_en, group_id: group


$(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
  if event.keyCode is 13 # return = send
    #App.room.speak event.target.value, $('#group').val()
    words_check event.target.value, $('#group').val()
    event.target.value = ''
    event.preventDefault()

words_check=(coment,group)->
  lang = ""
  if isHalf(coment) == true
    lang = "ja"
  else
    lang = "en"
  translate lang,coment,group

translate=(lang,words,group_id) ->
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
        'text': words
        'to': lang
      }
      async: false
    data = response.responseText
    translation = data.replace(/<("[^"]*"|'[^']*'|[^'">])*>/g, '')

    if lang == "ja"
      App.room.speak lang,translation,words,group_id
    else
      App.room.speak lang,words,translation,group_id
    return defer.promise()

bytes=(str) ->
  return(encodeURIComponent(str).replace(/%../g,"x").length);
isHalf=(str)->
  str_length = str.length
  str_byte = bytes(str)
  return str_length == str_byte
