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
  #year = $(".profile_page #year").val();
  #month = $(".profile_page #month").val();
  #date = $(".profile_page #date").val();
  year = 1;
  month = 1;
  date = 1;
  username = $(".profile_page #username").val();
  gender = $(".profile_page #gender").val();
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
          translate_google(username,gender,year,month,date,country,profile_en,profile_jp,"en")
          return
        'to Japanese / 日本語に翻訳': ->
          $(this).dialog 'close'
          translate_google(username,gender,year,month,date,country,profile_en,profile_jp,"ja")
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
          translate_google(username,gender,year,month,date,country,profile_en,profile_jp,"en")
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
          translate_google(username,gender,year,month,date,country,profile_en,profile_jp,"ja")
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

translate_google=(username,gender,year,month,date,country,profile_en,profile_jp,lang) ->
  words = profile_jp
  if lang == "ja"
    words = profile_en
  key = gon.google_key
  url = 'https://translation.googleapis.com/language/translate/v2?key=' + key
  data = new FormData
  data.append 'q', words
  data.append 'target', lang
  settings =
    method: 'POST'
    body: data
  fetch(url, settings).then((res) ->
    res.text()
  ).then (text) ->
    console.log(text)
    ary = text.split('"');
    trans_text = ary[7]#7番はテキスト
    if lang == "ja"
      App.profile.change(username,gender,year,month,date,country,profile_en,trans_text)
    else
      App.profile.change(username,gender,year,month,date,country,trans_text,profile_jp)
