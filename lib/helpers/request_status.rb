def status_of request
  return "Accepted" if request.accepted
  return "Rejected" if request.rejected

  "Pending"
end
