App.profile = App.cable.subscriptions.create "ProfileChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    location.reload();

  change: (username,gender,year,month,date,country,profile_en,profile_jp) ->
    @perform 'change',username:username,gender:gender,year:year,month:month,date:date,
    country:country,profile_en:profile_en,profile_jp:profile_jp


$(document).on 'click', '.save_button', (event) ->
  username = $(".profile_page #username").val();
  gender = $(".profile_page #gender").val();
  year = $(".profile_page #year").val();
  month = $(".profile_page #month").val();
  date = $(".profile_page #date").val();
  country = $(".profile_page #country").val();
  profile_en = $(".profile_page #profile_en").val();
  profile_jp = $(".profile_page #profile_jp").val();

  if profile_en != "" && profile_jp != ""
    $("#enjp_change").dialog
      modal: true
      title: 'Confirmation / 確認画面'
      buttons:
        'to English / 英語に翻訳': ->
          $(this).dialog 'close'
          translate(username,gender,year,month,date,country,profile_en,profile_jp,"en")
          return
        'to Japanese / 日本語に翻訳': ->
          $(this).dialog 'close'
          translate(username,gender,year,month,date,country,profile_en,profile_jp,"ja")
          return
        'No Translation / 翻訳しない': ->
          $(this).dialog 'close'
          App.profile.change(username,gender,year,month,date,country,profile_en,profile_jp)
          return
        'Cancel / キャンセル': ->
          $(this).dialog 'close'
          return
  else if profile_en == "" && profile_jp != ""
    $("#toen_change").dialog
      modal: true
      title: 'Confirmation / 確認画面'
      buttons:
        'to English / 英語に翻訳': ->
          $(this).dialog 'close'
          translate(username,gender,year,month,date,country,profile_en,profile_jp,"en")
          return
        'No Translation / 翻訳しない': ->
          $(this).dialog 'close'
          App.profile.change(username,gender,year,month,date,country,profile_en,profile_jp)
          return
        'Cancel / キャンセル': ->
          $(this).dialog 'close'
          return
  else if profile_en != "" && profile_jp == ""
    $("#tojp_change").dialog
      modal: true
      title: 'Confirmation / 確認画面'
      buttons:
        'to Japanese / 日本語に翻訳': ->
          $(this).dialog 'close'
          translate(username,gender,year,month,date,country,profile_en,profile_jp,"ja")
          return
        'No Translation / 翻訳しない': ->
          $(this).dialog 'close'
          App.profile.change(username,gender,year,month,date,country,profile_en,profile_jp)
          return
        'Cancel / キャンセル': ->
          $(this).dialog 'close'
          return
  else
    App.profile.change(username,gender,year,month,date,country,profile_en,profile_jp)

translate=(username,gender,year,month,date,country,profile_en,profile_jp,lang) ->
  words = profile_jp
  if lang == "ja"
    words = profile_en
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
    if lang == "ja"
      App.profile.change(username,gender,year,month,date,country,profile_en,translation)
    else
      App.profile.change(username,gender,year,month,date,country,translation,profile_jp)
    return defer.promise()
