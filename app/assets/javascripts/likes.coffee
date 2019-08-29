# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("div.like_btn").click ->
    if $(this).hasClass('already')
      # いいねの取り消し
      delete_url = '/likes/'+$('#current_team_id').val()
      $.ajax
        url: delete_url
        type: 'delete'
    else
      # いいね追加
      $.ajax
        url: '/likes'
        type: 'post'
        data: { id : $('#current_team_id').val() }
