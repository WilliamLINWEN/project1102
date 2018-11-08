$(document).on 'turbolinks:load', ->
  if $('#chat-show').length > 0
    App.user_appearance = App.cable.subscriptions.create({
      channel: 'UserAppearanceChannel'
      room_number: roomNumber
    },
      connected: ->
      disconnected: ->
      received: (data) ->
        console.log("appear is " + data['appear'])

        if data['users']
          if data['appear']
            data['users'].forEach((element) ->
              if $('#' + element.number).length <= 0
                $('.inbox_chat').append("<div class='chat_list' id='" + element.number + "'><div class='chat_people'><div class='chat_img'><img src='" + element.avatar + "'></div><div class='chat_ib'><h5>" + element.email + "<span class='chat_date'>'" + data['current_time'] + "</span></h5><p></p></div></div></div>")
            )
          else
            console.log(data['users'])
    )
  else
  	unless App.user_appearance is undefined
  		App.user_appearance.unsubscribe()
