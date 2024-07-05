public class VirtualExtensionExample extends VirtualExample {
    public VirtualExtensionExample() {
        //call parent constructor
        super();
    }

    public VirtualExtensionExample(String s) {
        //call parent constructor
        super(s);
    }
    
    public void hi() {

        //call parent method
        super.printHello();
    }

}