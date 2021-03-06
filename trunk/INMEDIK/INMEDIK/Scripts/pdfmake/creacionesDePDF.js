var col1='8.333333333333334%';
var col2='16.666666666666668%';
var col3='25%';
var col4='33.333333333333336%';
var col5='41.66666666666667%';
var col6='50%';
var col7='58.333333333333336%';
var col8='66.66666666666667%';
var col9='75%';
var col10='83.33333333333334%';
var col11='91.66666666666667%';
var col12='100%';
var generalMargin = [0,0,0,5];

var lineas = "===============================================";
var lineaContinua = "_________________________________________________________";
var WithColumns = "40%";

globalStyles = {
		header: {
			fontSize: 22,
			margin:generalMargin,
			bold: true
		},
		PsemiHeader: {
			fontSize: 14,
			margin:[0,10,0,0],
			bold: true
		},
		PsemiHeaderNoBold: {
		    fontSize: 10
		},

		PsemiHeaderNoBoldCenter: {
		    fontSize: 10,
		    alignment: 'center'
		},
		label: {
		    bold: true,
		    fontSize: 10,
		    margin: generalMargin,
		    width: col2
		},
		labelSinBold: {
		    //bold: true,
		    fontSize: 10,
		    margin: generalMargin,
		    width: col2
		},
		labelImporte: {
			bold: true,
			fontSize:10,
			// margin:[0,0,0,1],
			width: col2
		},
		normalText:{
			fontSize: 8,
			margin: generalMargin,
			italic: true,
		},
		normalTextCenter: {
		    fontSize: 8,
		    margin: generalMargin,
		    alignment: 'center'
		},
		normalTextRight: {
		    fontSize: 8,
		    margin: generalMargin,
		    alignment: 'right'
		}
	};

function PrintTicketOrder(OrderObj) {
	//var unRepitedConcepts = [];
    //$.each(OrderObj.OrderConceptAux,function(idx,item){
	//    var itExist = [];
	//    itExist = unRepitedConcepts.filter(function(fitem){ 
    //        return item.orderId == fitem.orderId;
    //    });
	//    if(itExist.length == 0 ){
	//        unRepitedConcepts.push(item);
    //    }
    //    else{
	//        unRepitedConcepts[unRepitedConcepts.indexOf(itExist[0])].quantity += item.quantity;
	//		unRepitedConcepts[unRepitedConcepts.indexOf(itExist[0])].total += item.total;
	//    }
    //});

    //OrderObj.OrderConceptAux = unRepitedConcepts;

	var content = [];
    var WithColumns = "30%";
    var lineasTicket = "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -";
    //content.push({ columns: [{ width: WithColumns, text: "INMEDIK", style: 'normalTextCenter' }] });
    content.push({ columns: [{ width: WithColumns, text: "ID Salud", style: 'normalTextCenter' }] });
    //content.push({ columns: [{ width: WithColumns, text: "Centro M??dico One", style: 'normalTextCenter' }] });
    content.push({ columns: [{ width: WithColumns, text: "R.F.C. " + OrderObj.clinicAux.rfc, style: 'normalTextCenter' }] });
    content.push({ columns: [{ width: WithColumns, text: (OrderObj.clinicAux.addressAux.fullAddress + "C.P. " + OrderObj.clinicAux.addressAux.postalCode).toUpperCase(), style: 'normalTextCenter' }] });
    content.push({ columns: [{ width: WithColumns, text: lineasTicket, style: 'normalTextCenter' }] });

    content.push({ columns: [{ width: WithColumns, columns: [{ text: "TICKET", style: 'normalText' }, { text: OrderObj.Ticket, style: 'normalTextRight' }] }] });
    content.push({ columns: [{ width: WithColumns, columns: [{ text: "CAJERO", style: 'normalText' }, { text: OrderObj.employeeAux.personAux.fullName, style: 'normalTextRight' }] }] });
    content.push({ columns: [{ width: WithColumns, columns: [{ text: "CLIENTE", style: 'normalText' }, { text: OrderObj.patientAux.personAux.fullName, style: 'normalTextRight' }] }] });
    content.push({ columns: [{ width: WithColumns, columns: [{ text: "FOLIO", style: 'normalText' }, { text: OrderObj.patientAux.id, style: 'normalTextRight' }] }] });
    content.push({ columns: [{ width: WithColumns, columns: [{ text: "FECHA", style: 'normalText' }, { text: OrderObj.sCreated.toUpperCase(), style: 'normalTextRight' }] }] });
    content.push({ columns: [{ width: WithColumns, text: lineasTicket, style: 'normalTextCenter' }] });
    content.push({
        columns: [{
            width: WithColumns, columns: [
                     { width: '50%', text: "CONCEPTO", style: 'normalText' },
                     { width: '25%', text: "CANT.", style: 'normalTextCenter' },
                     // { text: "P/U", style: 'normalTextCenter' },
					 { width: '25%', text: "TOTAL", style: 'normalTextRight' }
            ]
        }]
    });
    for (var i = 0; i < OrderObj.OrderConceptAux.length; i++) {
        content.push({
            columns: [{
                width: WithColumns, columns: [
                     { width: '50%', text: OrderObj.OrderConceptAux[i].ConceptAux.name, style: 'normalText' },
                     { width: '25%',text: OrderObj.OrderConceptAux[i].quantity, style: 'normalTextCenter' },
                     // { text: Ut_numberWithCommas(OrderObj.OrderConceptAux[i].price), style: 'normalTextCenter' },
                     { width: '25%',text: Ut_numberWithCommas(OrderObj.OrderConceptAux[i].total), style: 'normalTextRight' }
                ]
            }]
        });
    }
    if (OrderObj.orderPackageAux.packageAux.name != null) {
        content.push({
            columns: [{
                width: WithColumns, columns: [
                     { width: '50%', text: OrderObj.orderPackageAux.packageAux.name, style: 'normalText' },
                     { width: '25%', text: '1', style: 'normalTextCenter' },
                     { width: '25%', text: Ut_numberWithCommas(OrderObj.orderPackageAux.packageAux.price), style: 'normalTextRight' }
                ]
            }]
        });
    }
	content.push({ columns: [{ width: WithColumns, text: lineasTicket, style: 'normalTextCenter' }] });
	content.push({ columns: [{ width: WithColumns, text: "PROMOCIONES APLICADAS", style: 'normalTextCenter' }] });
	content.push({
        columns: [{
            width: WithColumns, columns: [
                     { text: "CONCEPTO", style: 'normalText' },
                     { text: "PROMO.", style: 'normalTextCenter' },
                     { text: "AHORRO", style: 'normalTextRight' }
            ]
        }]
    });
	for (var i = 0; i < OrderObj.Promotions.length; i++) {
	    if (OrderObj.Promotions[i].ConceptId == null) {
	        content.push({
	            columns: [{
	                width: WithColumns, columns: [
                         { text: "Combo", style: 'normalText' },
                         { text: OrderObj.Promotions[i].TextPromotion, style: 'normalTextCenter' },
                         { text: Ut_numberWithCommas(OrderObj.Promotions[i].AmountSaved), style: 'normalTextRight' }
	                ]
	            }]
	        });
	    }
	    else {
	        content.push({
	            columns: [{
	                width: WithColumns, columns: [
                         { text: OrderObj.OrderConceptAux.filter(function (item) { return OrderObj.Promotions[i].ConceptId == item.conceptId })[0].ConceptAux.name, style: 'normalText' },
                         { text: OrderObj.Promotions[i].TextPromotion, style: 'normalTextCenter' },
                         { text: Ut_numberWithCommas(OrderObj.Promotions[i].AmountSaved), style: 'normalTextRight' }
	                ]
	            }]
	        });
	    }

    }
    content.push({ columns: [{ width: WithColumns, text: lineasTicket, style: 'normalTextCenter' }] });
    content.push({ columns: [{ width: WithColumns, columns: [{ text: "DONACI??N", style: 'normalText' }, { text: Ut_numberWithCommas(OrderObj.Donation), style: 'normalTextRight' }] }] });
    content.push({ columns: [{ width: WithColumns, text: lineasTicket, style: 'normalTextCenter' }] });

    content.push({ columns: [{ width: WithColumns, columns: [{ text: "REDONDEO", style: 'normalText' }, { text: Ut_numberWithCommas(OrderObj.Rounding), style: 'normalTextRight' }] }] });
    content.push({ columns: [{ width: WithColumns, columns: [{ text: "IVA", style: 'normalText' }, { text: Ut_numberWithCommas(OrderObj.Iva), style: 'normalTextRight' }] }] });
    content.push({ columns: [{ width: WithColumns, columns: [{ text: "TOTAL", style: 'normalText' }, { text: Ut_numberWithCommas(OrderObj.Total + OrderObj.Donation), style: 'normalTextRight' }] }] });

    content.push({ columns: [{ width: WithColumns, text: " ", style: 'normalTextCenter' }] });
    content.push({
        columns: [{
            width: WithColumns, columns: [
                     { text: "TIPO PAGO", style: 'normalText' },
                     { text: "COMISI??N", style: 'normalTextCenter' },
                     { text: "TOTAL", style: 'normalTextRight' }
            ]
        }]
    });
    for (var i = 0; i < OrderObj.paymentAux.length; i++) {

        var comis = " ";
        if (OrderObj.paymentAux[i].PaymentTypeAux.Name == "Tarjeta") {
            comis = Ut_numberWithCommas(OrderObj.paymentAux[i].Commission);
        }
        else {
            comis = "-";
        }
        content.push({
            columns: [{
                width: WithColumns, columns: [
                     { text: OrderObj.paymentAux[i].PaymentTypeAux.Name, style: 'normalText' },
                     { text: comis, style: 'normalTextCenter' },
                     { text: Ut_numberWithCommas(OrderObj.paymentAux[i].Amount), style: 'normalTextRight' }
                ]
            }]
        });
    }

    content.push({ columns: [{ width: WithColumns, text: lineasTicket, style: 'normalTextCenter' }] });
    content.push({ columns: [{ width: WithColumns, text: "GRACIAS POR SU COMPRA.", style: 'normalTextCenter' }] });



    var docDefinition = {
        styles: globalStyles,
        content: content
    };
    var IEver = detectIE();
    if (IEver === false) {
        pdfMake.createPdf(docDefinition).open();
    }
    else {
        pdfMake.createPdf(docDefinition).download();
    }
}