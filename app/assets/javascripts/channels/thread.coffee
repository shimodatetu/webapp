App.thread = App.cable.subscriptions.create "ThreadChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server
  received: (data) ->
    local = '/thread/show/'+data['id']
    $('#groups').append data['message']
    if data['user_id'] == gon.current_user.id
      location.href=local
    # Called when there's incoming data on the websocket for this channel
  make: (lang, title_jp,mes_jp,title_en,mes_en,category) ->
    category = Number(category)
    @perform 'make',lang:lang,title_jp:title_jp,message_jp:mes_jp,title_en:title_en,message_en:mes_en,category:category

$(document).on 'click', '.submit_button_cover .post_button', (event) ->
  type_check($(@).attr("id"),$('#title').val(), $('#content').val(),$('.small_select').val())
  event.preventDefault()

type_check=(id,title,coment,category)->
  if category == "" || category == undefined
    alert("カテゴリーが選択されていません\nCategory is not selected.");
  else if id == "enjp"
    title_en = $(".en_data_title").val();
    title_jp = $(".jp_data_title").val();
    content_en = $(".en_data_content").val();
    content_jp = $(".jp_data_content").val();
    if title_en == ""
      alert("Title in English is empty.\n英語のタイトルの欄に何も書かれていません");
    else if title_jp == ""
      alert("Tille in Japanese is empty.\n日本語のタイトルの欄に何も書かれていません");
    else if content_en == ""
      alert("Title in English is empty.\n英語のタイトルの欄に何も書かれていません");
    else if content_jp == ""
      alert("Content in Japanese is empty.\n日本語入力欄に何も書かれていません");
    else
      App.thread.make("enjp",title_jp,content_jp,title_en,content_en,category);
  else if id == "en"
    title_en = $(".en_data_title").val();
    content_en = $(".en_data_content").val();
    if title_en == ""
      alert("Title in English is empty.\n英語のタイトルの欄に何も書かれていません");
    else if content_en == ""
      alert("Content in Japanese is empty.\n日本語入力欄に何も書かれていません");
    else
      translate_google(title_en,content_en,"ja",category)
  else if id == "jp"
    title_jp = $(".jp_data_title").val();
    content_jp = $(".jp_data_content").val();
    if title_jp == ""
      alert("Title in Japanese is empty.\n日本語のタイトルの欄に何も書かれていません");
    else if content_jp == ""
      alert("日本語入力欄に何も書かれていません");
    else
      translate_google(title_jp,content_jp,"en",category)

translate_google=(title,coment,lang,category) ->
  key = 'AIzaSyC0LbKvoTxUt-7Cwu0P2kjsmOqlnLADZG4'
  url = 'https://translation.googleapis.com/language/translate/v2?key=' + key
  data = new FormData
  data.append 'q', title
  data.append 'q', coment
  data.append 'target', lang
  settings =
    method: 'POST'
    body: data
  fetch(url, settings).then((res) ->
    res.text()
  ).then (text) ->
    ary = text.split('"');
    trans_title = ary[7]#7番はテキスト
    trans_content = ary[15]
    if lang == "ja"
      App.thread.make(lang,ary[7],ary[15],title,coment,category)
    else
      App.thread.make(lang,title,coment,ary[7],ary[15],category)

translate_microsoft=(title,coment,lang,group_id) ->
  words = title+" </> "+coment
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
    get_text = translation.split('</>')
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
