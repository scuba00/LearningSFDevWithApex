public virtual class VirtualExample {
    public VirtualExample() {
        this('default');
    }

    public VirtualExample(String s) {
        System.debug(s);
    }

    public void printHello() {
        System.debug('Hello');
    }
}