# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $(document).on 'ajax:success', '#layout_form', (evt, data) ->
      $('#show_result').html(data)

$ ->
  $(document).on 'ajax:failure', '#layout_form', (evt, data) ->
      $('#show_result').html("Something is wrong. :( Please reload and try again!")

configureAce = ->
      $('.code').ace({ theme: 'textmate', lang: 'c_cpp' });
      editor = $('.code').data('ace').editor.ace;
      editor.setShowPrintMargin(false);
      editor.focus();

$(document).ready(configureAce)
