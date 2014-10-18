
"use strict";

define([], function () {
	var OBJECT_NAME = function ($scope) {

		console.log("Called : OBJECT_NAME");
	};

	OBJECT_NAME.$inject = ["$scope"];
	return OBJECT_NAME;
});
