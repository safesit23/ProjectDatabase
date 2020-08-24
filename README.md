# ProjectDatabase
Project INT207 Information Management

## ขอบเขตการทำงานของระบบ
ระบบการจัดการดูแลสัตว์ในสวนสัตว์ เพื่อให้การจัดการดูแลสัตว์ในสวนสัตว์ง่ายขึ้น อำนวยความสะดวกให้แก่พนักงานในการดูแลในการบริหารจัดการสวนสัตว์ แก้ปัญหาความซ้ำซ้อนของข้อมูลในแต่ละฝ่าย สามารถดูข้อมูลต่างๆในสวนสัตว์ได้เช่น สัตว์ชนิดนั้นอยู่โซนไหนหรืออยู่กรงไหน รวมไปถึงสามารถดูว่ามีพนักงานคนไหนที่ดูแลสวนสัตว์อยู่ และแต่ละคนมีหน้าที่ดูแลพื้นที่ใดของสวนสัตว์บ้าง

## Logical Database
![ก่อน Denormalization](/diagram/BeforeDenormalization.png)
![ก่อน Denormalization](/diagram/Denormalization.png)

## ผู้ใช้งาน, บทบาท, หน้าที่ ของผู้ใช้งานแต่ละคน
### ผู้ใช้งาน (User)
1. ผู้จัดการ
   - สามารถดูและจัดการข้อมูลทุกอย่างในระบบได้ 
   - สามารถ select, insert, update, delete ตาราง Animal, Taxonomy, Area, Zone, Management และ staff ได้
2. พนักงานดูแลสัตว์
   - ดูแลสัตว์ รู้ข้อมูลสัตว์ อนุกรมวิธาน 
   - สามารถ select, insert, update, delete ตาราง Animal, Taxonomy, Area, Zone, Management ได้
3. สัตวแพทย์
   - สามารถดูแลอาการป่วยของสัตว์และดูแลข้อมูลสัตว์ 
   - select ตาราง Animal, Taxonomy, Area, Zone และ Management ได้ 
   - สามารถ update คอลัมน์ status ในตาราง Animal ได้
4. ประชาสัมพันธ์
   - คอยให้ข้อมูลสัตว์และสถานที่แก่ลูกค้า 
   - สามารถ select ตาราง Animal, Area และ Zone ได้
5. พนักงานทำความสะอาด
   - รู้โซนของสัตว์ว่าอยู่โซนไหนแหล่งใด
   - สามารถ select ตาราง Animal, Area และ Zone ได้   
### บทบาท (Role)
1. ผู้จัดการ (Zoo Manager)
   - Select, Insert, Update, Delete ตาราง Animal, Taxonomy, Area, Zone, Management, Staff ได้
2. พนักงานดูแลสัตว์
   - Select, Insert, Update, Delete ตาราง Animal, Taxonomy, Area, Zone, Management ได้
3. สัตวแพทย์ (Zoo Vet)
   - Select ตาราง Animal, Taxonomy, Area, Zone, Management ได้ 
   - Update column status ในตาราง Animal ได้
4. พนักงานทั่วไป (Zoo Staff)
   - Select ตาราง Animal, Area และ Zone ได้
