/* Bezier curve with any number of control points.

Modified version of code originally written by CHRISTIAN LIMBERG, found at:
http://climberg.de/page/openscad-implementation-of-bezier-curves-of-any-degrees/

- Fixed end control point extending beyond the final end point.
- Fixed minimum number of faces to be at least the number of end points-1.
- Utilising $fn rather than an explicit variable for defining the number of faces.

*/
function _choose(n, k)=
     k == 0? 1
    : (n * _choose(n - 1, k - 1)) / k;
 
function _point_on_bezier_rec(points,t,i,c)=
    len(points) == i ? c
    : _point_on_bezier_rec(points,t,i+1,c+_choose(len(points)-1,i) * pow(t,i) * pow(1-t,len(points)-i-1) * points[i]);
 
function _point_on_bezier(points,t)=
    _point_on_bezier_rec(points,t,0,[0,0]);
 
// 
function bezier(points)=[
    for (t =[0:1.0/max($fn, len(points)-1):1]) _point_on_bezier(points,t)
    ];

p0 = [10, 10];
p1 = [10, 45];
p2 = [45, 10];
curve = [p0,p1,p2];

points = bezier(curve, $fn=5);
polygon(points);