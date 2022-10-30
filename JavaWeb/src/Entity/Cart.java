package Entity;

import java.util.ArrayList;
import java.util.List;

public class Cart {
    public List<Figure> carts;
    public Double totalPrice = 0.0;

    public Cart() {
        carts = new ArrayList<Figure>();
    }

    public Figure add(Figure figure){
        if(this.carts.contains(figure)){
            for (int i = 0; i < carts.size(); i++) {        //遍历
                if(figure.equals(carts.get(i))) {//如果list中存在与oldObject相同的值，则用newObject替换
                    carts.get(i).setNum(carts.get(i).getNum()+1);
                    totalPrice += Double.parseDouble(carts.get(i).getPrice());
                }
            }
        } else {
            this.carts.add(figure);
            this.totalPrice += Double.parseDouble(figure.getPrice());
        }

        return figure;
    }

    public Figure delete(Figure figure){
        if(this.carts.contains(figure)){
            for (int i = 0; i < carts.size(); i++) {        //遍历
                if(figure.equals(carts.get(i))) {//如果list中存在与oldObject相同的值，则用newObject替换
                    carts.get(i).setNum(carts.get(i).getNum()-1);
                    totalPrice -= Double.parseDouble(carts.get(i).getPrice());
                    //数量小于1时删除购物车的商品
                    if(carts.get(i).getNum() == 0){

                        this.carts.remove(figure);
                    }


                }
            }
        }

        return figure;
    }

    public Figure remove(Figure figure){
        this.carts.remove(figure);
        this.totalPrice -= Double.parseDouble(figure.getPrice()) * figure.getNum();
        return figure;
    }
    public int modify(Figure figure){
        return 1;
    }

    public Figure search(Figure figure){
        if(this.carts.contains(figure)){
            for (int i = 0; i < carts.size(); i++) {        //遍历
                if(figure.equals(carts.get(i))) {//如果list中存在与oldObject相同的值，则用newObject替换
                    return carts.get(i);
                }
            }
        }
        return figure;
    }

    public void clear(){
        this.carts.clear();
        this.totalPrice = 0.0;
    }
}
