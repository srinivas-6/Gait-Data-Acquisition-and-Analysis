Instructions

------------------------------------------------------------------------------------------------------------------
Note : For files "Sole_IMU_Logger" and "Soleonline" the COM Ports need to be tweaked in the Void Setup instruction

COM3=new Serial(this,Serial.list()[0], 115200);

The respective COM ports (Bluetooth or USB) can be chosen by Changing the number under "Serial.List ()[?]"
------------------------------------------------------------------------------------------------------------------


1) Soleonline folder is used to view Online Visualization of the Plantar Pressure Insole

2) Soleoffline folder is used to view Offline Visualization of the Plantar Pressure Insole 
   (a) It requires the csv file of the stored Plantar pressure data

3) Sole_IMU_Logger splits the data stream obtained via bluetooth into three individual csv files - 
   IMU1, IMU2 and Plantar Pressure Distribution

4) Sole_Plantar_Zone_Differentiator splits the Plantar Pressure Distribution data into 8 invidual anatomical 
   of the foot 
   (a) It requires the csv file of the stored Plantar pressure data