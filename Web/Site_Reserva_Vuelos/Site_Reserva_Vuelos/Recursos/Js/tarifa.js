var Tarifa = {
    //events: {
    //    'change select#listaServicios': 'Contenedores_change',
    //    'click button#btn-buscarVeh': 'BuscarGarantia',
    //    'click button#btn-buscarFier': 'BuscarGarantia'
    //},
    init: function () {
        //self = this;
        //Object.keys(self.events).forEach(function (e) {
        //    $(e.split(' ')[1]).bind(e.split(' ')[0], self[self.events[e]]);
        //});
        //console.log('se ha cargado correctamente');
        Tarifa.ObtenerListatarifa();
    },

    //PETICIONES AJAX
    ObtenerListatarifa() {
        return JSON.parse($.ajax({
            type: "GET",
            url:'/Tarifas/ObtenerTarifas',
            data: '',
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            beforeSend: () => {
                console.log('en espera');
            },
            success: (d) => {
                console.log(d);
            },
            complete: () => {
                console.log('termina proceso');
            }
        }).responseText);
    }
    //ObtenerListaServicios: function (token) {
    //    return JSON.parse($.ajax({
    //        type: "POST",
    //        url: "../../Monox/Services/Tasacion.asmx/ObtenerServiciosGarantia",
    //        crossDomain: true,
    //        async: false,
    //        data: "{'Token':'" + token + "'}",
    //        dataType: "json",
    //        contentType: "application/json; charset=utf-8",
    //        beforeSend: function () {
    //            Consulta.MostrarLoader();
    //        },
    //        success: function (respuesta, indice) {
    //            return JSON.stringify(respuesta.d);
    //        },
    //        error: function (xhr) {
    //            console.error('Error de Ejecución: %O:', xhr);
    //        },
    //        complete: function () {
    //            Consulta.MostrarLoader();
    //        }
    //    }).responseText);
    //},
};

//se carga al iniciar la pagina
$(document).ready(function () {
    Tarifa.init();
});