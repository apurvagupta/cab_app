
var time,destination,other_destination;
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

    $('#pick_up_time').focus(function(){
        time = this;
        if($('#pick_up_time').val() != "")
        {
            $('#pick_up_time').timepicker({
                minuteStep: 30,
                defaultTime: $('#pick_up_time').val(),
                showInputs: false,
                disableFocus: true
            });
        }
        else if($('#pick_up_time').val() == "")
        {
            $('#pick_up_time').val("");
            $('#pick_up_time').timepicker({
                minuteStep: 30,
                defaultTime: 'current',
                showInputs: false,
                disableFocus: true
            });
        }
    });

    $('#pick_up_date').datepicker({dateFormat: "dd/mm/yy",minDate: 0});
    $('.date_picker').datepicker({dateFormat: "dd/mm/yy"});
    $("#pick_up_date").keypress(function(event) {event.preventDefault();});
    $('#dropdown').click(function(){
        $("#dropdown").backgroundColor='orangered';
    });
    $('#logout').hover(function(){
        $("#logout").backgroundColor='none';
    });
    $('.content-main').css('min-height', $(document).height()-220)
    $(document).on('resize',function(){
        $('.content-main').css('min-height', $(document).height()-120)
    })

    $('#destination').change(function(){
        destination = this;
    });

    $('#other_destination').blur(function(){
        other_destination = this;
    });

    $('#to_date').blur(function(){
        to_date = this;
    });


    $('#Create_cab_request').click(function(){
        current_dateTime = new Date();
        var dateTimeString = $('#pick_up_date').val()+" "+$('#pick_up_time').val();
        var split_array = dateTimeString.split("/");
        var formattedDateTime = new Date(split_array[1] + "/" + split_array[0] + "/" + split_array[2]);
        if (current_dateTime > formattedDateTime)
        {
           time.setCustomValidity("Time cannot be less than current time");
        }
        else
        {
           time.setCustomValidity("");
        }
        if(($('#source').val() == $('#destination').val()) && ($('#destination').val() != 'other'))
        {
           destination.setCustomValidity("destination cant be same as source");
        }
        else if(($('#source').val() == 'other') && ($('#other_source').val() == ($('#other_destination').val())))
        {
           destination.setCustomValidity("");
           other_destination.setCustomValidity("destination cant be same as source");
        }
        else
        {
           destination.setCustomValidity("");
           other_destination.setCustomValidity("");
        }
    });


    $('#display_reports').click(function(){
      if (new Date($('#to_date').val()) < new Date ($('#from_date').val()))
      {
          to_date.setCustomValidity("should be more than from date");
      }
      else
      {
         to_date.setCustomValidity("");
      }
    });


});


