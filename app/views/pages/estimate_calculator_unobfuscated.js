<script>
function getMetricTotal() {
var length = document.getElementById('length').value;
var width = document.getElementById('width').value;
var height = document.getElementById('height').value;

var dimWeight = (( length * width * height ) / 5000).toFixed(2);
var shippingCost = (20 * dimWeight);

document.getElementById("dimWeight").innerHTML = "Dimensional Weight: "+dimWeight+" kg";
if(shippingCost < 80) {
document.getElementById("cost").innerHTML = "Estimated shipping cost: $80";
}else{
document.getElementById("cost").innerHTML = "Estimated shipping cost: $"+shippingCost.toFixed(2);
}
}

function getImpTotal() {
var length = document.getElementById('length_i').value;
var width = document.getElementById('width_i').value;
var height = document.getElementById('height_i').value;

var dimWeight_i = (( length * width * height ) / 166).toFixed(2);
var dimWeight = (( (length*2.54) * (width*2.54) * (height*2.54) ) / 5000).toFixed(2);
var shippingCost = (20 * dimWeight);

document.getElementById("dimWeight").innerHTML = "Dimensional Weight: "+dimWeight_i+" pounds = "+dimWeight+" kg" ;

if(shippingCost < 80) {
document.getElementById("cost").innerHTML = "Estimated shipping cost: $80";
}else{
document.getElementById("cost").innerHTML = "Estimated shipping cost: $"+shippingCost.toFixed(2);
}
}
</script>
