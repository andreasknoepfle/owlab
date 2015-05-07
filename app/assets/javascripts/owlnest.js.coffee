$ ->
  $('.owlnest_owldiff.ajax_pending').each ->
    parent_url = $(this).data("parent-url")
    child_url = $(this).data("child-url")
    file_index = $(this).data("file-index")
    element = $(this)
    params = { parent_url: parent_url, child_url: child_url, file_index: file_index }
    $.get "/owlnest/diff", params , ( data ) ->
      element.html( data )
