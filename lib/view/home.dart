import 'package:flutter/material.dart';
import 'package:news_app/controller/news_controller.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/view/detaile.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<News> _futureNews;
  

  @override
  void initState() {
     _futureNews=NewsController().getNews();
    super.initState();
  } 

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News App"),
      ),
      body: FutureBuilder<News>(
        future: _futureNews,
        builder: (context,snapshot)
        {
          if(snapshot.hasData){
            return Container(
              padding: EdgeInsets.only(left: 15,right: 15),
          child: ListView.builder(
              itemCount: snapshot.data!.articles.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DetalesPage(article:snapshot.data!.articles[index])));
                  },
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network('data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBISEhEREREPDxERERESEREREREREBERGBQZGRgUGRgcIS4mHB4rHxoYJjomKy80NTU1HCU7QDszPzw0NjEBDAwMEA8QGBESGDQhGiExNDExMTQxMTE0NDE0NDE0NDY0ND8xMTQ0MTQxMTE0MTE0MTQ0NDQxMTQ0NDE1PzQxMf/AABEIAKgBKwMBIgACEQEDEQH/xAAcAAACAgMBAQAAAAAAAAAAAAABAgADBAUGBwj/xABMEAACAQMCBAIGBAgKCAcAAAABAgADBBESIQUGMUETUQciMmFxgRRCUpEjYoKSlKGx0xczNFVydLPB0dIVJENEc4Oi4Qg1RVOEk7L/xAAYAQEBAQEBAAAAAAAAAAAAAAAAAQIDBP/EAB0RAQEBAQADAQEBAAAAAAAAAAABAhEhMVFBEhP/2gAMAwEAAhEDEQA/APIZJJJtzEQySSxEhkhlEhgEbECAQyQiGeIIZIQIEAlixRHUSwOkuWVLL0lRYktQREEtWWMnURwIqyxRKIBLAIojiEMsYQAQiA0ZYojCWCxZYkFKi7DKo7DzVWYfqlv0eoBk03UDqSjAD54lBSZNMzGQy9DLBnUjM+3M1tIzPoNKy3Ns02tvWxOepVsTLS4ks63Lx0dO6lj3M0KXMu+kzFy3NMq4rzE+kTFr3ExfpE3Il08FhEEM80bGGAQyiQiSECUEQyQwiQwQiBBGxDIBESiBHWKI6zSU6y5ZUsy7S3eowRFLMQT2ACjqxJ2AHmYQUm24RwS5umVaNNm1dHb1E+Oo9R8Mzdcs8siqdY0uqthq7Lqohh7S00PtkdNTbDyyJ6fw3h9OiuEG+BqdyWdj+Mx/ZsPICZuvjcx9cjwz0ZpgNdXTEn6lsoGPy3ByPyROmtOReHINrbWfOrUqP/050/qnQ26iC+ufBQvpZwu7YemgUeZZ2AAmLq/XSZzPxyvHrbhtkF1cOptrGA6W1FkBz0LPsG+RM0VF7OuVShYB6nr/AINqdJSw0ghtSpsAc7AZxn3Tv7S4p3dDJQAOCHpVQjlfLUMkEdCPMYmLy/y7StAGHr1yrq9UalDKz6tITJAAwo+UdP5nxxN9y7bNQNanSWk6krVtxXqJUQ9dWqpsnwdRnI33E1dhyuLtGezramT27euuh18sVFyrZ7bL0M9Q4pwO2uixqIDU8M0w4J1IDuCBnGQd9xPNnp3XDLhX9l99JwTSrJncdsjpt1G3TaWaqXM+NJfcMe1YLcpURzuExhT8H3U/k6viJjrcEewET+iPW+Oo5YfIzp+YubatzpVVVKWhfEoutOqpqBmyQ5XOCNPl0Pz072VKoqtRdEqnIa2ckb+dNz1B8mOZ0zrvtz1nnpr3dmOWZmPmxLH9camxUgqSpHQg4I+YlbKQSCCpBwQRgg+REKmdI5s5Kvieq+NR2WodmB7az9Ye87jrnsQuQcEEEHBB2IPlMYTNujipU/pv9+oywXUzMhKk14eWJUlGzWtL0rzVLUlq1YG2S498uFxNOtWWCvAzateY/jTHerKPFgeTiGCGeV2SGSGUQRhAI0oMgkkhBjAQCNCII0AhlBAjrABLKVNnZUQFmYhVUdSxOAJUZFhatVfQuAACzu2yU0HV2Pl+0kCZr3IZltLXKo7qr1CQr1D3dm30qBk46KMnfcnF4vdrRT6LRIJ2Neov16nkD9kbgD4nvF5VxrYuA2p7eimo7Bq1YIwK/WBp+IPdtOetddc555/XuthSp06dNEVVpogCKpOkKBt0+/PWbKi5J8gOgHb49prEc4PXtvjbPvz1mrv+d7S2qNSbxKro2lxTQaUPcZYgEj3TLTuqTYkubVavh6wWFOoKgXUQpYA6SwHtYzkA7ZAPUCcjb8/WBZF8R11hTrNNtKE7aXPYjuenvm24tzNbWtJKz1DUSrnwhRxUNTA3KnIGBtuTjeFZa8NVKlSuaiJUcktVWmqvpwo0FnLerhBsMdMzW8X50tKSkU2+lPq0lEJAxvlixGCNsbZ6+U4bmTnR7xBSWn4FMMWPrl3f1SuCQAAME5G+ZzivLMp12nFeYLe4FN18W0qrqBWgiNsW7udBzgZ22yfMTWXXE6VagiVFqrXpBitY1WqiqzEFtQYZBOABg7TRBodUvAzmUOfljoR1BjsZj1nwN5UrbWh+lnwmIW5A/BuSAKgAJ0MfPHQ/AeWMBkKsVYFWUkMpGCCOoM1yVW1B1JV1IKkHBBByMH4zrrIU+IW7sT/r9ADJLBfHoj6zZ6so6nY4G+ZvN54ctZ/WptnCurNuF9bGMgkDIB9xOAfdmKXOdyST1J6k+czE4bU7lM99OuqB80Vh+uUXNsVwfVYHIDKcgkdR5g7jY4M6dc1atHV5jhowaUZQeOKkxA8OuUZYqRhVmHqh8SBkvVlfiShnieJJ0efySQzzuyQiCMIBEYQCGUQQiCMIQ0gkhERBjCKIyygzZ2rihRe5PtvqpUB8sO4+/SD72mvRGYqqjLMQqjzYnAH3zI5gqKaq0UOadsgpr5Mw9pviTk/lSavIuZ2tSASSx3JOSZt+VbYVLy1RnKqayuevrGnl1XHmcYz21Ga3TACQQQSCCCCDggg5BB7Gc3Z7RzTxF7azrV03dQqpj6jOwQN8s5+InklKqXOcu7HLE7s5JO5J6k5PX3zsOG830btKdpf0mdqrLTequkU2JICsd8q2cbjodxjoNxxChR4Pb1atnRc1axVFJ8SrpA7s24CgnOO5I+QcBQLP7Cs5xn1VLbee06DiPF6da1saCKVNpSq+McALrd1GfnjJ97/dyScSqancVH1uSztqwXbOdRx3zvntN816l1RL3bm3ucnwLs0qhp3SqMFKhRCMqR7Y33AIOMyoqSrL0qTU1EqIqOyVFRwpRyjBHyufVfo3y8o9KofMyjdI8uE1lGofObCm8rKVDgTAqkk7zPqLmYlRYGOJuuUuIrbXtCo+nw3YI5bbSrkDXntpOD8ARNI0XqCJodxzbY+Bd1AFVUYhkCggAYG25O/Q/OYqXLeEdZ1hqiBQ+W2RW1YPVca06EdZuLXhb3XCKd09VqldSWDO/qpRp1HpsCx7BBqJOT6nWcxcXAJCpnQg0pnqRnJYjsSST7s47TWb2OO88pqlJG9g6G+wxGk/0X/uP3kzFbIJBBBBwQRgg+REV3lqVA4COQCBinUPbyRz9n3/AFfhtNJCapNURwVJVgQQSCD1BHURdUpxbqk1ynVBqg4uLxdcqLQao6OMhgEM4OowiCMIBhEAhEqDCII8CCMIojSoIjKIojiB3Po95Na+BuxXWkLeu1MI1IuWcUlZX1ahjBdTjH1Ztm9DVUkseIUssST/AKq/U/8AMm69CP8AI7r+ut/YUpxfM/PfHbK6q29SqtLDM1NTRtmPhMToOQD2x1385z1fLrmeG6/gZq/zhS/RX/eQfwMVf5wpfor/ALyZvEOdL+64VRvuG6Fq0C/+kV00W8LQmWYB/qn2hpycHHYzB9GvNvGeI3qCpUWraUs/SiKdumkNTqeH0AY5dR7PlvtMtAfQrU/nCn+it/nnY8A5TurdNFe+FyFA0N4LI6+5m1nV236/Gea8yc+8cs7qrb1aqUirlkU0bZz4bElDlQfq4982PE+M82W1F7iuq06NMAu+ixbSCQAdKknqR2lG2416JXubirXF5RpCo2dC2zHGwGSdYyTjJPmZiJ6G6y4K8RQYYMCLZwQw6MMVNj74i85cWfgn+kKdRWq071qdeoKVHCW2hQPVx9tl3Azv5RuUebuL3dnxSuaiO1tQU0G0WyBagOpyQcbaATvtse8g238HvEDR+jNxanUoaSPCqWYcbkkNkvqDAnIOciYlT0StkFLxEGkZDUWf1sbkHWMA+W+POYHIfN/GeINer4iVfCsa7UgKdsmLoj8B1AyMg+7zmJyVzzxi9v6Fuaq1afiBrgLSt1xQVhrOrHTfsc77S9ON+noqqD/faZ/+O3+eZKejOoP98T/6G/zzmbjn/ivE776LwlqdshaoKWRT11EXJ8R2qA42GdKjbON+sbjnMvMtgq0a6q7FiyXNOhTq60AwUOldIwSOqhtu4MdqcdLU9Gz4J+lpsCf4lv8APPNnfO/mJ7xy1dVa1hbVq5JrVLZHqEqEOsrlvVAGN+0+flf1V+A/ZNZvUpmGYqKdaqFLsSAFAJLE7AADcw0tTMERS7McKqjJJ90suKi01ZKbB6jKy1KqnKhSMFEPcHoX79B6uS+0e18p8NWjZUbc+utSmzVNwQfGyzKMZGkasfLqZ5Hd0jTqVKROTTqPTJ8yjlT+ye2cOqhqdF1ACtTpsoByApUECeTc60gnEbtRt+ED/norn9bGTF81nc8RpcyZi5g1Tq5Mtm1pn69MAH8ankKD8VJC/Ar5TH1SW9UI6sRldw4HUoRhh81JElZCjMhOSjFSR0ODjIhopaDVEJi5gWFoNUrJkzA5aSSScWxEaKI8AiQSCQSoMeII8IIhgEMoYRliiMsJXtPoS/kd1/XW/sKU4D0yKG4xg5w1G3Bx1wczv/Ql/I7r+ut/YUpyPMXo943d3VS5fwah1kU2arTVhTVjoGAOwxOV9u+fUc7xFbjgdzf2Jy1G5t6tHfIFWi6sKVYdtSk7/lL752H/AIffa4l/RtP21pueYOSLziHC6AumRuLW7VCKhZAtRGqn8GxUYxo0kbbEdsmX+iblG74abw3S018YW+jQ4fOg1NWcdPaEivOfTR/5vV/4VD/8CelcqniCWt+eYsm2FNCPE+j1E8LS/ibUck/U2O/THecXzF6OuNXl1VuKng1C7kIzVkDeGCQgwB2GJn8S5a5ouaT29evTqUnADoalBQwDBgMqoPUDvA77glDhl5w+4o8PCCzr+NSfRTqUwKjIAxCuAcgFTn3TwLhnF63Dk4pZkENcUmtagHRaiVQrE+7Qay/FhPd/RjwC44fYtb3KqtQ3FSoArB10sqAbj4GcRz/6M7y5v61zZrSalXCOwaoqFaunSwweuSNWfxjA4PlrjNXhj3LFXRrrh9SnTx2NVFalV+Wx+ZnofoG4PhLq+Ybuy21Mkb6Vw9TB7gk0/wA0xvSD6Nrm5qWjWK02WjZ0rVw7hMeFkK2/XKnH5InofJvBfoNhbWpxqSmDVwcjxXJZ8HuNTED3AQPGeP8Aovuadwx4dUo3KeIWpIldKdzSAOQCGYZK/aBycZwJrqvG+PcJqJ49W9pat1W5Y16NQL1C6iy9xnSc7jptN8/o24uLyvdUGpW7itWrUHFbDEs5IX1QcZUnrt2Oxg4hyfzHxOpTTiBUJTLaalSpbCmucZISjuSQO4+Ygetcs8ZF/YULsLoNakxZd/VdSyOB7tStj3T57sqbVAoXGyBmZjpSmuBl2Y7Af4gDJwJ9F8D4QllZ0rWmSUo0iuogAsxyWcjsSxJ+c+cjd6kVEXw6QAZUBzk49t2+s+O/QZOAo2mss1k1bhUVqdLOGBWpVI0vUXuqj6ie7q3f7K4bP6p9wMGZJtH0NaqqU6ar7KpTVenshQB0nl3PtTVxG4bpkUc/HwUna8jXni8PoEsGamrUn/F0MQoP5Gg/Oee821w97dMCGGsKCDkeqir/AHSYnlN+mqzATEzITOzkbMvujko32qdP/pGg/rQzF1S2u3q0v+Gf7V5KqtjFJis0QtActBqlZaDVJ040EMEM5tpGixoBhEEIlQRHiRhAYQwCGVDCMsQRlgegejLmw2rrY+CrLdXOoVWqFStRqaoiadO+WRRnP1pv+JelOtRdk+gUzpJG9yy9P+XPJadRkZXRtDoyujDqrqcq3yIBnac3UUrile0xhLumtXA6I/SonxVww+Uxqfrpi98NufTLVH/p9L9Kf93FPpoq/wA3U/0pv3c80q05jsky6PUf4a6n830/0pv3cKemp8jVw9AuRqIuWJC9zjRvPKSkhSB9MDmNiSBSUgdDrOCOx6SwcwN/7a/nn/CcHybxFa9pS9fVUootKqp9sMnqox9xUDfvv750CeUDfrxxj/sh+ef8I44yfsD84/4TSoJehHfJ+G0DbrxRj0pj87p8dpXccTqBG8NKb1ADpV6jKjHsCwUkfHB+cwNZO2wHkOkdYHFXvpVuabNTq8NWm51AB7h11DJGpc0xqXyI2M8uprpAHkAPuE+gb60p16b0qqB0dSrA9cHuD2PfPuniHMHDBaXNS2FTxvD0evp0H1kD4IydwGH/AGljNjABhEUQia6M+zvq6obenVqU6dR81ERiquSug6sbkadsdI9WpqZmOSWZmJPUknO8xKBxv8R94jl5vLlv4sLQapXmAtNMLNUuumwwX7CIuPJtILD84tKbYAtlhlEBd/eo+r8zhfiwiPVLEsTlmJJPmSckwsBmilojPELzJw5aDMrLRdcdaauGCGYVI0WEQGhEEIlQYRFhEB4wiiESoaMpiCMDAsE7TkyutxRq8Nc+uS9xZk93C/haI+KjUB5q04lTLreu6OlSm7I6Mro6+0jqchh84s7CXl62PErMozAjBBM1T056FdBOJW/0ykqrWTC3lFf9nVI9tR9hsEjy3HUTjrm1Kk5E5O8vWqKRdEzGpxDThR4de1baotaixV0Ow+q47ow7qemP78T29aIQsVGNTBjuepUZ27dO3vPWeU8n8N8e8oggGnTPjVCegVNx97aR856w7ZO3cwL0bvLllFNZkCA6iODEA2mm5l5jp2VMkkPXYHwqXXJ+0+Oi9Pj2garm/nQWpa3tgHuQQKjuMpSBUHp9Z8EbdB3z0nl1Ws9R2d2Z3dizuxyzMTkkw3FV6ju7sXeozO7HqzE5JigSxEEIgxCTiWeWbeRaDgYg1SrVBqnSeHGrS8BeVFopaXoyhXwhQADUwLHfJAGy/AZJ+7yEpLyovELSdXi0vFLysvELSdXiwvF1SstF1SdVRJJJIDCIJIDCGKI0oMIgkhDiERBHlQwhiRhAYGODK4wMqNlwTi9WzrLWokZwVdG3SrTPtU3HdT+ogEbzsrm2oXtI3Nn0GPGtyQatu57EfWXyYbH3HIHngMybG8qUKi1aNRqdRc4Ze4PVSOhB8jtM6z1rOuNjc2hUnImK1KdDR43b3QxXVbat3df4lz5/iH47e+U3vDiu4wy9mXcETFnHaal9Oi5D4aadKpXYjNcKEUEHCIW3J7Ent7p1aHp95+7pMDhyLStUJfWiIMMMD1QNgP2Tl77nKoGIoIgQOcO6klk6YK5+ec/KRXoFPG/fBwfccZ/vE1XGOZ7a11IzGpUXGaVPdgT9onZf2zzu/wCOXFap4jOabaAn4EvTBUEnBwcnqep7zWEQL+JcUr3DM1WrUYMT6mtvDUZyFC9MD4dprysvKxSsCnEmJY20x6lbsv3yydZupPZnbHxlJaIWilp0k446105aDVEzAWlFhaKWlZaLqkFpaIXiFoC0nVMWgLRC0UtIpy0GqJmDMKkMEMIMkEMCCMDFkEoeGCSEGMDFklFkmYoMaEMDCDEBjAyhwYcxAYwMIcGZNtfVKeyOQv2Tun3GYYMbMcPTcLxlihpv/FtuVxrQH7QB3U+8GVfSE3AKn3kMCJrZMzP8xqb1Gx8RftL94kNRftL9812YMyfyv+l+M9rhR3z8BKHuvIY95mMTATL/ADEu9UzOT1OYhMmYuZpBzFJkJikyAkxcwZgJhUJgJkJi5maCTFJgzATCwcwZgzBCiTBmAySWh5JJJUGGSSBJJJJQQY0kkCQySSokIMkkBgYZJJUMDCJJIBzIJJIQcw5hkgLJJJAhMUySQATATJJIQmYDJJCgTFMkkilMBkkhQgMkkhAgkkkqpJJJA//Z'),
                        Text('${snapshot.data!.articles[index].title}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
                        Text('${snapshot.data!.articles[index].publishedAt}',style: TextStyle(fontWeight: FontWeight.normal,fontSize:10),),
                        Padding(padding: EdgeInsets.only(top:10)),
                        Text('${snapshot.data!.articles[index].content}'),
                      ],
                    ),
                  ),
                );
              }));
          }else{
            return Text("no data");
          }
          
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        selectedFontSize: 16.0,
        items: [
         BottomNavigationBarItem(
           icon: Icon(Icons.home),
           title: Text("Home"),
         ),
         BottomNavigationBarItem(
           icon: Icon(Icons.sports_baseball),
           title: Text("Sport"),
         ),
         BottomNavigationBarItem(
           title:Text('Business'),
           icon: Icon(Icons.business) 
           ),
        ],
      ),
    );
  }
}