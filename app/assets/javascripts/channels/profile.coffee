App.profile = App.cable.subscriptions.create "ProfileChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    for key,val of data['message']
      if $("#data_"+key).length
        $("#data_"+key).html(val)


  change: (type,text) ->
    @perform 'change',type:type,text:text

  image_change: (asd) ->
    @perfotm 'image_change',file:"asd"

$(document).on 'click', '.profile .content .edit .edit_text', (event) ->
  id = event.target.parentNode.id
  parent = event.target.parentNode
  parent.innerHTML = "<input id='"+id+"'type='text'class='edit_input'>"+
                    "<div class='edit_change'>変更</div>"

$(document).on 'click', '.profile .content .edit .edit_change', (event) ->
  parent = event.target.parentNode
  id = parent.id
  text = parent.childNodes[0].value
  parent.innerHTML = '<div class="edit_text">編集</div>'
  App.profile.change id,text
  event.preventDefault()

$(document).on 'change', '#01', (event) ->
  parent = event.target.parentNode
  id = parent.id
  #App.profile.change id,file
  event.preventDefault()

alert(gon.a)
