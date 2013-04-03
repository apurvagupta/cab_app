
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
globalVar = "this a global variable";
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
    if(($('#destination').val() == $('#source').val()) && ($('#destination').val() != 'other'))
    {
       this.setCustomValidity("destination cant be same as source");

        console.log("d if");
    }
    else
    {  console.log("d else");
       this.setCustomValidity("");
        $('.source input-block-level').setCustomValidity("");
    }

   });



    $('#source').change(function(){
        if($('#source').val() == $('#destination').val() && ($('#source').val() != 'other'))
        {    console.log("s if");
            this.setCustomValidity("source cant be same as destination");
        }
        else
        {    console.log("s else");
            this.setCustomValidity("");
            console.log(this);
            console.log($('#source'));
            this.setCustomValidity("");
        }

    });


    $('#other_destination').blur(function(){
        if($('#other_destination').val() == $('#other_source').val() )
        {
            this.setCustomValidity("destination cant be same as source");
        }
        else
        {
            this.setCustomValidity("");
        }
    });

    $('#other_source').blur(function(){
        if($('#other_source').val() == $('#other_destination').val() )
        {
            this.setCustomValidity("source cant be same as destination");
        }
        else
        {
            this.setCustomValidity("");
        }
    });

    $('#to_date').blur(function(){
        if($('#to_date').val() < $('#from_date').val())
        {
            this.setCustomValidity("should be more than from_date");
        }


    });
//    $('#Create_cab_request').click(function(){
//
//        console.log(Date());
//        if($('pick_up_date').val() == Date.today())
//        {
//            alert("yes");
//        }
//
//
//    });


      $('#Create cab_request').click(function(){

//
//          if($('#destination').val() == $('#source').val())
//          {
//              alert('if');
//              $('#destination').setCustomValidity("destination cant be same as source");
//          }
//          else
//          {
//              $('#destination').setCustomValidity("");
//          }
            alert(globalVar);
      });


//      $('#new_cab_request').validate();
//      $('#new_admin').validate();

});

