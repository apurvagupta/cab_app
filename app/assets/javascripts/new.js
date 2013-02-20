

function onSelectedValueChange(ddl_id,txt_id)
{
    var ddl_list = document.getElementById(ddl_id);
    if  (ddl_list.value=="other")
    {
        document.getElementById(txt_id).hidden = false;
        document.getElementById(txt_id).disabled=false;
    }
    else
    {
        document.getElementById(txt_id).hidden = true;
        document.getElementById(txt_id).disabled=true;
    }
}

function my_func(puf,l)
{
      var x=document.getElementById(puf).value;
        if (x==null || x=="")
        {
            document.getElementById(l).hidden = false;
            window.setTimeout(function(){document.getElementById(puf).focus();},10)
        }
        else
        {
            document.getElementById(l).hidden = true;

        }

}

function func(element,contact_numbers,input_id)
{
   document.getElementById(input_id).value = contact[element.selectedIndex]
}