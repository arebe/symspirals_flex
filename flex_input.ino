// flex_input.ino
// Based on the SIK Circuit #9 flex sensor
// uses serial handshaking to establish contact w Processing
// rfboyce@gmail.com
// 07 Apr 2013

// Define the analog input pin to measure flex sensor position:

const int flexpin = 0; 

int inByte = 0;         // incoming serial byte


void setup() { 
  // Use the serial monitor window to help debug our sketch:
   
  Serial.begin(9600);
  
  establishContact();  // send a byte to establish contact until receiver responds 
} 


void loop() { 
  int flexposition;    // Input value from the analog pin.

 // if we get a valid byte, read analog ins:
  if (Serial.available() > 0) {
    // get incoming byte:
    inByte = Serial.read();

  // Read the position of the flex sensor (0 to 1023):
  
  flexposition = analogRead(flexpin);

  // change the below values to correspond to the range of flex sensor readings
  // and re-map to 0-255

  flexposition = map(flexposition, 690, 910, 0, 255);
  flexposition = constrain(flexposition, 0, 255);

  Serial.println(flexposition);
  delay(20); 
  }
} 

void establishContact() {
  while (Serial.available() <= 0) {
    Serial.println('A');   // send a capital A
    delay(300);
  }
}
