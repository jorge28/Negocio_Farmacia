var list = null;

$(document).ready(readyFn);

function Llenacbo()
{
        $.ajax({
            type: "POST",
            url: "Control_Gasto.aspx/LlenaCbosRegionEdoMpio",
            data: '',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                list = $.parseJSON(response.d);
                LlenarRegion();
            },
            error: errores
        });
   
    function errores(msg) {
        //msg.responseText tiene el mensaje de error enviado por el servidor
        alert('Error: ' + msg.responseText);
    }
}

function LlenarRegion() {
    var Regiones = _.chain(list).map(function (list) { return list.Region }).uniq().value();
    var combo = $("#ctl00_body_ddlRegionalBusqueda");
    $.each(Regiones, function () {
        combo.append(new Option(this, this));
    });

    //combo.val(null);
    //$("#Estado").val(null);-
    //$("#Ciudad").val(null);
}

//function ChangeCountry(s) {
//    var states = _.where(data, { country: $(s).val() })
//    var uniqueStates = _.chain(states).map(function (states) { return states.state }).uniq().value();
//    var combo = $("#Estado");
//    combo.empty();
//    $.each(uniqueStates, function () {
//        combo.append(new Option(this, this));
//    });
//    combo.val(null);
//    $("#Ciudad").val(null);
//}
//function ChangeState(s) {
//    var cities = _.where(data, { country: $("#Pais").val(), state: $(s).val() })
//    var uniqueCities = _.chain(cities).map(function (cities) { return cities.city }).uniq().value();
//    var combo = $("#Ciudad");
//    combo.empty();
//    $.each(uniqueCities, function () {
//        combo.append(new Option(this, this));
//    });
//    combo.val(null);
//}