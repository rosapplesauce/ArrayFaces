/* Rosa Martinez 
01/29/25
Learning Goal: Students will demonstrate their understanding of 
Object-Oriented Programming and arrays by designing a Die class, 
creating an array of Die objects to form a dynamic grid, 
calculating and displaying the total value of the dice,
and customizing the presentation of their program through HTML elements.*/

int numRows = 8;  // Number of rows of faces
int numCols = 8;  // Number of columns of faces
int faceSize = 70; // Size of each face
int total;        // Total value of all expressions
PImage f1, f2, f3;
String[] vibe = {"Super Rich", "Pretty Sweet", "Lost"};
String vibeReport;

void setup() {
    size(600, 600);  // Set window size
    noLoop();        // Ensures draw() only runs once

    f1 = loadImage("1.png");
    f2 = loadImage("2.png");
    f3 = loadImage("3.png");


    // Debugging: Check if images loaded
    if (f1 == null) println("Error loading 1.png");
    if (f2 == null) println("Error loading 2.png");
    if (f3 == null) println("Error loading 3.png");

}

void draw() {
    background(255);  // Black background
    total = 0;      // Reset total for each draw
    vibeReport = "";

    // Generate and display faces directly
    for (int i = 0; i < numRows; i++) {
        for (int j = 0; j < numCols; j++) {
            Face face = new Face(j * faceSize +20, i * faceSize +50);
            face.roll();
            face.show();
            total += face.getValue();
        }
    }

    fill(255);
    textSize(24);

    // Assign correct vibe level
    if (total <=125) {
        vibeReport = vibe[0]; // Excellent
    } else if (total <= 130) {
        vibeReport = vibe[1]; // Good
    } else if (total <= 192) {
        vibeReport = vibe[2]; // Fine
    }
        System.out.println(total);

fill(156, 20, 34);
    text("Frank Ocean is: " + vibeReport, 175, 35);
}

void mousePressed() {
    redraw(); // Reset face expression when the mouse is pressed
}

class Face {
    int x, y, value;

    Face(int x, int y) {
        // The "this" keyword distinguishes instance variables from parameters with the same name
        this.x = x;
        this.y = y;
    }

    void roll() {
        value = (int) (Math.random() * 3) + 1; // Generate random value from 1 to 5
    }

    void show() {
        PImage img = null;
        if (value == 1) img = f1;
        else if (value == 2) img = f2;
        else if (value == 3) img = f3;

        
        if (img != null) {
            image(img, x, y, faceSize, faceSize);
        }
    }

    int getValue() {
        return value;
    }
}
