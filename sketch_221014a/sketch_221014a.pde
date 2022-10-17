boolean signal = false;
int num = 100;
int[] tmp;
int[][] vectors = new int[num][2];
PImage img;

void setup() {
    size(717, 1469);
    background(255);
    frameRate(60);
    img = loadImage("source2_.jpg");
    strokeWeight(2);
    initiateLines();
}

int[] lineUnits(int cord_x, int cord_y) {
    float cutoff=random(2, 15);
    float angle=random(2);
    int loc = cord_x + (cord_y * img.width);
    stroke(img.pixels[loc]);    
    
    int delta_x = int(cutoff * cos(angle * PI));
    int delta_y = int(cutoff * sin(angle * PI));

    line(cord_x, cord_y, cord_x + delta_x, cord_y + delta_y);

    int[] cord_new={cord_x + delta_x, cord_y + delta_y};
    if (cord_new[0] < 0 || cord_new[0] > width || cord_new[1] < 0 || cord_new[1] > height) {
        cord_new[0] = int(random(350, 367));
        cord_new[1] = int(random(450, 500));
    }
    return cord_new;

    // if (signal == true) {
    //     lineUnits(cord_x + delta_x, cord_y + delta_y);
    // }
}

void initiateLines() {
    for (int i = 0; i < num; i++) {
        vectors[i][0] = int(random(350, 367));
        vectors[i][1] = int(random(450, 500));
    }
}

void draw() {
    for (int i = 0; i < num; i++) {
        tmp = lineUnits(vectors[i][0], vectors[i][1]);
        vectors[i][0] = tmp[0];
        vectors[i][1] = tmp[1];
    }
}

void keyPressed() {
    if (key == 'r') {
        background(255);
        initiateLines();
    }
}