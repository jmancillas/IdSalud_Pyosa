INMEDIKApp.controller('ConceptProductivityController', function ($scope, $compile, $sce, $http, DTOptionsBuilder, DTColumnBuilder) {
    var dt = this;
    dt.Ready = false;
    dt.LoadUrl = "";
    dt.PaymentUrl = "";
    dt.ConceptsUrl = "";
    dt.dtInstance = {};
    dt.concepts = [];
    dt.clinics = [];
    dt.errors = [];
    dt.Filters = {};
    dt.categories = [];
    dt.Filters.xray = true;
    dt.Filters.laboratory = true;

    dt.loadingSurgery = false;
    dt.loadingConsult = false;
    dt.loadingTest = false;
    dt.loadingPackage = false;
    dt.loadingPayment = false;
    dt.loadingProduct = false;
    dt.loadingService = false;

    var GetUrl = function () {
        return dt.LoadUrl;
    }

    var GetConceptsUrl = function () {
        return dt.ConceptsUrl;
    }

    var GetPaymentsUrl = function () {
        return dt.PaymentUrl;
    }

    dt.Ut_numberWithCommas = Ut_numberWithCommas;
    function currencyFormat(data, type, full, meta) {
        return dt.Ut_numberWithCommas(Math.round(data * 100) / 100);
    }
    dt.clearFilters = function () {
        dt.Filters = {};
        dt.Filters.xray = true;
        dt.Filters.laboratory = true;
        dt.ApplyFilters();
    }

    dt.InitTable = function (url, paymentURL) {
        dt.LoadUrl = url;
        dt.PaymentUrl = paymentURL;
        /*-------------------------------------------------------------TABLE PRODUCTS----------------------------------------------------*/
        dt.dtOptions = DTOptionsBuilder.newOptions()
            .withOption("ajax", {
                dataType: "json",
                type: "POST",
                url: GetUrl(),
                data: function (d) {
                    dt.loadingProduct = true;
                    d.filter = {
                        categoryName: 'Productos',
                        concept: dt.Filters.concept,
                        dateStart: dt.Filters.dateStart ? dt.Filters.dateStart.startOf('day').toDate().toISOString() : null,
                        dateEnd: dt.Filters.dateEnd ? dt.Filters.dateEnd.endOf('day').toDate().toISOString() : null,
                        clinics: dt.Filters.clinics
                    };
                }
            })
            .withDataProp("data")
            .withPaginationType('full_numbers')
            .withOption('serverSide', true)
            .withOption('responsive', true)
            .withOption('sDom', '<"top"l>rt<"bottom"ip><"clear">')
            .withOption('lengthMenu', [[50, 100, 200, -1], [50, 100, 200, "Todos"]])
            .withOption("iDisplayLength", -1)
            .withOption('footerCallback', function (row, data, start, end, display) {
                var api = this.api();

                api.columns('.sum').every(function () {
                    var sum = this
                        .data()
                        .reduce(function (a, b) {
                            var x = parseFloat(a) || 0;
                            var y = parseFloat(b) || 0;
                            return x + y;
                        }, 0);
                    //console.log(sum);
                    $(this.footer()).html(dt.Ut_numberWithCommas(Math.round(sum * 100) / 100));
                });
                dt.loadingProduct = false;
                $scope.$apply();
            })
            .withLanguage({
                "sEmptyTable": "No existen resultados",
                "sInfo": "Mostrando _START_ a _END_ de _TOTAL_ entradas",
                "sInfoEmpty": "Mostrando de 0 a 0 de 0 entradas",
                "sInfoFiltered": "(Filtrado de un todal de _MAX_ entradas)",
                "sInfoPostFix": "",
                "sInfoThousands": ",",
                "sLengthMenu": "Mostrando _MENU_ entradas",
                "sLoadingRecords": "Cargando...",
                "sProcessing": "Procesando...",
                "sSearch": "Buscar:",
                "sZeroRecords": "No se encontraron resultados",
                "oPaginate": {
                    "sFirst": "Primero",
                    "sLast": "Ultimo",
                    "sNext": "Siguiente",
                    "sPrevious": "Anterior"
                },
                "oAria": {
                    "sSortAscending": ": ascendiente",
                    "sSortDescending": ": descendiente"
                }
            });

        dt.dtColumns = [
                    DTColumnBuilder.newColumn("conceptName").withTitle("Concepto"),
                    DTColumnBuilder.newColumn("categoryName").withTitle("Categoría").notSortable(),
                    DTColumnBuilder.newColumn("quantity").withTitle("Cantidad"),
                    //DTColumnBuilder.newColumn("price").withTitle("Precio").renderWith(currencyFormat).withClass("sum"),
                    //DTColumnBuilder.newColumn("cost").withTitle("Costo").renderWith(currencyFormat).withClass("sum"),
                    //DTColumnBuilder.newColumn("profit").withTitle("Utilidad").renderWith(currencyFormat).withClass("sum")
        ];

        dt.InstanceCallback = function (instance) {
            // Setup - add a text input to each footer cell
            dt.dtInstance = instance;
        };

        /*-------------------------------------------------------------TABLE SERVICES----------------------------------------------------*/

        dt.dtOptionsServices = DTOptionsBuilder.newOptions()
            .withOption("ajax", {
                dataType: "json",
                type: "POST",
                url: GetUrl(),
                data: function (d) {
                    dt.loadingService = true;
                    d.filter = {
                        categoryName: 'Servicios',
                        concept: dt.Filters.concept,
                        dateStart: dt.Filters.dateStart ? dt.Filters.dateStart.toDate().toISOString() : null,
                        dateEnd: dt.Filters.dateEnd ? dt.Filters.dateEnd.toDate().toISOString() : null,
                        clinics: dt.Filters.clinics
                    };
                }
            })
            .withDataProp("data")
            .withPaginationType('full_numbers')
            .withOption('serverSide', true)
            .withOption('responsive', true)
            .withOption('sDom', '<"top"l>rt<"bottom"ip><"clear">')
            .withOption('lengthMenu', [[50, 100, 200, -1], [50, 100, 200, "Todos"]])
            .withOption("iDisplayLength", -1)
            .withOption('footerCallback', function (row, data, start, end, display) {
                var api = this.api();

                api.columns('.sum').every(function () {
                    var sum = this
                        .data()
                        .reduce(function (a, b) {
                            var x = parseFloat(a) || 0;
                            var y = parseFloat(b) || 0;
                            return x + y;
                        }, 0);
                    //console.log(sum);
                    $(this.footer()).html(dt.Ut_numberWithCommas(Math.round(sum * 100) / 100));
                });
                dt.loadingService = false;
                $scope.$apply();
            })
            .withLanguage({
                "sEmptyTable": "No existen resultados",
                "sInfo": "Mostrando _START_ a _END_ de _TOTAL_ entradas",
                "sInfoEmpty": "Mostrando de 0 a 0 de 0 entradas",
                "sInfoFiltered": "(Filtrado de un todal de _MAX_ entradas)",
                "sInfoPostFix": "",
                "sInfoThousands": ",",
                "sLengthMenu": "Mostrando _MENU_ entradas",
                "sLoadingRecords": "Cargando...",
                "sProcessing": "Procesando...",
                "sSearch": "Buscar:",
                "sZeroRecords": "No se encontraron resultados",
                "oPaginate": {
                    "sFirst": "Primero",
                    "sLast": "Ultimo",
                    "sNext": "Siguiente",
                    "sPrevious": "Anterior"
                },
                "oAria": {
                    "sSortAscending": ": ascendiente",
                    "sSortDescending": ": descendiente"
                }
            });

        dt.dtColumnsServices = [
                    DTColumnBuilder.newColumn("conceptName").withTitle("Concepto"),
                    DTColumnBuilder.newColumn("categoryName").withTitle("Categoría").notSortable(),
                    DTColumnBuilder.newColumn("quantity").withTitle("Cantidad"),
                    //DTColumnBuilder.newColumn("price").withTitle("Precio").renderWith(currencyFormat).withClass("sum"),
                    //DTColumnBuilder.newColumn("cost").withTitle("Costo").renderWith(currencyFormat).withClass("sum"),
                    //DTColumnBuilder.newColumn("profit").withTitle("Utilidad").renderWith(currencyFormat).withClass("sum")
        ];

        dt.InstanceCallbackServices = function (instance) {
            // Setup - add a text input to each footer cell
            dt.dtInstanceServices = instance;
        };

        /*-------------------------------------------------------------TABLE EXAMS----------------------------------------------------*/

        dt.dtOptionsExams = DTOptionsBuilder.newOptions()
            .withOption("ajax", {
                dataType: "json",
                type: "POST",
                url: GetUrl(),
                data: function (d) {
                    dt.loadingTest = true;
                    d.filter = {
                        categoryName: 'Exámenes',
                        concept: dt.Filters.concept,
                        dateStart: dt.Filters.dateStart ? dt.Filters.dateStart.toDate().toISOString() : null,
                        dateEnd: dt.Filters.dateEnd ? dt.Filters.dateEnd.toDate().toISOString() : null,
                        clinics: dt.Filters.clinics,
                        xray: dt.Filters.xray,
                        laboratory: dt.Filters.laboratory,
                    };
                }
            })
            .withDataProp("data")
            .withPaginationType('full_numbers')
            .withOption('serverSide', true)
            .withOption('responsive', true)
            .withOption('sDom', '<"top"l>rt<"bottom"ip><"clear">')
            .withOption('lengthMenu', [[50, 100, 200, -1], [50, 100, 200, "Todos"]])
            .withOption("iDisplayLength", -1)
            .withOption('footerCallback', function (row, data, start, end, display) {
                var api = this.api();

                api.columns('.sum').every(function () {
                    var sum = this
                        .data()
                        .reduce(function (a, b) {
                            var x = parseFloat(a) || 0;
                            var y = parseFloat(b) || 0;
                            return x + y;
                        }, 0);
                    //console.log(sum);
                    $(this.footer()).html(dt.Ut_numberWithCommas(Math.round(sum * 100) / 100));
                });
                dt.loadingTest = false;
                $scope.$apply();
            })
            .withLanguage({
                "sEmptyTable": "No existen resultados",
                "sInfo": "Mostrando _START_ a _END_ de _TOTAL_ entradas",
                "sInfoEmpty": "Mostrando de 0 a 0 de 0 entradas",
                "sInfoFiltered": "(Filtrado de un todal de _MAX_ entradas)",
                "sInfoPostFix": "",
                "sInfoThousands": ",",
                "sLengthMenu": "Mostrando _MENU_ entradas",
                "sLoadingRecords": "Cargando...",
                "sProcessing": "Procesando...",
                "sSearch": "Buscar:",
                "sZeroRecords": "No se encontraron resultados",
                "oPaginate": {
                    "sFirst": "Primero",
                    "sLast": "Ultimo",
                    "sNext": "Siguiente",
                    "sPrevious": "Anterior"
                },
                "oAria": {
                    "sSortAscending": ": ascendiente",
                    "sSortDescending": ": descendiente"
                }
            });

        dt.dtColumnsExams = [
                    DTColumnBuilder.newColumn("conceptName").withTitle("Concepto"),
                    DTColumnBuilder.newColumn("categoryName").withTitle("Categoría").notSortable(),
                    DTColumnBuilder.newColumn("quantity").withTitle("Cantidad"),
                    //DTColumnBuilder.newColumn("price").withTitle("Precio").renderWith(currencyFormat).withClass("sum"),
                    //DTColumnBuilder.newColumn("cost").withTitle("Costo").renderWith(currencyFormat).withClass("sum"),
                    //DTColumnBuilder.newColumn("profit").withTitle("Utilidad").renderWith(currencyFormat).withClass("sum")
        ];

        dt.InstanceCallbackExams = function (instance) {
            // Setup - add a text input to each footer cell
            dt.dtInstanceExams = instance;
        };

        /*-------------------------------------------------------------TABLE CONSULTS----------------------------------------------------*/

        dt.dtOptionsConsults = DTOptionsBuilder.newOptions()
            .withOption("ajax", {
                dataType: "json",
                type: "POST",
                url: GetUrl(),
                data: function (d) {
                    dt.loadingConsult = true;
                    d.filter = {
                        categoryName: 'Consultas',
                        concept: dt.Filters.concept,
                        dateStart: dt.Filters.dateStart ? dt.Filters.dateStart.toDate().toISOString() : null,
                        dateEnd: dt.Filters.dateEnd ? dt.Filters.dateEnd.toDate().toISOString() : null,
                        clinics: dt.Filters.clinics
                    };
                }
            })
            .withDataProp("data")
            .withPaginationType('full_numbers')
            .withOption('serverSide', true)
            .withOption('responsive', true)
            .withOption('sDom', '<"top"l>rt<"bottom"ip><"clear">')
            .withOption('lengthMenu', [[50, 100, 200, -1], [50, 100, 200, "Todos"]])
            .withOption("iDisplayLength", -1)
            .withOption('footerCallback', function (row, data, start, end, display) {
                var api = this.api();

                api.columns('.sum').every(function () {
                    var sum = this
                        .data()
                        .reduce(function (a, b) {
                            var x = parseFloat(a) || 0;
                            var y = parseFloat(b) || 0;
                            return x + y;
                        }, 0);
                    //console.log(sum);
                    $(this.footer()).html(dt.Ut_numberWithCommas(Math.round(sum * 100) / 100));
                });
                dt.loadingConsult = false;
                $scope.$apply();
            })
            .withLanguage({
                "sEmptyTable": "No existen resultados",
                "sInfo": "Mostrando _START_ a _END_ de _TOTAL_ entradas",
                "sInfoEmpty": "Mostrando de 0 a 0 de 0 entradas",
                "sInfoFiltered": "(Filtrado de un todal de _MAX_ entradas)",
                "sInfoPostFix": "",
                "sInfoThousands": ",",
                "sLengthMenu": "Mostrando _MENU_ entradas",
                "sLoadingRecords": "Cargando...",
                "sProcessing": "Procesando...",
                "sSearch": "Buscar:",
                "sZeroRecords": "No se encontraron resultados",
                "oPaginate": {
                    "sFirst": "Primero",
                    "sLast": "Ultimo",
                    "sNext": "Siguiente",
                    "sPrevious": "Anterior"
                },
                "oAria": {
                    "sSortAscending": ": ascendiente",
                    "sSortDescending": ": descendiente"
                }
            });

        dt.dtColumnsConsults = [
                    DTColumnBuilder.newColumn("conceptName").withTitle("Concepto"),
                    DTColumnBuilder.newColumn("categoryName").withTitle("Categoría").notSortable(),
                    DTColumnBuilder.newColumn("quantity").withTitle("Cantidad"),
                    //DTColumnBuilder.newColumn("price").withTitle("Precio").renderWith(currencyFormat).withClass("sum"),
                    //DTColumnBuilder.newColumn("cost").withTitle("Costo").renderWith(currencyFormat).withClass("sum"),
                    //DTColumnBuilder.newColumn("profit").withTitle("Utilidad").renderWith(currencyFormat).withClass("sum")
        ];

        dt.InstanceCallbackConsults = function (instance) {
            // Setup - add a text input to each footer cell
            dt.dtInstanceConsults = instance;
        };

        /*-------------------------------------------------------------TABLE PACKAGE----------------------------------------------------*/

        dt.dtOptionsPack = DTOptionsBuilder.newOptions()
            .withOption("ajax", {
                dataType: "json",
                type: "POST",
                url: GetUrl(),
                data: function (d) {
                    dt.loadingPackage = true;
                    d.filter = {
                        categoryName: 'Paquetes',
                        concept: dt.Filters.concept,
                        dateStart: dt.Filters.dateStart ? dt.Filters.dateStart.toDate().toISOString() : null,
                        dateEnd: dt.Filters.dateEnd ? dt.Filters.dateEnd.toDate().toISOString() : null,
                        clinics: dt.Filters.clinics
                    };
                }
            })
            .withDataProp("data")
            .withPaginationType('full_numbers')
            .withOption('serverSide', true)
            .withOption('responsive', true)
            .withOption('sDom', '<"top"l>rt<"bottom"ip><"clear">')
            .withOption('lengthMenu', [[50, 100, 200, -1], [50, 100, 200, "Todos"]])
            .withOption("iDisplayLength", -1)
            .withOption('footerCallback', function (row, data, start, end, display) {
                var api = this.api();

                api.columns('.sum').every(function () {
                    var sum = this
                        .data()
                        .reduce(function (a, b) {
                            var x = parseFloat(a) || 0;
                            var y = parseFloat(b) || 0;
                            return x + y;
                        }, 0);
                    //console.log(sum);
                    $(this.footer()).html(dt.Ut_numberWithCommas(Math.round(sum * 100) / 100));
                });
                dt.loadingPackage = false;
                $scope.$apply();
            })
            .withLanguage({
                "sEmptyTable": "No existen resultados",
                "sInfo": "Mostrando _START_ a _END_ de _TOTAL_ entradas",
                "sInfoEmpty": "Mostrando de 0 a 0 de 0 entradas",
                "sInfoFiltered": "(Filtrado de un todal de _MAX_ entradas)",
                "sInfoPostFix": "",
                "sInfoThousands": ",",
                "sLengthMenu": "Mostrando _MENU_ entradas",
                "sLoadingRecords": "Cargando...",
                "sProcessing": "Procesando...",
                "sSearch": "Buscar:",
                "sZeroRecords": "No se encontraron resultados",
                "oPaginate": {
                    "sFirst": "Primero",
                    "sLast": "Ultimo",
                    "sNext": "Siguiente",
                    "sPrevious": "Anterior"
                },
                "oAria": {
                    "sSortAscending": ": ascendiente",
                    "sSortDescending": ": descendiente"
                }
            });

        dt.dtColumnsPack = [
                    DTColumnBuilder.newColumn("conceptName").withTitle("Concepto"),
                    DTColumnBuilder.newColumn("categoryName").withTitle("Categoría").notSortable(),
                    DTColumnBuilder.newColumn("quantity").withTitle("Cantidad"),
                    //DTColumnBuilder.newColumn("price").withTitle("Precio").renderWith(currencyFormat).withClass("sum"),
                    //DTColumnBuilder.newColumn("cost").withTitle("Costo").renderWith(currencyFormat).withClass("sum"),
                    //DTColumnBuilder.newColumn("profit").withTitle("Utilidad").renderWith(currencyFormat).withClass("sum")
        ];

        dt.InstanceCallbackPack = function (instance) {
            // Setup - add a text input to each footer cell
            dt.dtInstancePack = instance;
        };

        /*-------------------------------------------------------------TABLE PAYMENT----------------------------------------------------*/

        dt.dtOptionsPayment = DTOptionsBuilder.newOptions()
            .withOption("ajax", {
                dataType: "json",
                type: "POST",
                url: GetPaymentsUrl(),
                data: function (d) {
                    dt.loadingPayment = true;
                    d.filter = {
                        dateStart: dt.Filters.dateStart ? dt.Filters.dateStart.toDate().toISOString() : null,
                        dateEnd: dt.Filters.dateEnd ? dt.Filters.dateEnd.toDate().toISOString() : null,
                        clinics: dt.Filters.clinics
                    };
                }
            })
            .withDataProp("data")
            .withPaginationType('full_numbers')
            .withOption('serverSide', true)
            .withOption('responsive', true)
            .withOption('sDom', '<"top"l>rt<"bottom"ip><"clear">')
            .withOption('lengthMenu', [[50, 100, 200, -1], [50, 100, 200, "Todos"]])
            .withOption("iDisplayLength", -1)
            .withOption('footerCallback', function (row, data, start, end, display) {
                var api = this.api();

                api.columns('.sum').every(function () {
                    var sum = this
                        .data()
                        .reduce(function (a, b) {
                            var x = parseFloat(a) || 0;
                            var y = parseFloat(b) || 0;
                            return x + y;
                        }, 0);
                    //console.log(sum);
                    $(this.footer()).html(dt.Ut_numberWithCommas(Math.round(sum * 100) / 100));
                });
                dt.loadingPayment = false;
                $scope.$apply();
            })
            .withLanguage({
                "sEmptyTable": "No existen resultados",
                "sInfo": "Mostrando _START_ a _END_ de _TOTAL_ entradas",
                "sInfoEmpty": "Mostrando de 0 a 0 de 0 entradas",
                "sInfoFiltered": "(Filtrado de un todal de _MAX_ entradas)",
                "sInfoPostFix": "",
                "sInfoThousands": ",",
                "sLengthMenu": "Mostrando _MENU_ entradas",
                "sLoadingRecords": "Cargando...",
                "sProcessing": "Procesando...",
                "sSearch": "Buscar:",
                "sZeroRecords": "No se encontraron resultados",
                "oPaginate": {
                    "sFirst": "Primero",
                    "sLast": "Ultimo",
                    "sNext": "Siguiente",
                    "sPrevious": "Anterior"
                },
                "oAria": {
                    "sSortAscending": ": ascendiente",
                    "sSortDescending": ": descendiente"
                }
            });

        dt.dtColumnsPayment = [
                    DTColumnBuilder.newColumn("employeeName").withTitle("Empleado"),
                    DTColumnBuilder.newColumn("clinicName").withTitle("Clínica"),
                    DTColumnBuilder.newColumn("paymentTypeName").withTitle("Tipo pago"),
                    DTColumnBuilder.newColumn("ticket").withTitle("Ticket"),
                    DTColumnBuilder.newColumn("amount").withTitle("Monto").renderWith(currencyFormat).withClass("sum"),
                    DTColumnBuilder.newColumn("commission").withTitle("Comisión").renderWith(currencyFormat).withClass("sum"),
                    DTColumnBuilder.newColumn("total").withTitle("Total").renderWith(currencyFormat).withClass("sum")
        ];

        dt.InstanceCallbackPayment = function (instance) {
            // Setup - add a text input to each footer cell
            dt.dtInstancePayment = instance;
        };

        /*-------------------------------------------------------------TABLE SURGERY----------------------------------------------------*/

        dt.dtOptionsSurgery = DTOptionsBuilder.newOptions()
            .withOption("ajax", {
                dataType: "json",
                type: "POST",
                url: GetUrl(),
                data: function (d) {
                    dt.loadingSurgery = true;
                    d.filter = {
                        categoryName: 'Cirugías',
                        concept: dt.Filters.concept,
                        dateStart: dt.Filters.dateStart ? dt.Filters.dateStart.toDate().toISOString() : null,
                        dateEnd: dt.Filters.dateEnd ? dt.Filters.dateEnd.toDate().toISOString() : null,
                        clinics: dt.Filters.clinics
                    };
                }
            })
            .withDataProp("data")
            .withPaginationType('full_numbers')
            .withOption('serverSide', true)
            .withOption('responsive', true)
            .withOption('sDom', '<"top"l>rt<"bottom"ip><"clear">')
            .withOption('lengthMenu', [[50, 100, 200, -1], [50, 100, 200, "Todos"]])
            .withOption("iDisplayLength", -1)
            .withOption('footerCallback', function (row, data, start, end, display) {
                var api = this.api();

                api.columns('.sum').every(function () {
                    var sum = this
                        .data()
                        .reduce(function (a, b) {
                            var x = parseFloat(a) || 0;
                            var y = parseFloat(b) || 0;
                            return x + y;
                        }, 0);
                    //console.log(sum);
                    $(this.footer()).html(dt.Ut_numberWithCommas(Math.round(sum * 100) / 100));
                });
                dt.loadingSurgery = false;
                $scope.$apply();
            })
            .withLanguage({
                "sEmptyTable": "No existen resultados",
                "sInfo": "Mostrando _START_ a _END_ de _TOTAL_ entradas",
                "sInfoEmpty": "Mostrando de 0 a 0 de 0 entradas",
                "sInfoFiltered": "(Filtrado de un todal de _MAX_ entradas)",
                "sInfoPostFix": "",
                "sInfoThousands": ",",
                "sLengthMenu": "Mostrando _MENU_ entradas",
                "sLoadingRecords": "Cargando...",
                "sProcessing": "Procesando...",
                "sSearch": "Buscar:",
                "sZeroRecords": "No se encontraron resultados",
                "oPaginate": {
                    "sFirst": "Primero",
                    "sLast": "Ultimo",
                    "sNext": "Siguiente",
                    "sPrevious": "Anterior"
                },
                "oAria": {
                    "sSortAscending": ": ascendiente",
                    "sSortDescending": ": descendiente"
                }
            });

        dt.dtColumnsSurgery = [
                    DTColumnBuilder.newColumn("conceptName").withTitle("Concepto"),
                    DTColumnBuilder.newColumn("categoryName").withTitle("Categoría").notSortable(),
                    DTColumnBuilder.newColumn("quantity").withTitle("Cantidad"),
                    //DTColumnBuilder.newColumn("price").withTitle("Precio").renderWith(currencyFormat).withClass("sum"),
                    //DTColumnBuilder.newColumn("cost").withTitle("Costo").renderWith(currencyFormat).withClass("sum"),
                    //DTColumnBuilder.newColumn("profit").withTitle("Utilidad").renderWith(currencyFormat).withClass("sum"),
        ];

        dt.InstanceCallbackSurgery = function (instance) {
            // Setup - add a text input to each footer cell
            dt.dtInstanceSurgery = instance;
        };
        /*----------------------------------------------------------------END TABLES--------------------------------------------------------------*/
    };

    function pageCount(data, type, full) {
        _cont++;
        return _cont;
    }

    var init = function (urlConcepts, categoriesUrl, urlClinics) {
        dt.ConceptsUrl = urlConcepts;
        $http({
            method: 'POST',
            url: categoriesUrl,
            headers: {
                'Content-Type': 'application/json'
            }
        }).then(function (res) {
            if (res.data.success) {
                dt.categories = res.data.data;
                dt.Ready = true;
            }
            else if (res.data.success == undefined && res.data.indexOf("SignIn") > -1) {
                dt.errors[0] = "La sesión ha caducado.";
                $("#resultModal").modal('show');
            }
            else {
                if (res.data.errors != undefined && res.data.errors && res.data.errors.length > 0) {
                    dt.errors = res.data.errors;
                }
                else {
                    dt.errors[0] = res.data.message;
                }
                $("#resultModal").modal('show');
            }

        }, function errorCallback(res) {
            console.log("error: " + res);
        });
        $http({
            method: 'POST',
            url: urlClinics,
            headers: {
                'Content-Type': 'application/json'
            }
        }).then(function (res) {
            if (res.data.success) {
                dt.clinics = res.data.data;
            }
            else if (res.data.success == undefined && res.data.indexOf("SignIn") > -1) {
                dt.errors[0] = "La sesión ha caducado.";
                $("#resultModal").modal('show');
            }
            else {
                if (res.data.errors != undefined && res.data.errors && res.data.errors.length > 0) {
                    dt.errors = res.data.errors;
                }
                else {
                    dt.errors[0] = res.data.message;
                }
                $("#resultModal").modal('show');
            }

        }, function errorCallback(res) {
            console.log("error: " + res);
        });
    };

    dt.ApplyFilters = function () {
        dt.dtInstance.reloadData();
        dt.dtInstanceServices.reloadData();
        dt.dtInstanceExams.reloadData();
        dt.dtInstanceConsults.reloadData();
        //dt.dtInstancePack.reloadData();
        //dt.dtInstancePayment.reloadData();
        //dt.dtInstanceSurgery.reloadData();
    };

    dt.StartController = function (urlConcepts, categoriesUrl, urlClinics) {
        if (!dt.Ready) {
            init(urlConcepts, categoriesUrl, urlClinics);
        }
    };
    dt.loadConcepts = function (val) {
        return $http.post(GetConceptsUrl(), {
            data: JSON.stringify({ typed: val })
        }).then(function (response) {
            return response.data.data.map(function (item) {
                return item;
            })
        });
    }
});