$(document).ready(function() {
    $("#confirm_password").keyup(function() {
        var password = $("#password").val();
        var confirmPassword = $("#confirm_password").val();

        if (password !== confirmPassword) {
            $("#checkPassword").html("<em class='text-danger'>Passwords do not match</em>");
            return;
        } else {
            $("#checkPassword").html("<em class='text-success'>Passwords match</em>");
            $("#update").attr({ disabled: false });
            return;
        }
    });
});