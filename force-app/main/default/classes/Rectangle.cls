public class Rectangle extends AbstractShape {

    private Double length = 0;
    private Double width = 0;

    public Rectangle(Double l, Double w){
        length = l;
        width = w;
    }

    public override Double getArea(){

        return length * width;
    }

}