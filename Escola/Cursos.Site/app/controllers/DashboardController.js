﻿'use strict';
app.controller('DashboardController', ['$scope', 'dashboardService', 'listaatividadesService', 'inscricaoService','clienteService',
    function ($scope, dashboardService, listaatividadesService, inscricaoService, clienteService) {
        $scope.inscricoes = [];
        $scope.clientes = [];

        var getTopClientes = function () {
            clienteService.GetTopClientes(function (response) {
                if (response.status === 200) {
                    var emptyData = jQuery.isEmptyObject(response.data[0]);
                    if (emptyData) return;
                    for (var item in response.data) {
                        response.data[item].Dtregistro = formatDate(new Date(response.data[item].Dtregistro), "dd/MM/yyyy");
                        console.log(response.data[item].Dtregistro);
                    }
                    $scope.clientes = response.data;
                } else {
                    var message = "";
                    for (var item in response.data) {
                        if (response.data.hasOwnProperty(item)) {
                            message += response.data[item];
                        }
                    }
                    notyService.Noty("Erro", message, notyService.Type.Danger, false, function (n) { return n; });
                }
            });
        }

        var getTopInscricoes = function () {
            inscricaoService.GetTopInscricoes(function (response) {
                if (response.status === 200) {
                    var emptyData = jQuery.isEmptyObject(response.data[0]);
                    if (emptyData) return;
                    for (var item in response.data) {
                        response.data[item].Dtinscricao = formatDate(new Date(response.data[item].Dtinscricao), "dd/MM/yyyy");
                    }

                    $scope.inscricoes = response.data;
                } else {
                    var message = "";
                    for (var item in response.data) {
                        if (response.data.hasOwnProperty(item)) {
                            message += response.data[item];
                        }
                    }
                    notyService.Noty("Erro", message, notyService.Type.Danger, false, function (n) { return n; });
                }
            });
        }

        var getByUser = function () {
            controlenecessidadeService.GetAll(function (response) {
                if (response.status === 200) {
                    var emptyData = jQuery.isEmptyObject(response.data[0]);
                    if (emptyData) return;
                    $scope.tblData = response.data;
                } else {
                    var message = "";
                    for (var item in response.data) {
                        if (response.data.hasOwnProperty(item)) {
                            message += response.data[item];
                        }
                    }
                    notyService.Noty("Erro", message, notyService.Type.Danger, false, function (n) { return n; });
                }
            });
        };


        function generateNotifDashboard(content) {
            var position = 'topRight';
            if ($('body').hasClass('rtl')) position = 'topLeft';
            var n = noty({
                text: content,
                type: 'success',
                layout: position,
                theme: 'made',
                animation: {
                    open: 'animated bounceIn',
                    close: 'animated bounceOut'
                },
                timeout: 4500,
                callback: {
                    onShow: function () {
                        $('#noty_topRight_layout_container, .noty_container_type_success').css('width', 350).css('bottom', 10);
                    },
                    onCloseClick: function () {
                        setTimeout(function () {
                            $('#quickview-sidebar').addClass('open');
                        }, 500);
                    }
                }
            });
        }

        /* Notifications, demo purpose */
        var notifContent = '<div class="alert alert-dark media fade in bd-0" id="message-alert"><div class="media-left"><img src="../../../assets/global/images/profil_page/friend8.jpg" class="dis-block img-circle"></div><div class="media-body width-100p"><h4 class="alert-title f-14">Nova Mensagem</h4><p class="f-12 alert-message pull-left">Jeferson .</p><p class="pull-right"><a href="#" class="f-12">Ler Mensagem</a></p></div></div>';
        setTimeout(function () {
            if (!$('#quickview-sidebar').hasClass('open') && !$('.page-content').hasClass('page-builder') && !$('.morphsearch').hasClass('open')) generateNotifDashboard(notifContent);
        }, 3000);


        $('*[data-jquery-clock]').each(function () {
            var t = $(this);
            var seconds = new Date().getSeconds(),
                hours = new Date().getHours(),
                mins = new Date().getMinutes(),
                sdegree = seconds * 6,
                hdegree = hours * 30 + (mins / 2),
                mdegree = mins * 6;
            var updateWatch = function () {
                sdegree += 6;
                if (sdegree % 360 == 0) {
                    mdegree += 6;
                }
                hdegree += (0.1 / 12);
                var srotate = "rotate(" + sdegree + "deg)",
                    hrotate = "rotate(" + hdegree + "deg)",
                    mrotate = "rotate(" + mdegree + "deg)";
                $(".jquery-clock-sec", t).css({
                    "-moz-transform": srotate,
                    "-webkit-transform": srotate,
                    '-ms-transform': srotate
                });
                $(".jquery-clock-hour", t).css({
                    "-moz-transform": hrotate,
                    "-webkit-transform": hrotate,
                    '-ms-transform': hrotate
                });
                $(".jquery-clock-min", t).css({
                    "-moz-transform": mrotate,
                    "-webkit-transform": mrotate,
                    '-ms-transform': mrotate
                });
            }
            updateWatch();
            setInterval(function () {
                $(".jquery-clock-sec, .jquery-clock-hour, .jquery-clock-min").addClass('jquery-clock-transitions');
                updateWatch();
            }, 1000);
            $(window).focus(function () {
                $(".jquery-clock-sec, .jquery-clock-hour, .jquery-clock-min").addClass('jquery-clock-transitions');
            });
            $(window).blur(function () {
                $(".jquery-clock-sec, .jquery-clock-hour, .jquery-clock-min").removeClass('jquery-clock-transitions');
            });
        });

        //var visitorsData = {
        //    labels: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
        //    datasets: [
        //        {
        //            label: "New Visitors",
        //            fillColor: "rgba(200,200,200,0.5)",
        //            strokeColor: "rgba(200,200,200,1)",
        //            pointColor: "rgba(200,200,200,1)",
        //            pointStrokeColor: "#fff",
        //            pointHighlightFill: "#fff",
        //            pointHighlightStroke: "rgba(200,200,200,1)",
        //            data: [4275, 4321, 7275, 6512, 5472, 6540, 7542, 5475, 6547, 7454, 9544, 10245]
        //        },
        //        {
        //            label: "Returning visitors",
        //            fillColor: "rgba(49, 157, 181,0.5)",
        //            strokeColor: "rgba(49, 157, 181,0.7)",
        //            pointColor: "rgba(49, 157, 181,1)",
        //            pointStrokeColor: "#fff",
        //            pointHighlightFill: "#fff",
        //            pointHighlightStroke: "rgba(49, 157, 181,1)",
        //            data: [3255, 3758, 4538, 2723, 6752, 6534, 8760, 7544, 5424, 4244, 6547, 7857]
        //        }
        //    ]
        //};
        //var chartOptions = {
        //    scaleGridLineColor: "rgba(0,0,0,.05)",
        //    scaleGridLineWidth: 1,
        //    bezierCurve: true,
        //    pointDot: true,
        //    pointHitDetectionRadius: 20,
        //    tooltipCornerRadius: 0,
        //    scaleShowLabels: false,
        //    tooltipTemplate: "dffdff",
        //    multiTooltipTemplate: "<%= datasetLabel %> - <%= value %>",
        //    responsive: true,
        //    scaleShowLabels: false,
        //    showScale: false,
        //};
        //var ctx = document.getElementById("visitors-chart").getContext("2d");
        //var myNewChart = new Chart(ctx).Line(visitorsData, chartOptions);        
        //setTimeout(function () {
        //    window.dispatchEvent(new Event('resize'));
        //}, 1000);

        /* Progress Bar  Widget */
        if ($('.widget-progress-bar').length) {
            setTimeout(function () {
                $('.widget-progress-bar .stat1').progressbar();
            }, 900);
            setTimeout(function () {
                $('.widget-progress-bar .stat2').progressbar();
            }, 1200);
            setTimeout(function () {
                $('.widget-progress-bar .stat3').progressbar();
            }, 1500);
            setTimeout(function () {
                $('.widget-progress-bar .stat4').progressbar();
            }, 1800);
        };

        getTopClientes();
        getTopInscricoes();
}]);