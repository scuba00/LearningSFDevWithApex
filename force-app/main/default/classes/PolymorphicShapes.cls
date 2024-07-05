public class PolymorphicShapes {
    public static void printArea(AbstractShape s)
    {
        System.debug('The area of our shape is : ' + s.getArea());
    }

    public static void setColor(AbstractShape s, Integer r, Integer g, Integer b){
        s.red = r;
        s.green = g;
        s.blue = b;
    }

    public static void makeBlack(AbstractShape s) {
        s.setToBlack();
    }

}