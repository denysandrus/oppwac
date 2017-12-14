
$(document).on('click', '.verify', function (e) {
    e.preventDefault();
    var id = $(this).data('id');
    $.ajax({
        url: "/verify",
        type: 'POST',
        data: {id: id},
        success: function (response) {
            if (response.success) {
                location.reload();
            }
        }
    });
});