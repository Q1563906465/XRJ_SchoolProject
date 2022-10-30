package Entity;

import java.util.Objects;

public class Figure {
    private int id;
    private String fname;
    private String price;
    private  int num = 1;
    private String img;
    private String story;

    public Figure() {
    }

    public Figure(String fname, String price, String img) {
        this.fname = fname;
        this.price = price;
        this.img = img;
    }

    public Figure(int id, String fname, String price, String img) {
        this.id = id;
        this.fname = fname;
        this.price = price;
        this.img = img;
    }

    public Figure(String fname, String price, String img,String story) {
        this.fname = fname;
        this.price = price;
        this.img = img;
        this.story = story;
    }

    public Figure(int id, String fname, String price, String img,String story) {
        this.id = id;
        this.fname = fname;
        this.price = price;
        this.img = img;
        this.story = story;
    }

    public Figure(int id, String fname, String price, int num, String img,String story) {
        this.id = id;
        this.fname = fname;
        this.price = price;
        this.num = num;
        this.img = img;
        this.story = story;
    }


    public String getStory() {
        return story;
    }

    public void setStory(String story) {
        this.story = story;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Figure figure = (Figure) o;
//        && num == figure.num && Objects.equals(fname, figure.fname) && Objects.equals(price, figure.price) && Objects.equals(img, figure.img)
        return id == figure.id;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, fname, price, num, img);
    }
}
