# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $(document).on 'ajax:success', '#layout_form', (evt, data) ->
      $('#copy_button').html('<button class="btn btn-default clipboard-btn" title="Copy generated code to clipboard" data-clipboard-action="copy" data-clipboard-target="#show_result">' +
        '<i class=\"glyphicon glyphicon-copy\"></i>' +
      '</button>');
      $('#show_result').html(data);

$ ->
  $(document).on 'ajax:failure', '#layout_form', (evt, data) ->
      $('#show_result').html("Something is wrong. :( Please reload and try again!")

configureAce = ->
      $('.code').ace({ theme: 'textmate', lang: 'c_cpp' });
      editor = $('.code').data('ace').editor.ace;
      editor.setShowPrintMargin(false);
      editor.focus();

$(document).ready(configureAce)

$ ->
  $('#link_button').click ->
    type =$("#layout_form input[type='radio']:checked").val();
    encodedType = encodeURIComponent(type);
    args = $('#layout_flags').val();
    encodedArgs = encodeURIComponent(args);
    code = $('#layout_code').val();
    encodedCode = encodeURIComponent(code);
    base = 'https://structlayout.herokuapp.com/';
    $('#link').html("<code>#{base}?code=#{encodedCode};args=#{encodedArgs};type=#{encodedType}</code>");
