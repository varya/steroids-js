// Generated by CoffeeScript 1.7.1
var JSCoreBridge,
  __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

JSCoreBridge = (function(_super) {
  __extends(JSCoreBridge, _super);

  function JSCoreBridge() {
    this.send = __bind(this.send, this);
    window.__JSCoreBridgeImpl.registerHandler("steroids.nativeBridge.message_handler");
    return true;
  }

  JSCoreBridge.isUsable = function() {
    console.log("JSCoreBridge.isUsable: " + (typeof window.__JSCoreBridgeImpl));
    return typeof window.__JSCoreBridgeImpl !== 'undefined';
  };

  JSCoreBridge.prototype.sendMessageToNative = function(message) {
    return window.__JSCoreBridgeImpl.send(message);
  };

  JSCoreBridge.prototype.send = function(options) {
    var request;
    if (options == null) {
      options = {};
    }
    request = {
      method: options.method,
      parameters: (options != null ? options.parameters : void 0) != null ? options.parameters : {},
      callbacks: options.callbacks
    };
    request.parameters["view"] = window.top.AG_VIEW_ID;
    request.parameters["screen"] = window.top.AG_SCREEN_ID;
    request.parameters["layer"] = window.top.AG_LAYER_ID;
    request.parameters["udid"] = window.top.AG_WEBVIEW_UDID;
    return this.sendMessageToNative(request);
  };

  return JSCoreBridge;

})(Bridge);