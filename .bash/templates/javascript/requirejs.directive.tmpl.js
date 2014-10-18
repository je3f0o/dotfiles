
"use strict";

define([], function () {
	var OBJECT_NAME = function () {
		console.log("Called : OBJECT_NAME");

		return {
			restrict : "EA",
			scope : {
				data : "=data"
			},
			template : null,
			templateUrl : null,
			transclude : false,
			replace : true,
			link : function (scope, element, attrs) {
				
			},
			controller : function ($scope) {
				console.log("OBJECT_NAME is fired!");
			}
		};
	};

	return OBJECT_NAME;
});
