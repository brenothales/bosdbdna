var rowCount = 24, animationDelay = 0.25;
        
var dnaDiv = document.getElementById('dna');
for (var i = 1; i <= rowCount; i++) {
  dnaDiv.innerHTML += '<div class="rowdna">' +
    '<div class="mol"></div>' +
    '<div class="vine"></div>' +
    '<div class="vine"></div>' +
    '<div class="mol"></div>' +
    '</div>';
}

var addAnimationDelay = function () {
var rows = document.querySelectorAll(".rowdna");

_.each(rows, function (row, rowIndex){
    var children = row.querySelectorAll('div');

    _.each(children, function (child){
      child.style.WebkitAnimationDelay = animationDelay*rowIndex + 's';
    });            
  });
};

addAnimationDelay();