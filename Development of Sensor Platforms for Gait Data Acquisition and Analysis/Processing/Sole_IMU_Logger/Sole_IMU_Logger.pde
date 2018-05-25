PShape sole;
import processing.serial.*;
Serial COM5;
String myString = null;
Table table, Plantar, IMU1, IMU2;
int i=0,j=0, R,G,B, ln=10, k, m, gain=2050, numl, a=0,b=0,c=0,d=0,e=0,f=0,g=0,h=0,x=0;
float val, limiter=0.2, v=0.01, time;

void setup() {
   COM5=new Serial(this,Serial.list()[1], 115200);
  //background(255);
  size(440,600,P2D);
  frameRate(30);
  background(255);
  //sole = loadShape("sole.svg");
  //shape(sole, 0, 0, 440, 600);
  
  //table = loadTable("RGB.csv");
  //noStroke();
  Plantar = new Table();
  Plantar.addColumn("timestamp millis");
  Plantar.addColumn("Plantar Pressure Voltage");
  
  IMU1 = new Table();
  IMU1.addColumn("timestamp millis");
  IMU1.addColumn("GyrX");
  IMU1.addColumn("GyrY");
  IMU1.addColumn("GyrZ");
  IMU1.addColumn("AccX");
  IMU1.addColumn("AccY");
  IMU1.addColumn("AccZ");
  IMU1.addColumn("Complementary_Filter_Angle_Calculated");
  IMU1.addColumn("Complementary_Filter_Angle");
  IMU1.addColumn("Kalman_Filter_Angle");

  IMU2 = new Table();
  IMU2.addColumn("timestamp millis");
  IMU2.addColumn("GyrX");
  IMU2.addColumn("GyrY");
  IMU2.addColumn("GyrZ");
  IMU2.addColumn("AccX");
  IMU2.addColumn("AccY");
  IMU2.addColumn("AccZ");
  IMU2.addColumn("Complementary_Filter_Angle_Calculated");
  IMU2.addColumn("Complementary_Filter_Angle");
  IMU2.addColumn("Kalman_Filter_Angle");
 
}
  



void draw(){
  
myString=null;
myString = COM5.readStringUntil('\n');
if (myString != null) {
  //println(myString);  // Prints String
  

String[] Sensor=split(myString, ';');
float nums [] = float(split(Sensor[0], ','));
float imus1 []= float(split(Sensor[1],','));
float imus2 []= float(split(Sensor[2],','));
time=float(Sensor[3]);
numl=nums.length;

if(numl>63)
{  
TableRow newRow = Plantar.addRow();
newRow.setFloat("timestamp millis", time);
newRow.setString("Plantar Pressure Voltage", Sensor[0]);
saveTable(Plantar, "data/Plantar Pressure Distribution.csv");

TableRow newRow1 = IMU1.addRow();
newRow1.setFloat("timestamp millis", time);
newRow1.setFloat("GyrX", imus1[0]);
newRow1.setFloat("GyrY", imus1[1]);
newRow1.setFloat("GyrZ", imus1[2]);
newRow1.setFloat("AccX", imus1[3]);
newRow1.setFloat("AccY", imus1[4]);
newRow1.setFloat("AccZ", imus1[5]);
newRow1.setFloat("Complementary_Filter_Angle_Calculated", imus1[6]);
newRow1.setFloat("Complementary_Filter_Angle", imus1[7]);
newRow1.setFloat("Kalman_Filter_Angle", imus1[8]);
saveTable(IMU1, "data/IMU1.csv");

TableRow newRow2 = IMU2.addRow();
newRow2.setFloat("timestamp millis", time);
newRow2.setFloat("GyrX", imus2[0]);
newRow2.setFloat("GyrY", imus2[1]);
newRow2.setFloat("GyrZ", imus2[2]);
newRow2.setFloat("AccX", imus2[3]);
newRow2.setFloat("AccY", imus2[4]);
newRow2.setFloat("AccZ", imus2[5]);
newRow2.setFloat("Complementary_Filter_Angle_Calculated", imus2[6]);
newRow2.setFloat("Complementary_Filter_Angle", imus2[7]);
newRow2.setFloat("Kalman_Filter_Angle", imus2[8]);
saveTable(IMU2, "data/IMU2.csv");

}
}
}