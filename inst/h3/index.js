require("@babel/polyfill");

global.h3 = require('h3-js');

global.vectorize = function(func) {
  var func_args = Array.prototype.slice.call(arguments, 1);
  var n = func_args.reduce(function(acc, x) {
    if (Array.isArray(x)) {
      return Math.max(x.length, acc);
    } else {
      return acc;
    }
  }, 1);

  var out = new Array(n);

  for (var i = 0; i < n; i++) {
    var args = func_args.map(function(x) {
      if (Array.isArray(x)) {
        return x[i % x.length];
      } else {
        return x;
      }
    });

    out[i] = func.apply(null, args);
  }

  return out;
};
