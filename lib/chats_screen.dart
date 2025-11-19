import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:myapp/chat_messaging_screen.dart';
import 'package:shimmer/shimmer.dart';

class ChatModel {
  final String name;
  final String message;
  final String time;
  final String imgPath;
  final bool status;
  final int? messNum;

  ChatModel({
    required this.name,
    required this.message,
    required this.time,
    required this.imgPath,
    this.status = false,
    this.messNum,
  });
}

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});
  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  late List<ChatModel> items;

  @override
  void initState() {
    super.initState();
    items = [
      ChatModel(
        name: "John Doe",
        message: "Hello there!",
        time: "12:30 PM",
        imgPath: "https://picsum.photos/seed/p1/200/200",
        status: true,
        messNum: 2,
      ),
      ChatModel(
        name: "Jane Doe",
        message: "How are you?",
        time: "12:35 PM",
        imgPath: "https://picsum.photos/seed/p2/200/200",
      ),
      ChatModel(
        name: "Peter Jones",
        message: "See you soon.",
        time: "12:40 PM",
        imgPath: "https://picsum.photos/seed/p3/200/200",
        status: true,
        messNum: 1,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('myapps'),
        actions: <Widget>[
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          )
        ],
      ),


      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ListView.separated(
            itemBuilder: (ctx, i) {
              return ListTile(
                onTap: () {
                  Navigator.of(context).push(
                    createRoute(
                      items[i].imgPath,
                      items[i].name,
                      items[i].time,
                      items[i].status ? "Online" : "Offline",
                      items[i].message,
                      context,
                    ),
                  );
                },
                leading: CircleAvatar(
                  radius: 28,
                  child: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: items[i].imgPath,
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          width: 56,
                          height: 56,
                          color: Colors.white,
                        ),
                      ),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                      fit: BoxFit.cover,
                      width: 56,
                      height: 56,
                    ),
                  ),
                ),

                  title:items[i].status ?
                  Text(items[i].name,style: const TextStyle(fontWeight: FontWeight.bold),):
                Row(children: [
                  Text(items[i].name,style: const TextStyle(fontWeight: FontWeight.bold),),
                  Icon(Icons.volume_mute,size: 18,color: Colors.grey[400],)
                ],),
                subtitle:Text(items[i].message,style: const TextStyle(color: Colors.grey),),


                trailing:
                items[i].messNum!=null ?

                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [


                    Text(items[i].time),

                    const SizedBox(height: 7,),


                    Container(

                      decoration: BoxDecoration(
                          color: items[i].status?Colors.green:Colors.grey[400],
                        borderRadius: BorderRadius.circular(30)
                      ),
                      child:Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('${items[i].messNum}',style: const TextStyle(color: Colors.white),),
                      ),
                    )

                  ],
                ):

                Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [

              Text(items[i].time),

              const SizedBox(height: 7,),

              ],)





              );
            },
            separatorBuilder: (ctx, i) {
              return const Divider();
            },
            itemCount: items.length),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFF65a9e0),
          onPressed: (){},
          child: const Icon(Icons.create,color: Colors.white,)
      ),
    );
  }
}
