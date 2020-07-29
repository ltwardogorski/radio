//zmienne globalne
sizeX=90;
sizeY=70;
sizeZ=70;
    //wymiary BOXa
    
size=3;
    //szerokość ścianki BOXa
    
margin=1;
    //margines błędu

$fn=100;

//zmienne koniec

module obudowa (sizeX,sizeY,sizeZ,size) {
   
    difference() {
    cube([sizeX,sizeY,sizeZ]);
    translate([size,size,0])cube([sizeX-2*size,sizeY-2*size,sizeZ-size]);
        
    translate([2*size,sizeY+margin, sizeZ-6*size])rotate([90,0,0]){
        cylinder(h=2*size, r=2*margin);}
    //otwór na kabel antenowy
        
   translate([2*size,sizeY-size-5,sizeZ-size-4])rotate([0,-90,0]){
        cylinder(h=2*size, r=3);}
    //otwór na jack
    
    translate([sizeX-size-15.5,sizeY-size, sizeZ-3*size]){
        cube([8,size,4]);}
    //otwór na micro USB
 
    translate([sizeX-size-20,sizeY-size, 5*size]){
        cube([18,size,12]);}
    //otwór na włącznik      
        
    translate([sizeX-9*size,size, 8*size])rotate([90,0,0]){
        cylinder(h=2*size, r=4.5);}
    //otwór na potencjometr strojenia
        
    translate([8*size,size, 8*size])rotate([90,0,0]){
        cylinder(h=2*size, r=4);}
    //otwór na potencjometr głośnoście
        
    translate([size,sizeY-9*size, 8*size])rotate([0,-90,0]){
        cylinder(h=2*size, r=4.5);}
    //otwór na przełącznik zakresów

    glosnik(sizeX,sizeY,sizeZ,size,2,sizeY/3);
        //d=sizeY/4
    }
    
    
}

module ramki (sizeX,sizeY,sizeZ,size) {

high=25;
module_usb=58;
li_ion=22;
// zmienne 
    
    translate([size,size+li_ion,sizeZ-3*size])cube([sizeX-size,size,size*2]);
    // ramka ogniwo

    translate([size+module_usb,size+li_ion,sizeZ-3*size])cube([size,sizeY-size-li_ion,size*2]);
    // ramka usb-RF

    translate([sizeX-2*size-20,sizeY-size-30,sizeZ-3*size])cube([25,size,size*2]);
    // ramka USB mała
   
    translate([size,size,sizeZ-high])cube([sizeX-size,size,size]);
    translate([size,sizeY-2*size,sizeZ-high])cube([sizeX-size,size,size]);
    // ramka denko_1
    
    translate([3*size,size,size])cube([sizeX-6*size,size,size]);
    translate([3*size,sizeY-2*size,size])cube([sizeX-6*size,size,size]);
    // ramka denko_2
}

    

module denko_1(sizeX,sizeY,size)
{

   difference() {
       
   translate([sizeX+size+0.5*margin, size+0.5*margin, 0]){cube(size=[sizeX-2*size-margin,sizeY-2*size-margin,size-margin]);}
        
   translate([sizeX+size+0.5*margin, sizeY/2-2*size-2*margin, 0])cube([size,sizeY/2,size]);
   //lewe wcięcie
       
   translate([2*sizeX-2*size, sizeY/2-2*size-2*margin, 0])cube([size,sizeY/2,size]);
   //prawe wcięcie
    
   }
}

module denko_2(sizeX,sizeY,size)
{
    difference() {
    translate([sizeX+size+0.5*margin,sizeY + size+0.5*margin, 0]){
        cube(size=[sizeX-2*size-margin,sizeY-2*size-margin,size-margin]);}
        
    translate([sizeX+2*size,sizeY+2*size, 0]){  
     cylinder(h=sizeZ/10, r1=size/2, r2=size, center=false);   
      } 
    translate([2*sizeX-2*size,sizeY+2*size, 0]){  
     cylinder(h=sizeZ/10, r1=size/2, r2=size, center=false);   
      } 
    translate([sizeX+2*size,2*sizeY-2*size, 0]){  
     cylinder(h=sizeZ/10, r1=size/2, r2=size, center=false);   
      } 
    translate([2*sizeX-2*size,2*sizeY-2*size, 0]){  
     cylinder(h=sizeZ/10, r1=size/2, r2=size, center=false);   
      } 
     
      
    }
}


module antenna(sizeX,sizeY,sizeZ,size)
{

    translate([size+0.5*margin,sizeY + 2*size+0.5*margin, 0])rotate([0,0,90]){
        cylinder(h=sizeZ, r=size);}
    translate([margin/2,sizeY-size, size])rotate([0,0,0]){
        cube(size=[2*size,3*size,1.5*size]);}
    translate([margin,sizeY+margin/2-size, sizeZ-2*size])rotate([0,0,0]){
        cube(size=[2*size,3*size,1.5*size]);}
   
}

module glosnik(sizeX,sizeY,sizeZ,size,fi,d){
        translate([sizeX-size,d,d-2*fi])rotate([90,0,0]){rotate([0,90,0])
        cylinder(h=2*size, r=1);}    
    
        translate([sizeX-size,d,d])rotate([90,0,0]){rotate([0,90,0])
        cylinder(h=2*size, r=1);}
    
        translate([sizeX-size,d,d+2*fi])rotate([90,0,0]){rotate([0,90,0])
        cylinder(h=2*size, r=1);}
        
        translate([sizeX-size,d,d+4*fi])rotate([90,0,0]){rotate([0,90,0])
        cylinder(h=2*size, r=1);}
        //pierwsza kolumna
        
        translate([sizeX-size,d+2*fi,d-2*fi])rotate([90,0,0]){rotate([0,90,0])
        cylinder(h=2*size, r=1);}
        
        translate([sizeX-size,d+2*fi,d])rotate([90,0,0]){rotate([0,90,0])
        cylinder(h=2*size, r=1);}
    
        translate([sizeX-size,d+2*fi,d+2*fi])rotate([90,0,0]){rotate([0,90,0])
        cylinder(h=2*size, r=1);}
        
        translate([sizeX-size,d+2*fi,d+4*fi])rotate([90,0,0]){rotate([0,90,0])
        cylinder(h=2*size, r=1);}
        //druga kolumna
        
        translate([sizeX-size,d+4*fi,d-2*fi])rotate([90,0,0]){rotate([0,90,0])
        cylinder(h=2*size, r=1);}
        
         translate([sizeX-size,d+4*fi,d])rotate([90,0,0]){rotate([0,90,0])
        cylinder(h=2*size, r=1);}
    
        translate([sizeX-size,d+4*fi,d+2*fi])rotate([90,0,0]){rotate([0,90,0])
        cylinder(h=2*size, r=1);}
        
        translate([sizeX-size,d+4*fi,d+4*fi])rotate([90,0,0]){rotate([0,90,0])
        cylinder(h=2*size, r=1);}
        //trzecia kolumna
        
        translate([sizeX-size,d+6*fi,d-2*fi])rotate([90,0,0]){rotate([0,90,0])
        cylinder(h=2*size, r=1);}
        
         translate([sizeX-size,d+6*fi,d])rotate([90,0,0]){rotate([0,90,0])
        cylinder(h=2*size, r=1);}
    
        translate([sizeX-size,d+6*fi,d+2*fi])rotate([90,0,0]){rotate([0,90,0])
        cylinder(h=2*size, r=1);}
        
        translate([sizeX-size,d+6*fi,d+4*fi])rotate([90,0,0]){rotate([0,90,0])
        cylinder(h=2*size, r=1);}
        //czwarta kolumna
        
        translate([sizeX-size,d+8*fi,d-2*fi])rotate([90,0,0]){rotate([0,90,0])
        cylinder(h=2*size, r=1);}
        
         translate([sizeX-size,d+8*fi,d])rotate([90,0,0]){rotate([0,90,0])
        cylinder(h=2*size, r=1);}
    
        translate([sizeX-size,d+8*fi,d+2*fi])rotate([90,0,0]){rotate([0,90,0])
        cylinder(h=2*size, r=1);}
        
        translate([sizeX-size,d+8*fi,d+4*fi])rotate([90,0,0]){rotate([0,90,0])
        cylinder(h=2*size, r=1);}
        //piąta kolumna
        
        translate([sizeX-size,d+10*fi,d-2*fi])rotate([90,0,0]){rotate([0,90,0])
        cylinder(h=2*size, r=1);}
        
         translate([sizeX-size,d+10*fi,d])rotate([90,0,0]){rotate([0,90,0])
        cylinder(h=2*size, r=1);}
    
        translate([sizeX-size,d+10*fi,d+2*fi])rotate([90,0,0]){rotate([0,90,0])
        cylinder(h=2*size, r=1);}
        
        translate([sizeX-size,d+10*fi,d+4*fi])rotate([90,0,0]){rotate([0,90,0])
        cylinder(h=2*size, r=1);}
        //szósta kolumna
        
        translate([sizeX-size,d+12*fi,d-2*fi])rotate([90,0,0]){rotate([0,90,0])
        cylinder(h=2*size, r=1);}
        
         translate([sizeX-size,d+12*fi,d])rotate([90,0,0]){rotate([0,90,0])
        cylinder(h=2*size, r=1);}
    
        translate([sizeX-size,d+12*fi,d+2*fi])rotate([90,0,0]){rotate([0,90,0])
        cylinder(h=2*size, r=1);}
        
        translate([sizeX-size,d+12*fi,d+4*fi])rotate([90,0,0]){rotate([0,90,0])
        cylinder(h=2*size, r=1);}
        //szósta kolumna
}
module mocowania(sizeX,sizeY,sizeZ,size,fi,margin){
difference(){
     hull(){
translate([margin+size-fi/2-margin/4,margin+size-fi/2-margin/4,size+margin])cylinder(2,size,0);
translate([margin-1,size-margin-1,5*margin])cylinder(2,1,0); 
    }

translate([-1+margin+size-fi/2-margin/4,margin+1-size-margin/4,margin])mirror([1,1,0]) cube([0,0,0]);
translate([margin+size-fi/2-margin/4,margin+size-fi/2-margin/4,margin])mirror([1,1,0]) cylinder(h=size, r=size-1); }
difference(){
translate([margin+size-fi/2-margin/4,margin+size-fi/2-margin/4,1*margin])cylinder(h=size, r=size);
translate([margin+size-fi/2-margin/4,margin+size-fi/2-margin/4,1*margin]) cylinder(h=size-2, r=1.5);
translate([-1+margin+size-fi/2-margin/4,margin+1+size-fi/2-margin/4,1*margin]) cube([0,size-2,size-2]); }
// 1 ucho

difference(){
    
    hull(){
translate([sizeX-size-fi/2,margin+size-fi/2-margin/4,size+margin])cylinder(2,size,0);
translate([sizeX-margin,size-margin-1,5*margin])cylinder(2,1,0); 
    }
translate([sizeX+1-size,margin+1-size-margin/4,margin])mirror([0,1,0]) cube([0,0,0]);
translate([sizeX-size-fi/2,margin+size-fi/2-margin/4,margin])mirror([0,1,0]) cylinder(h=size, r=size-1); }
difference(){
translate([sizeX-size-fi/2,margin+size-fi/2-margin/4,1*margin])cylinder(h=size, r=size);
translate([sizeX-size-fi/2,margin+size-fi/2-margin/4,1*margin]) cylinder(h=size-2, r=1.5);
translate([sizeX+1-size-fi/2,margin+1+size-fi/2-margin/4,1*margin]) cube([0,size-2,size-2]); }
// 2 ucho

difference(){
    
hull(){
translate([sizeX-size-fi/2,sizeY-size-fi/2,size+margin])cylinder(2,size,0);
translate([sizeX-margin,sizeY-margin,5*margin])cylinder(2,1,0); 
    }
translate([sizeX+1-size,sizeY+1-size,1*margin]) cube([0,0,0]);
translate([sizeX-size-fi/2,sizeY-size-fi/2,1*margin]) cylinder(h=size, r=size-1); }
difference(){
translate([sizeX-size-fi/2,sizeY-size-fi/2,1*margin])cylinder(h=size, r=size);
translate([sizeX-size-fi/2,sizeY-size-fi/2,1*margin]) cylinder(h=size-2, r=1.5);
translate([sizeX+1-size-fi/2,sizeY+1-size-fi/2,1*margin]) cube([0,size-2,size-2]); }
// 3 ucho

 


difference(){
    hull(){
translate([margin+size-fi/2-margin/4,sizeY-size-fi/2,size+margin])cylinder(2,size,0);
translate([margin-1,sizeY-margin,5*margin])cylinder(2,1,0); 
    }
   
translate([-1+margin+size-fi/2-margin/4,sizeY+1-size-fi/2,margin])mirror([1,0,0]) cube([0,0,0]);
translate([margin+size-fi/2-margin/4,sizeY-size-fi/2,margin])mirror([1,0,0]) cylinder(h=size, r=size-1); }
difference(){
translate([margin+size-fi/2-margin/4,sizeY-size-fi/2,1*margin])cylinder(h=size, r=size);
translate([margin+size-fi/2-margin/4,sizeY-size-fi/2,1*margin]) cylinder(h=size-2, r=1.5);
translate([-1+margin+size-fi/2-margin/4,sizeY+1-size-fi/2,1*margin]) cube([0,size-2,size-2]); }
// 4 ucho
}

obudowa(sizeX,sizeY,sizeZ,size);
ramki(sizeX,sizeY,sizeZ,size);
denko_1(sizeX,sizeY,size);
denko_2(sizeX,sizeY,size);
antenna(sizeX,sizeY,sizeZ,size);
mocowania(sizeX,sizeY,sizeZ,6,3,size);
//diffrence (róznica)
//unin (scala)
//intersection (część wspólna)