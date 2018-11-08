$(document).on 'turbolinks:load', ->
	if $('#chat-show').length > 0
	  App.user_appearance = App.cable.subscriptions.create { channel: "UserAppearanceChannel", room_number: roomNumber },
	  connected: ->
	    # Called when the subscription is ready for use on the server

	  disconnected: ->
	    # Called when the subscription has been terminated by the server

	  received: (data) ->
	  	if data['users']
	  		data['users'].forEach (element) ->
	  			if $("#" + element.number).length <= 0
	  				$('.inbox_chat').append "<div class='chat_list' id='" + element.number + "''><div class='chat_people'><div class='chat_img'><img src=" + element.avatar + "></div><div class='chat_ib'><h5>" + element.email + "<span class='chat_date'>" + data['current_time'] + "</span></h5><p></p></div></div></div>"

