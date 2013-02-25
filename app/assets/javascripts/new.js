
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