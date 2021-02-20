window.WOW = require('packs/wow.min').WOW
window.classie = require('packs/classie')
require('packs/pace.min')
require('packs/bootstrap')
require('packs/inspinia')
require('packs/gallery')

import WOW from 'wow.js/dist/wow.js';
// Activate WOW.js plugin for animation on scrol
new WOW().init();

$(document).ready(function() {
    $('.footable').footable({ paginate: false });
});
