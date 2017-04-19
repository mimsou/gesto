
$(document).ready(function() {

    $("#filtre_crud").validate({
        rules: {
            BASE: {
                required: true
            }, TABLE: {
                required: true
            }, con: {
                required: true
            }
        }
    })

    $("#btn_compiler").click(function() {
        $("<div></div>").dialog({
            resizable: false,
            height: 170,
            width: 375,
            buttons: {
                "Ok": function() {
                    var name = $("#module").livequery(function() {
                    }).val()
                    if (name.length > 0) {
                        compiler(name);
                        $(this).dialog("close");
                    }
                }
            },
            close: function(event, ui) {
                $(this).remove();
            },
            resizable: false,
                    title: "création du composant",
            modal: true
        }).html('<div class="col-lg-9 col-lg-offset-2"><div class="input-group input-group-sm top1"><span class="input-group-addon">Nom du composant :</span> <input type="text" class="form-control" name="module" id="module" /></div></div>');

    })

})

function get_shema() {

    var param = {}
    param.base = $("#BASE").val();
    param.table = $("#TABLE").val();
    param.sgbd = $("#sgbd").val();
    param.con = $("#con").val();

    if ($("#sgbd").val() == "mysql") {
        get_ajax_data("/crudmaker/asyn_get_shema_mysql", param, "get_shema_pupulate");
    } else if ($("#sgbd").val() == "db2") {
        get_ajax_data("/crudmaker/asyn_get_shema_db2", param, "get_shema_pupulate");
    }

}

function get_shema_pupulate(data) {

    if (data["etat"] == "0") {

        var datas = data["data"];
        var html = ' <div class="col-md-12" id="globcontain">'
        html += '<div class="panel panel-default">'
        html += '<div class="panel-heading"><div class="col-md-1">' + data["table"] + ' : </div>  <div class="col-md-4"><div class="input-group-sm"><input class="form-control input-sm" id="intername"></div></div><button onClick="javascript:$(this).parents(' + "'" + "#globcontain" + "'" + ').remove();" class="btn btn-danger btn-xs pull-right">Fermer</button><div class="clearfix"></div></div>'
        html += '<div class="panel-body tb"  >'
        html += '<input type="hidden" value="' + data["base"] + '" id="basename">'
        html += '<input type="hidden" value="' + data["table"] + '" id="tablename">'

        $.each(datas, function(index, elm) {

            html += '<div class="input-group input-group-sm">'
            html += '<span style="background-color: #fff" class="input-group-addon"><div style="width: 200px;text-align: left;"><strong>' + elm.NAME + '</strong> : ' + elm.DESCRIPTION + ' </div></span>'

            html += '<span class="input-group-addon tbitem">'
            html += '<input type="hidden" value="' + elm.NAME + '" id="itemname" >'
            html += '<input type="hidden" value="' + elm.TYPE + '" id="itemnat" >'
            html += '<input type="hidden" value="' + elm.DESCRIPTION + '" id="description" >'
            if (elm.INDEX == 1) {
                html += '<span style="color:red">Index&nbsp;&nbsp;</span><input type="hidden" value="true" id="index" name="index" />';
            } else {
                html += '<input type="hidden" value="false" id="index" name="index" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
            }
            html += '<div class="col-md-3">Nom de champ :  <input class="form-control" name="desc" id="desc" ></div>'
            html += 'Ai<input type="checkbox" id="ai" name="ai" />&nbsp;&nbsp;'
            html += 'Search<input type="checkbox" id="search" name="search" />&nbsp;&nbsp;'
            html += 'Date<input type="checkbox" id="date" name="date" />&nbsp;&nbsp;'
            html += 'Require<input type="checkbox" id="require" name="require" />&nbsp;&nbsp;'
            html += 'Afficher<input type="checkbox" checked="" id="afficher" name="afficher" />&nbsp;&nbsp;'
            html += 'Modifier<input type="checkbox" checked="" id="modifier" name="modifier" /> '
            html += '</span>'
            html += '</div>'
        })

        html += '</div>'
        html += '</div>'
        html += '</div>'

        $("#shemaarea").append(html);


        $("#sgbd").attr("disabled", "disabled");
        $("#con").attr("disabled", "disabled");

    }

}

function compiler(name) {
    var param = {};
    param.modname = name;
    param.con = $("#con").val();
    param.sgbd = $("#sgbd").val();
    param.data = [];
    $(".tb").each(function() {
        var item = {};
        item.base = $(this).find("#basename").val();
        item.table = $(this).find("#tablename").val();
        item.intername = $(this).parent().find("#intername").val();
        item.champs = [];
        $(this).find(".tbitem").each(function() {
            var itemtab = {};
            itemtab.name = $(this).find("#itemname").val();
            itemtab.type = $(this).find("#itemnat").val();
            itemtab.discription = $(this).find("#description").val();
            itemtab.desc = $(this).find("#desc").val();
            itemtab.index = $(this).find("#index").val();
            itemtab.search = $(this).find("#search").is(":checked");
            itemtab.ai = $(this).find("#ai").is(":checked");
            itemtab.date = $(this).find("#date").is(":checked");
            itemtab.required = $(this).find("#require").is(":checked");
            itemtab.afficher = $(this).find("#afficher").is(":checked");
            itemtab.modifier = $(this).find("#modifier").is(":checked");
            item.champs.push(itemtab);
        })
        param.data.push(item);
    })

    get_ajax_data("/crudmaker/asyn_compile", param, false);

}




