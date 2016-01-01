
"use strict";

define([], function () {
	var OBJECT_NAME = function () {
		console.log("Called : OBJECT_NAME");

		return function (data) {
			console.log("OBJECT_NAME is fired!");
			return data;
		};
	};

	return OBJECT_NAME;
});
