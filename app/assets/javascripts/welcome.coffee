# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $(document).on 'ajax:success', '#layout_form', (evt, data) ->
      $('#copy_button').html('<button class="btn btn-default clipboard-btn" ' +
        'title="Copy generated code to clipboard" data-clipboard-action="copy" ' +
        'data-clipboard-target="#show_result">' +
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
      editor.getSession().on 'change', saveToLocalStorage;
      editor.focus();

initialize = ->
  restoreFromLocalStorage();
  configureAce();

$(document).ready(initialize)

$ ->
  $('#layout_flags').on 'keyup', saveToLocalStorage;
  $("#layout_type_c").on 'change', saveToLocalStorage;
  $("#layout_type_cpp").on 'change', saveToLocalStorage;

$ ->
  $('#link_button').click ->
    type =$("#layout_form input[type='radio']:checked").val();
    encodedType = encodeURIComponent(type);
    args = $('#layout_flags').val();
    encodedArgs = encodeURIComponent(args);
    code = $('#layout_code').val();
    encodedCode = encodeURIComponent(code);
    base = 'https://structlayout.herokuapp.com/';
    $('#link').html('<div class="input-group">' +
        "<input type=\"text\" class=\"form-control\" id='permalink' " +
          "value=\"#{base}?code=#{encodedCode};args=#{encodedArgs};" +
          "type=#{encodedType}\">" +
          '<span class="input-group-btn">' +
          '<button type="button" class="btn btn-default clipboard-btn"' +
          ' title="Copy permalink to clipboard"' +
          ' data-clipboard-action="copy" data-clipboard-target="#permalink">' +
          '<i class=\"glyphicon glyphicon-copy\"></i></button>' +
        '</span>' +
      '</div>');

saveToLocalStorage = ->
  if (localStorage)
    type = $("#layout_form input[type='radio']:checked").val();
    args = $('#layout_flags').val();
    code = $('#layout_code').val();
    localStorage['type'] = type;
    localStorage['args'] = args;
    localStorage['code'] = code;

restoreFromLocalStorage = ->
  if (localStorage && !window.location.search)
    type = localStorage['type'];
    args = localStorage['args'];
    code = localStorage['code'];
    if type == 'c'
      $('#layout_type_c').prop('checked', true);
    else
      $('#layout_type_cpp').prop('checked', true);
    $('#layout_flags').val(args);
    $('#layout_code').val(code);
