$('.document').ready(function () {
        $("#trash").attr("disabled", true);
        $("#ban").attr("disabled", true);
        $("#default_users").attr("disabled", true);
        $("#admin").attr("disabled", true);
        $(".checkbox").prop("unchecked", false);
        ["#trash","#ban","#default_users","#admin"].forEach((value) => {
            let button_id = $(value); 
            let href = button_id.attr('href'); 
            button_id.on('click', (event) => { 
                let newHref = href + '?' 
                $('.checkbox_user').each(function () { 
                    if ($(this).prop('checked') == true) { 
                        newHref += 'user_check%5B%5D=' + $(this).val() + '&' 
                    } 
                }); 
            button_id.attr('href', newHref) 
            }); 
        })
        $('#checkBoxAll').click(function () {
            if ($(this).is(":checked"))
                $('input[name="user_check"]').prop('checked', true);
            else
                $('input[name="user_check"]').prop('checked', false);
        });
        $('.checkbox').on('click', function () {
            var count = $('.checkbox_user:checked').length;


            $("#users_choise").text(count);
            if (count == 0) {
                $("#trash").attr("disabled", true);
                $("#ban").attr("disabled", true);
                $("#default_users").attr("disabled", true);
                $("#admin").attr("disabled", true);
            }
            else {
                $("#trash").attr("disabled", false);
                $("#ban").attr("disabled", false);
                $("#default_users").attr("disabled", false);
                $("#admin").attr("disabled", false);
            }
        });
});