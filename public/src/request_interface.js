function accept_request(id) {
  $(`#status${id}`).text("Accepted");
  $(`#accept${id}`).hide();
  $(`#reject${id}`).hide();
  $.post(`/requests/accept`, {'id': id});
}
function reject_request(id){
  $(`#status${id}`).text("Rejected");
  $(`#accept${id}`).hide();
  $(`#reject${id}`).hide();
  $.post(`/requests/reject`, {'id': id});
}