// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require_tree .
var counter = 1;
function addInput(divName){
  var newdiv = document.createElement('div');
  newdiv.innerHTML = "<label>Choose Image</label><input id='story_img' name='story[img][]' type='file' /><input id='story_img_display_' name='story[img_display][]' type='checkbox' value='1' /> Display on homepage?"; //"Task Name <input type='text' name='task[name][]'>";
  document.getElementById(divName).appendChild(newdiv);
  counter++;
}