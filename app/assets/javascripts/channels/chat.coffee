App.chat = App.cable.subscriptions.create { channel: "ChatChannel", room_id: '1' },
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    $('#messages').append "<p>" + data['message'] + "</p>"

  send_message: (message) ->
  	@perform 'send_message', message: message, roomID: roomId

$(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
  if event.keyCode is 13 #return
    App.chat.send_message event.target.value
    event.target.value = ''
    event.preventDefault()