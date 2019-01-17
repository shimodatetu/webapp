Dropzone.autoDiscover = false
console.log("testaaaa")
new Dropzone '#upload-dropzone',
  uploadMultiple: false
  paramName: 'post[image]'
  params:
    'post[group_id]': 3
  init: ->
    @on 'success', (image, json) ->
      # アップロード成功時の処理をここに実装します。
  dictDefaultMessage: '''
    <i class="fa fa-file-o fa-2x"></i><br>
    <br>
    ファイルをここにドロップするか<br>
    ここをクリックして下さい
  '''
