var fill_color = 0;
var pg;
var canvas;
var canvasWidth = 1008;
var canvasHeight = 500;

function setup() {
    var canvas = createCanvas(1008, 500);
    canvas.parent("p5canvas");
    background(255);

    noStroke();
    pg = createImage(200, 200);
    pg.loadPixels();
    for (i = 0; i < pg.width; i++) {
        for (j = 0; j < pg.height; j++) {
            pg.set(i, j, color(255, 0, 0));
        }
    }
    pg.updatePixels();
}

function draw() {
    for (var i = 0; i < canvasWidth; i += 36) {
        if (fill_color == 0)
            fill_color = 255;
        else
            fill_color = 0;
        fill(fill_color);
        rect(i,0,36,canvasHeight);
    }

    // pg.background(255, 0);
    // pg.noStroke();
    // pg.fill(255);
    // pg.ellipse(50, 50, 100, 100);

    // image(pg, mouseX-100, mouseY-100);
    blend(pg, 0, 0, 33, 100, 67, 0, 33, 100, ADD);
    // blend(pg, 0, 0, canvasWidth, canvasHeight, 0, 0, canvasWidth, canvasHeight, DIFFERENCE);
}