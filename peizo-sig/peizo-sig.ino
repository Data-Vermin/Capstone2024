int PIEZO_PIN_1 = 36;
int PIEZO_PIN_2 = 39;
int PIEZO_PIN_3 = 34;
int PIEZO_PIN_4 = 35;
int PIEZO_PIN_5 = 32;
int PIEZO_PIN_6 = 33;
int PIEZO_PIN_7 = 25;
int PIEZO_PIN_8 = 26;

void setup() {
  Serial.begin(9600); 
}

void loop() {
  // Read the analog values from the piezo buzzers
  int sensorValue1 = analogRead(PIEZO_PIN_1);
  int sensorValue2 = analogRead(PIEZO_PIN_2);
  int sensorValue3 = analogRead(PIEZO_PIN_3);
  int sensorValue4 = analogRead(PIEZO_PIN_4);
  int sensorValue5 = analogRead(PIEZO_PIN_5);
  int sensorValue6 = analogRead(PIEZO_PIN_6);
  int sensorValue7 = analogRead(PIEZO_PIN_7);
  int sensorValue8 = analogRead(PIEZO_PIN_8);
  
  // Print the sensor values to the serial monitor
  Serial.print("Sensor 1: ");
  Serial.print(sensorValue1);
  Serial.print(", Sensor 2: ");
  Serial.println(sensorValue2);
  Serial.print("Sensor 3: ");
  Serial.print(sensorValue3);
  Serial.print(", Sensor 4: ");
  Serial.println(sensorValue4);
  Serial.print(", Sensor 5: ");
  Serial.println(sensorValue5);
  Serial.print(", Sensor 6: ");
  Serial.println(sensorValue6);
  Serial.print(", Sensor 7: ");
  Serial.println(sensorValue7);
  Serial.print(", Sensor 8: ");
  Serial.println(sensorValue8);

  delay(100); // Wait for 1 second before reading again
}
