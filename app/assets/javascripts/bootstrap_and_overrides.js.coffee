jQuery ->
  $("a[rel=popover]").popover()
  $(".tooltip").tooltip()
  $("a[rel=tooltip]").tooltip()
  
  $(".alert").fadeOut(5000)

  $("#myTab a").click (e) ->
  e.preventDefault()
  $(this).tab "show"
