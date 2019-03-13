var canv = document.getElementById('spiro');
if (canv.getContext) {
    var obj = canv.getContext('2d');
    obj.beginPath();
    
    var R = 64, r = 8, a = 30;
    var x0 = R+r-a , y0 = 0;
    var xc = -118.288718, yc = 34.03106;

    
  obj.moveTo(35 + x0 , 135 + y0);
    //obj.moveTo(150 + 10 * xc, 150 + 10 * yc);
    
    var i = 0.0, cos = Math.cos, sin = Math.sin, pi = Math.PI, nRev = 16;
    for (i = 0.0; i < (pi * nRev); i += 0.01) {
        var x = (R + r) * cos((r / R) * i) - a * cos((1 + r / R) * i) + xc;
        var y = (R + r) * sin((r / R) * i) - a * sin((1 + r / R) * i) + yc;
        obj.lineTo(-1 * x, y + 100);
        //document.writeln(x + "," + y + ",|");
    }
    obj.stroke();
}