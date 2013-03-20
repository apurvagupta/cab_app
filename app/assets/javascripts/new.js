
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

    if ($('#source').val() == 'other')
    {
        $('#other_source').attr('type',"text");
       $('#other_source').attr('disabled',false);
    }
    if ($('#destination').val() == 'other')
    {
        $('#other_destination').attr('type',"text");
        $('#other_destination').attr('disabled',false);
    }

    $('#pick_up_time').timepicker({
        controlType: 'select',
        timeFormat: 'hh:mm tt',
        stepMinute: 30
    });

    $('#pick_up_date').datepicker({dateFormat: "dd/mm/yy" , minDate: 0});

    $('.date_picker').datepicker({dateFormat: "dd/mm/yy"});
    $('#dropdown').click(function(){
        $("#dropdown").backgroundColor='orangered';
    });
    $('#logout').hover(function(){
        $("#logout").backgroundColor='none';
    });



});



