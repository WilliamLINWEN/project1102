$(document).on 'turbolinks:load', (event) ->
  if $('#chat-show').length > 0
    moveToBottom = (el, event, handler) ->
      $('.msg_history').animate scrollTop: $('.msg_history')[0].scrollHeight
      return

    moveToBottom()

    App.chat = App.cable.subscriptions.create { channel: "ChatChannel", room_id: roomID },
      connected: ->
        # Called when the subscription is ready for use on the server

      disconnected: ->
        # Called when the subscription has been terminated by the server

      received: (data) ->
        # Called when there's incoming data on the websocket for this channel
        if data['userID'] == userID
        	$('.msg_history').append("<div class='outgoing_msg'><div class='sent_msg'><p>" + data['message'] + "</p><span class='time_date'>" + data['message_created_at'] + "</span></div></div>")
        else
        	$('.msg_history').append("<div class='incoming_msg'><div class='incoming_msg_img'> <img src=" + data['avatar'] + "> </div><div class='received_msg'><div class='received_withd_msg'><p>" + data['message'] + "</p><span class='time_date'> " + data['message_created_at'] + "</span></div></div></div>")

        moveToBottom()

      send_message: (message) ->
      	@perform 'send_message', message: message, roomID: roomID

$(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
  if event.keyCode is 13 #return
    App.chat.send_message event.target.value
    event.target.value = ''
    event.preventDefault()

$(document).on 'click', '#send_btn', (event) ->
  input_field = $('input')[0]
  App.chat.send_message input_field.value
  input_field.value = ''
  event.preventDefault()
