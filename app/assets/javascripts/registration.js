$(document).on('ready', function () {

    prev_role = 'individual';
    $(document).on('click', '#role-slider span', function () {
        role = $(this).data('for');
        if (prev_role != role) {
            if (role == 'individual') {
                $('.chosen-role').css({'left': '3px', 'top': '3px'});
                $('.chosen-role').html('Individual');
            } else {
                $('.chosen-role').css({'top': '3px', 'left': 'calc(50% - 3px)'});
                $('.chosen-role').html('Organization');
            }
            $('.active-role').removeClass('active-role');
            $(this).addClass('active-role');
            $('.active-form-container').hide();
            $('.active-form-container').removeClass('active-form-container');
            $("#" + role + "-form-container").fadeIn('650');
            $("#" + role + "-form-container").addClass('active-form-container');
            prev_role = role;
        }
    });
});