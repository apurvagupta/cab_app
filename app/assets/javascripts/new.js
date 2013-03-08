
function onSelectedValueChange(ddl_id,txt_id)
{
    var ddl_list = document.getElementById(ddl_id);
    if  (ddl_list.value=="other")
    {
        document.getElementById(txt_id).type = "text";
        document.getElementById(txt_id).disabled=false;
        document.getElementById(txt_id).focus()
    }
    else
    {
        document.getElementById(txt_id).type = "hidden";
        document.getElementById(txt_id).disabled=true;
    }

}

$(document).ready(function() {

    if ($('#ddl_source').val() == 'other')
    {
        $('#txt_source').attr('type',"text");
       $('#txt_source').attr('disabled',false);
    }
    if ($('#ddl_destination').val() == 'other')
    {
        $('#txt_destination').attr('type',"text");
        $('#txt_destination').attr('disabled',false);
    }

    $('#pick_up_time').timepicker({ 'scrollDefaultNow': true });

    $('#pick_up_date').datepicker({dateFormat: "dd/mm/yy" , minDate: 0});
    $('.date_picker').datepicker({dateFormat: "dd/mm/yy"});

});



