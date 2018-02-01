/* Bezier curve with any number of control points.

Modified version of code originally written by CHRISTIAN LIMBERG, found at:
http://climberg.de/page/openscad-implementation-of-bezier-curves-of-any-degrees/

*/
function choose(n, k)=
     k == 0? 1
    : (n * choose(n - 1, k - 1)) / k;
 
function _point_on_bezier_rec(points,t,i,c)=
    len(points) == i ? c
    : _point_on_bezier_rec(points,t,i+1,c+choose(len(points)-1,i) * pow(t,i) * pow(1-t,len(points)-i-1) * points[i]);
 
function _point_on_bezier(points,t)=
    _point_on_bezier_rec(points,t,0,[0,0]);
 
//a bezier curve with any number of control points
//parameters: 
//points - the control points of the bezier curve (number of points is variable)
//resolution - the sampling resolution of the bezier curve (number of returned points)
//returns:
//resolution number of samples on the bezier curve
function bezier(points,resolution)=[
    for (t =[0:1.0/resolution:1+1.0/resolution]) _point_on_bezier(points,t)
    ];


p0 = [10, 10];
p1 = [10, 45];
p2 = [45, 10];
curve = [p0,p1,p2];

points = bezier(curve, resolution=5);
polygon(points);