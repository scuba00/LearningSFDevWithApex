public class Circle extends AbstractShape {

    private Double radius = 0;

    public Circle(Double r) {
        radius = r;
    }

    public override Double getArea(){
        return Math.PI * radius * radius;
    }

    public override Integer getNumberOfSides(){
        return 1;
    }

}