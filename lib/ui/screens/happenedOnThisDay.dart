import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quds1_flutter/provider/happenOnDayProvider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HappenedOnThisDay extends StatefulWidget {
  const HappenedOnThisDay();

  @override
  _HappenedOnThisDayState createState() => _HappenedOnThisDayState();
}

class _HappenedOnThisDayState extends State<HappenedOnThisDay> {

  late FirebaseFirestore _query;
    YoutubePlayerController? _controller ;



 @override
  void initState() {
    _query = FirebaseFirestore.instance;

        var hodData =
        _query.collection("HappenedOnThisDay").doc("GEYokaQrwUtGoHpjSSfG");

    hodData.get().then((value) {

      String video = value.get('vidoe').toString() ;

      setState(() {
    _controller = YoutubePlayerController(
    initialVideoId:YoutubePlayer.convertUrlToId('$video')!,
    flags: YoutubePlayerFlags(
      autoPlay: false,
      mute: true,
    ),
  );



  
});


      print("${value.get('deception').toString()}");
    });


    super.initState();
  }


 
 
  @override
  Widget build(BuildContext context) {


     var info = Provider.of<HappenOnDayProvider>(context, listen: true);
     info. setdatadicreption();


    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
             Container(
                  child: _controller !=null?
                   YoutubePlayer(
            controller: _controller!,
            showVideoProgressIndicator: true,
          ):Container(width: double.infinity,height: 150,color: Colors.amber,)
    

          )
          ,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              '${info.dicreption}',
              style: TextStyle(color: Colors.black, fontSize: 26),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}

