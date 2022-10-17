PImage img;
String[] store = {"1.png", "2.png", "3.png", "4.png", "5.png", "6.png", "7.png", "8.png", };

void setup() {
    size(1000, 1000);
    background(64, 64, 64);
}

void blendFig(int num) {
    for (int x=1; x <= 49; x++) {
        fill(0);
        rect(2 * num + x * 20, 0, 2, height);
    }
    img = loadImage(store[num-1]);
    blend(img, 0, 0, width, height, 0, 0, width, height, ADD);
}

void draw() {
    for (int i=1; i <= 8; i++) {
        blendFig(i);
    }
}
