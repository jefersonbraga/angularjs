///// <sumary>
///// By: Jeferson Braga do Carmo Create Date: 25/11/2015
///// Last Update: 11/13/2017 1:58:38 PM
///// Gerado automaticamente para alteracoes dos metodos comum alterar o template
///// </sumary>
"use strict";
app.factory("DependenciaadministrativaService", ["$http", "ngAuthSettings", function ($http, ngAuthSettings) {
        var service = {};
		var serviceBase = ngAuthSettings.apiServiceBaseUri;
        service.GetAll = function (callback) {
            $http.get(serviceBase + "Dependenciaadministrativa/getall")
                .then(function (response) {
                    callback(response);
                }, function (response) {
                    callback(response);
                });
        };

        service.GetById = function (id, callback) {
            $http.get(serviceBase + "Dependenciaadministrativa/getbyid/" + id)
               .then(function (response) {
                    callback(response);
                }, function (response) {
                    callback(response);
                });
        };

        service.Post = function (Dependenciaadministrativa, callback) {
            $http.post(serviceBase + "Dependenciaadministrativa/post", Dependenciaadministrativa)
                .then(function (response) {
                    callback(response);
                }, function (response) {
                    callback(response);
                });
        };

        service.Put = function (Dependenciaadministrativa, callback) {
            $http.post(serviceBase + "Dependenciaadministrativa/put", Dependenciaadministrativa)
                .then(function (response) {
                    callback(response);
                }, function (response) {
                    callback(response);
                });
        };

		service.Delete = function (Dependenciaadministrativa, callback) {
            $http.post(serviceBase + "Dependenciaadministrativa/delete", Dependenciaadministrativa)
                .then(function (response) {
                    callback(response);
                }, function (response) {
                    callback(response);
                });
        };

        return service;
    }]);

