// OPTIMISATION PARAMETRIQUE: FLEXION + CISAILLEMENT DE POUTRE NID d'ABEILLE
long=80;
haut=40;
epais=1;
radius=2;
distance=130;
largeur=27;
dep=1;
a=5;
epsi=2;
nnx=20;
nny=7;
 
 module cells(aa=5,ee=1,ll=27) {
 union() {
 cylinder( ll, aa, aa, $fn=6 , center =true );
     translate ([3/2*aa+sqrt(3)/2*ee,-a*sqrt(3)/2-ee/2,0] ) cylinder( ll, aa, aa, $fn=6 , center =true ); }
 }
 

 module arrays(nx,ny) {
 union(){
    for (i=[1:1:nx]) {
        for (j=[1:1:ny])
        {
            translate([(3*a+sqrt(3)*epsi)*(i-1),(-sqrt(3)*a-epsi)*(j-1),0])
            cells(a,epsi,largeur+2*epais); } }
    }
}

module honeycomb(nx,ny)
difference() {
cube([long,haut,largeur],center=true);
translate([-long/2,haut/2,0]) arrays(nx,ny);}
        


union(){
    
translate([0,haut/2+epais/2,0]) cube([long,epais,largeur],center=true);
translate([0,-haut/2-epais/2,0]) cube([long,epais,largeur],center=true);
honeycomb(nnx,nny);
}
