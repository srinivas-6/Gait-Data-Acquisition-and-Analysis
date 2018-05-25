//import processing.serial.*;
//Serial COM3;
String myString = null;
Table table1, PlantarZones;
int i=0,i1=0,j=0, R,G,B, ln=10, k=1, m, gain=1050, numl, a=0,b=0,c=0,d=0,e=0,f=0,g=0,h=0,x=0,x1, count=0, ff, mf, bf, bar, time;
float val, limiter=0.4, v=0.01, M01,M02,M03,M04,M05,M06,M07,M08;

void setup() {
  size(1200,600,P2D);
  background(255);
  frameRate(600);
  table1 = loadTable("Plantar Pressure Distribution 3.csv");
  PlantarZones = new Table();
  PlantarZones.addColumn("timestamp millis");
  PlantarZones.addColumn("M01");
  PlantarZones.addColumn("M02");
  PlantarZones.addColumn("M03");
  PlantarZones.addColumn("M04");
  PlantarZones.addColumn("M05");
  PlantarZones.addColumn("M06");
  PlantarZones.addColumn("M07");
  PlantarZones.addColumn("M08");
}

void draw(){

myString = table1.getString(k,1);
time=table1.getInt(k,0);

if (myString != null) {
float nums [] = float(split(myString, ','));
numl=nums.length;



//if(numl>63)
//{
/////////////////
//Plantar region mean 
M01=(nums[49]+nums[50]+nums[51]+nums[52]+nums[53]+nums[54]+nums[55]+nums[56]+nums[57]+nums[58]+nums[59]+nums[60]+nums[61]+nums[62]+nums[63])/15.00;
M02=(nums[28]+nums[29]+nums[30]+nums[33]+nums[34]+nums[37]+nums[38]+nums[41]+nums[42]+nums[45]+nums[46])/11.00;
M03=(nums[31]+nums[32]+nums[35]+nums[36]+nums[39]+nums[40]+nums[43]+nums[44]+nums[47]+nums[48])/10.00;
M04=(nums[13]+nums[14]+nums[18]+nums[19]+nums[23]+nums[24])/6.00;
M05=(nums[15]+nums[20]+nums[25])/3.00;
M06=(nums[16]+nums[17]+nums[21]+nums[22]+nums[26]+nums[27])/6.00;
M07=(nums[0]+nums[3]+nums[4]+nums[8]+nums[9])/5.00;
M08=(nums[1]+nums[2]+nums[5]+nums[6]+nums[7]+nums[10]+nums[11]+nums[12])/8.00;
/////////////////


TableRow newRow = PlantarZones.addRow();
newRow.setInt("timestamp millis", time);
newRow.setFloat("M01", M01);
newRow.setFloat("M02", M02);
newRow.setFloat("M03", M03);
newRow.setFloat("M04", M04);
newRow.setFloat("M05", M05);
newRow.setFloat("M06", M06);
newRow.setFloat("M07", M07);
newRow.setFloat("M08", M08);
saveTable(PlantarZones, "Logger/PlantarZone3.csv");

delay(100);
k=k+1;
//}
}
}
