//= require rails-ujs
//= require_tree .

$('#myModal').on('shown.bs.modal', function () {
  $('#myInput').trigger('focus')
})
