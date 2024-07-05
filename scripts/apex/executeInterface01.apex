Rectangle r = new Rectangle(5,5);
Circle c = new Circle(1);
PolymorphicShapes.setColor(r, 123, 33, 78);
System.debug('Rectangle has color rgb(' + r.red + ',' + r.green + ',' + r.blue + ')');

PolymorphicShapes.makeBlack(c);
System.debug('Circle has color rgb(' + c.red + ',' + c.green + ',' + c.blue + ')');
