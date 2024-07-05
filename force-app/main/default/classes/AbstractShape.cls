public abstract class AbstractShape {

    public Integer red;
    public Integer green;
    public Integer blue;

    public abstract Double getArea();

    public virtual Integer getNumberOfSides(){
        return 4;
    }

    public void setColor(Integer r, Integer g, Integer b){
        red = r;
        green = g;
        blue = b;
    }

    public void setToBlack(){
        red = 0;
        green = 0;
        blue = 0;
    }
}