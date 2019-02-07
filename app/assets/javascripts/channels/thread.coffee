App.thread = App.cable.subscriptions.create "ThreadChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    alert("ok");
    local = '/thread/show/'+data['id']
    $('#groups').append data['message']
    if data['user_id'] == gon.current_user.id
      location.href=local
    # Called when there's incoming data on the websocket for this channel
  make: (lang, title_jp,mes_jp,title_en,mes_en,category) ->
    category = Number(category)
    @perform 'make',lang:lang,title_jp:title_jp,message_jp:mes_jp,title_en:title_en,message_en:mes_en,category:category

$(document).on 'click', '[class~=submit_button]', (event) ->
  words_check($('#title').val(), $('#content').val(),$('.small_select').val())
  #alert($('.small_select').val());
  event.preventDefault()

words_check=(title,coment,category)->
  lang = ""
  if isHalf(title) == true && isHalf(coment) == true
    lang = "ja"
  else
    lang = "en"
  #alert lang
  translate(title,coment,lang,category)

translate=(title,coment,lang,category) ->

  words = title+" </|/> "+coment
  defer = $.Deferred()
  $.ajax
    url: 'https://api.cognitive.microsoft.com/sts/v1.0/issueToken'
    type: 'POST'
    headers:{
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
    get_text = translation.split('&lt;/|/&gt;')
    if lang == "ja"
      App.thread.make(lang,get_text[0],get_text[1],title,coment,category)
    else
      App.thread.make(lang,title,coment,get_text[0],get_text[1],category)
    return defer.promise()

bytes=(str) ->
  return(encodeURIComponent(str).replace(/%../g,"x").length);
isHalf=(str)->
  str_length = str.length
  str_byte = bytes(str)
  return str_length == str_byte
