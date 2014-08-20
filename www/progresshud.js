//  progresshud.js
//
//  Created by Pierre-Emmanuel Bois on 23/09/13.
//
//  Copyright 2012-2013 Pierre-Emmanuel Bois. All rights reserved.
//  MIT Licensed

var ProgressHUD = {
    show: function ( message, messageLong, determined ) {
    	var _message = ( message || 'Loading' );
    	var _messageLong = ( messageLong || 'Please Wait' );
    	determined = !!determined;
        cordova.exec(function () { }, function () { }, "ProgressHUD", "show", [ _message, _messageLong, determined ]);
    },
    setValue: function ( value ) {
    	var _value = ( value || 0 );
        cordova.exec(function () { }, function () { }, "ProgressHUD", "setValue", [ _value ]);
    },
    hide: function () {
        cordova.exec(function () { }, function () { }, "ProgressHUD", "hide", []);
    }
};

module.exports = ProgressHUD;
